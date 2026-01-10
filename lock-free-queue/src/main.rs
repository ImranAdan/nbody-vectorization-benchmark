use std::sync::atomic::{AtomicU64, Ordering};
use std::thread;
use std::time::Instant;
use std::hint::spin_loop;

// Bounded MPMC Queue (Dmitry Vyukov algorithm)
// Lock-free multi-producer multi-consumer queue

const QUEUE_SIZE: usize = 65536; // Must be power of 2
const QUEUE_MASK: usize = QUEUE_SIZE - 1;

#[repr(C)]
struct Cell {
    sequence: AtomicU64,
    data: u64,
}

#[repr(align(64))]
struct AlignedAtomic(AtomicU64);

// Mimic the C/C++ layout exactly:
#[repr(C, align(64))]
struct Queue {
    buffer: [Cell; QUEUE_SIZE],
    enqueue_pos: AlignedAtomic,
    dequeue_pos: AlignedAtomic,
}

impl Queue {
    fn new() -> Box<Self> {
        unsafe {
            let layout = std::alloc::Layout::new::<Queue>();
            let ptr = std::alloc::alloc_zeroed(layout) as *mut Queue;
            if ptr.is_null() {
                std::alloc::handle_alloc_error(layout);
            }
            // Initialize buffer
            for i in 0..QUEUE_SIZE {
                let cell_ptr = &mut (*ptr).buffer[i] as *mut Cell;
                std::ptr::write(&mut (*cell_ptr).sequence, AtomicU64::new(i as u64));
                (*cell_ptr).data = 0;
            }
            std::ptr::write(&mut (*ptr).enqueue_pos, AlignedAtomic(AtomicU64::new(0)));
            std::ptr::write(&mut (*ptr).dequeue_pos, AlignedAtomic(AtomicU64::new(0)));
            Box::from_raw(ptr)
        }
    }

    #[inline(always)]
    fn enqueue(&self, data: u64) -> bool {
        let mut pos = self.enqueue_pos.0.load(Ordering::Relaxed);

        loop {
            let cell = unsafe { self.buffer.get_unchecked((pos as usize) & QUEUE_MASK) };
            let seq = cell.sequence.load(Ordering::Acquire);
            let diff = seq as i64 - pos as i64;

            if diff == 0 {
                match self.enqueue_pos.0.compare_exchange_weak(
                    pos,
                    pos + 1,
                    Ordering::Relaxed,
                    Ordering::Relaxed,
                ) {
                    Ok(_) => {
                        let cell_ptr = cell as *const Cell as *mut Cell;
                        unsafe {
                            (*cell_ptr).data = data;
                        }
                        cell.sequence.store(pos + 1, Ordering::Release);
                        return true;
                    }
                    Err(p) => pos = p,
                }
            } else if diff < 0 {
                return false; // Queue full
            } else {
                pos = self.enqueue_pos.0.load(Ordering::Relaxed);
            }
            spin_loop();
        }
    }

    #[inline(always)]
    fn dequeue(&self, data: &mut u64) -> bool {
        let mut pos = self.dequeue_pos.0.load(Ordering::Relaxed);

        loop {
            let cell = unsafe { self.buffer.get_unchecked((pos as usize) & QUEUE_MASK) };
            let seq = cell.sequence.load(Ordering::Acquire);
            let diff = seq as i64 - (pos + 1) as i64;

            if diff == 0 {
                match self.dequeue_pos.0.compare_exchange_weak(
                    pos,
                    pos + 1,
                    Ordering::Relaxed,
                    Ordering::Relaxed,
                ) {
                    Ok(_) => {
                        *data = cell.data;
                        cell.sequence.store(pos + QUEUE_SIZE as u64, Ordering::Release);
                        return true;
                    }
                    Err(p) => pos = p,
                }
            } else if diff < 0 {
                return false; // Queue empty
            } else {
                pos = self.dequeue_pos.0.load(Ordering::Relaxed);
            }
            spin_loop();
        }
    }
}

// Safety: Queue uses atomic operations for all shared state
unsafe impl Send for Queue {}
unsafe impl Sync for Queue {}

// Benchmark configuration
const NUM_PRODUCERS: usize = 4;
const NUM_CONSUMERS: usize = 4;
const OPS_PER_PRODUCER: u64 = 1000000;

fn main() {
    let queue: std::sync::Arc<Queue> = std::sync::Arc::from(Queue::new());
    let total_consumed = std::sync::Arc::new(AtomicU64::new(0));
    let expected_total = NUM_PRODUCERS as u64 * OPS_PER_PRODUCER;

    let start = Instant::now();

    // Spawn producer threads
    let mut producer_handles = Vec::with_capacity(NUM_PRODUCERS);
    for id in 0..NUM_PRODUCERS {
        let q = queue.clone();
        producer_handles.push(thread::spawn(move || {
            let base = (id as u64) * OPS_PER_PRODUCER;
            let mut ops: u64 = 0;

            for i in 0..OPS_PER_PRODUCER {
                let value = base + i + 1; // Values 1-based
                while !q.enqueue(value) {
                    thread::yield_now();
                }
                ops += 1;
            }
            ops
        }));
    }

    // Spawn consumer threads
    let mut consumer_handles = Vec::with_capacity(NUM_CONSUMERS);
    for _ in 0..NUM_CONSUMERS {
        let q = queue.clone();
        let tc = total_consumed.clone();
        consumer_handles.push(thread::spawn(move || {
            let mut sum: u64 = 0;
            let mut ops: u64 = 0;

            while tc.load(Ordering::Relaxed) < expected_total {
                let mut value = 0;
                if q.dequeue(&mut value) {
                    sum += value;
                    ops += 1;
                    tc.fetch_add(1, Ordering::Relaxed);
                } else {
                    thread::yield_now();
                }
            }

            (sum, ops)
        }));
    }

    // Wait for producers
    let mut total_produced: u64 = 0;
    for handle in producer_handles {
        total_produced += handle.join().unwrap();
    }

    // Wait for consumers
    let mut total_sum: u64 = 0;
    let mut total_consumed: u64 = 0;
    for handle in consumer_handles {
        let (sum, ops) = handle.join().unwrap();
        total_sum += sum;
        total_consumed += ops;
    }

    let elapsed_ms = start.elapsed().as_secs_f64() * 1000.0;

    // Calculate expected checksum
    let mut expected_sum: u64 = 0;
    for i in 0..NUM_PRODUCERS {
        let base = (i as u64) * OPS_PER_PRODUCER;
        expected_sum += OPS_PER_PRODUCER * base + OPS_PER_PRODUCER * (OPS_PER_PRODUCER + 1) / 2;
    }

    let ops_per_sec = (total_consumed as f64) / (elapsed_ms / 1000.0);

    println!(
        "elapsed_ms={:.3} ops_per_sec={:.0} produced={} consumed={} checksum={} expected={}",
        elapsed_ms, ops_per_sec, total_produced, total_consumed, total_sum, expected_sum
    );

    std::process::exit(if total_sum == expected_sum { 0 } else { 1 });
}
