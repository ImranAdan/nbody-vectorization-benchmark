#include <atomic>
#include <thread>
#include <vector>
#include <chrono>
#include <cstdio>
#include <cstdint>
#include <cstdlib>
#include <new>

#if defined(__x86_64__) || defined(__i386__)
  #include <x86intrin.h>
  #define SPIN_PAUSE() _mm_pause()
#elif defined(__aarch64__)
  #define SPIN_PAUSE() __asm__ __volatile__("isb")
#else
  #define SPIN_PAUSE() ((void)0)
#endif

// Bounded MPMC Queue (Dmitry Vyukov algorithm)
// Lock-free multi-producer multi-consumer queue

constexpr size_t QUEUE_SIZE = 65536;  // Must be power of 2
constexpr size_t QUEUE_MASK = QUEUE_SIZE - 1;

struct Cell {
    std::atomic<uint64_t> sequence;
    uint64_t data;
};

struct alignas(64) Queue {
    Cell buffer[QUEUE_SIZE];
    alignas(64) std::atomic<uint64_t> enqueue_pos;
    alignas(64) std::atomic<uint64_t> dequeue_pos;

    Queue() {
        for (size_t i = 0; i < QUEUE_SIZE; i++) {
            buffer[i].sequence.store(i, std::memory_order_relaxed);
            buffer[i].data = 0;
        }
        enqueue_pos.store(0, std::memory_order_relaxed);
        dequeue_pos.store(0, std::memory_order_relaxed);
    }

    bool enqueue(uint64_t data) {
        Cell* cell;
        uint64_t pos = enqueue_pos.load(std::memory_order_relaxed);

        for (;;) {
            cell = &buffer[pos & QUEUE_MASK];
            uint64_t seq = cell->sequence.load(std::memory_order_acquire);
            int64_t diff = static_cast<int64_t>(seq) - static_cast<int64_t>(pos);

            if (diff == 0) {
                if (enqueue_pos.compare_exchange_weak(pos, pos + 1,
                        std::memory_order_relaxed, std::memory_order_relaxed)) {
                    break;
                }
            } else if (diff < 0) {
                return false;  // Queue full
            } else {
                pos = enqueue_pos.load(std::memory_order_relaxed);
            }
            SPIN_PAUSE();
        }

        cell->data = data;
        cell->sequence.store(pos + 1, std::memory_order_release);
        return true;
    }

    bool dequeue(uint64_t& data) {
        Cell* cell;
        uint64_t pos = dequeue_pos.load(std::memory_order_relaxed);

        for (;;) {
            cell = &buffer[pos & QUEUE_MASK];
            uint64_t seq = cell->sequence.load(std::memory_order_acquire);
            int64_t diff = static_cast<int64_t>(seq) - static_cast<int64_t>(pos + 1);

            if (diff == 0) {
                if (dequeue_pos.compare_exchange_weak(pos, pos + 1,
                        std::memory_order_relaxed, std::memory_order_relaxed)) {
                    break;
                }
            } else if (diff < 0) {
                return false;  // Queue empty
            } else {
                pos = dequeue_pos.load(std::memory_order_relaxed);
            }
            SPIN_PAUSE();
        }

        data = cell->data;
        cell->sequence.store(pos + QUEUE_SIZE, std::memory_order_release);
        return true;
    }
};

// Benchmark configuration
constexpr int NUM_PRODUCERS = 4;
constexpr int NUM_CONSUMERS = 4;
constexpr uint64_t OPS_PER_PRODUCER = 1000000;

struct ThreadResult {
    uint64_t sum = 0;
    uint64_t ops_completed = 0;
};

void producer_thread(Queue* q, int id, ThreadResult* result) {
    uint64_t base = static_cast<uint64_t>(id) * OPS_PER_PRODUCER;
    uint64_t ops = 0;

    for (uint64_t i = 0; i < OPS_PER_PRODUCER; i++) {
        uint64_t value = base + i + 1;  // Values 1-based
        while (!q->enqueue(value)) {
            std::this_thread::yield();
        }
        ops++;
    }

    result->ops_completed = ops;
}

void consumer_thread(Queue* q, std::atomic<uint64_t>* total_consumed, uint64_t expected_total, ThreadResult* result) {
    uint64_t sum = 0;
    uint64_t ops = 0;

    while (total_consumed->load(std::memory_order_relaxed) < expected_total) {
        uint64_t value;
        if (q->dequeue(value)) {
            sum += value;
            ops++;
            total_consumed->fetch_add(1, std::memory_order_relaxed);
        } else {
            std::this_thread::yield();
        }
    }

    result->sum = sum;
    result->ops_completed = ops;
}

int main() {
    // Aligned allocation for cache efficiency
    void* mem = aligned_alloc(64, sizeof(Queue));
    if (!mem) {
        std::fprintf(stderr, "Failed to allocate queue\n");
        return 1;
    }
    Queue* queue = new (mem) Queue();

    std::atomic<uint64_t> g_total_consumed{0};
    constexpr uint64_t expected_total = NUM_PRODUCERS * OPS_PER_PRODUCER;

    std::vector<std::thread> producers;
    std::vector<std::thread> consumers;
    std::vector<ThreadResult> producer_results(NUM_PRODUCERS);
    std::vector<ThreadResult> consumer_results(NUM_CONSUMERS);

    auto start = std::chrono::high_resolution_clock::now();

    // Start all threads
    for (int i = 0; i < NUM_PRODUCERS; i++) {
        producers.emplace_back(producer_thread, queue, i, &producer_results[i]);
    }
    for (int i = 0; i < NUM_CONSUMERS; i++) {
        consumers.emplace_back(consumer_thread, queue, &g_total_consumed, expected_total, &consumer_results[i]);
    }

    // Wait for producers
    for (auto& t : producers) {
        t.join();
    }
    // Wait for consumers
    for (auto& t : consumers) {
        t.join();
    }

    auto end = std::chrono::high_resolution_clock::now();
    double elapsed_ms = std::chrono::duration<double, std::milli>(end - start).count();

    // Calculate totals
    uint64_t total_produced = 0;
    uint64_t total_consumed = 0;
    uint64_t total_sum = 0;

    for (const auto& r : producer_results) {
        total_produced += r.ops_completed;
    }
    for (const auto& r : consumer_results) {
        total_consumed += r.ops_completed;
        total_sum += r.sum;
    }

    // Calculate expected checksum
    uint64_t expected_sum = 0;
    for (int i = 0; i < NUM_PRODUCERS; i++) {
        uint64_t base = static_cast<uint64_t>(i) * OPS_PER_PRODUCER;
        expected_sum += OPS_PER_PRODUCER * base +
                        OPS_PER_PRODUCER * (OPS_PER_PRODUCER + 1) / 2;
    }

    double ops_per_sec = static_cast<double>(total_consumed) / (elapsed_ms / 1000.0);

    std::printf("elapsed_ms=%.3f ops_per_sec=%.0f produced=%lu consumed=%lu checksum=%lu expected=%lu\n",
                elapsed_ms, ops_per_sec, total_produced, total_consumed, total_sum, expected_sum);

    queue->~Queue();
    free(mem);

    return (total_sum == expected_sum) ? 0 : 1;
}
