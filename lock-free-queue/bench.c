#define _POSIX_C_SOURCE 200809L
#include <stdio.h>
#include <stdlib.h>
#include <stdint.h>
#include <stdatomic.h>
#include <pthread.h>
#include <time.h>
#include <string.h>

#if defined(__x86_64__) || defined(__i386__)
  #include <immintrin.h>
  #define SPIN_PAUSE() _mm_pause()
#elif defined(__aarch64__)
  #define SPIN_PAUSE() __asm__ __volatile__("isb")
#else
  #define SPIN_PAUSE() ((void)0)
#endif

// Bounded MPMC Queue (Dmitry Vyukov algorithm)
// Lock-free multi-producer multi-consumer queue

#define QUEUE_SIZE 65536  // Must be power of 2
#define QUEUE_MASK (QUEUE_SIZE - 1)

typedef struct {
    _Atomic uint64_t sequence;
    uint64_t data;
} Cell;

typedef struct {
    Cell buffer[QUEUE_SIZE];
    _Alignas(64) _Atomic uint64_t enqueue_pos;
    _Alignas(64) _Atomic uint64_t dequeue_pos;
} Queue;

void queue_init(Queue* q) {
    for (uint64_t i = 0; i < QUEUE_SIZE; i++) {
        atomic_store_explicit(&q->buffer[i].sequence, i, memory_order_relaxed);
        q->buffer[i].data = 0;
    }
    atomic_store_explicit(&q->enqueue_pos, 0, memory_order_relaxed);
    atomic_store_explicit(&q->dequeue_pos, 0, memory_order_relaxed);
}

int queue_enqueue(Queue* q, uint64_t data) {
    Cell* cell;
    uint64_t pos = atomic_load_explicit(&q->enqueue_pos, memory_order_relaxed);

    for (;;) {
        cell = &q->buffer[pos & QUEUE_MASK];
        uint64_t seq = atomic_load_explicit(&cell->sequence, memory_order_acquire);
        int64_t diff = (int64_t)seq - (int64_t)pos;

        if (diff == 0) {
            if (atomic_compare_exchange_weak_explicit(&q->enqueue_pos, &pos, pos + 1,
                    memory_order_relaxed, memory_order_relaxed)) {
                break;
            }
        } else if (diff < 0) {
            return 0;  // Queue full
        } else {
            pos = atomic_load_explicit(&q->enqueue_pos, memory_order_relaxed);
        }
        SPIN_PAUSE();
    }

    cell->data = data;
    atomic_store_explicit(&cell->sequence, pos + 1, memory_order_release);
    return 1;
}

int queue_dequeue(Queue* q, uint64_t* data) {
    Cell* cell;
    uint64_t pos = atomic_load_explicit(&q->dequeue_pos, memory_order_relaxed);

    for (;;) {
        cell = &q->buffer[pos & QUEUE_MASK];
        uint64_t seq = atomic_load_explicit(&cell->sequence, memory_order_acquire);
        int64_t diff = (int64_t)seq - (int64_t)(pos + 1);

        if (diff == 0) {
            if (atomic_compare_exchange_weak_explicit(&q->dequeue_pos, &pos, pos + 1,
                    memory_order_relaxed, memory_order_relaxed)) {
                break;
            }
        } else if (diff < 0) {
            return 0;  // Queue empty
        } else {
            pos = atomic_load_explicit(&q->dequeue_pos, memory_order_relaxed);
        }
        SPIN_PAUSE();
    }

    *data = cell->data;
    atomic_store_explicit(&cell->sequence, pos + QUEUE_SIZE, memory_order_release);
    return 1;
}

#include <sched.h>

// Benchmark configuration
#define NUM_PRODUCERS 4
#define NUM_CONSUMERS 4
#define OPS_PER_PRODUCER 1000000

typedef struct {
    Queue* queue;
    _Atomic uint64_t* total_consumed;
    uint64_t expected_total;
    int id;
    uint64_t sum;
    uint64_t ops_completed;
} ThreadArg;

static inline double now_ms(void) {
    struct timespec ts;
    clock_gettime(CLOCK_MONOTONIC, &ts);
    return (double)ts.tv_sec * 1000.0 + (double)ts.tv_nsec / 1.0e6;
}

void* producer_thread(void* arg) {
    ThreadArg* ta = (ThreadArg*)arg;
    Queue* q = ta->queue;
    uint64_t base = (uint64_t)ta->id * OPS_PER_PRODUCER;
    uint64_t ops = 0;

    for (uint64_t i = 0; i < OPS_PER_PRODUCER; i++) {
        uint64_t value = base + i + 1;  // Values 1-based to distinguish from empty
        while (!queue_enqueue(q, value)) {
            sched_yield();
        }
        ops++;
    }

    ta->ops_completed = ops;
    return NULL;
}

void* consumer_thread(void* arg) {
    ThreadArg* ta = (ThreadArg*)arg;
    Queue* q = ta->queue;
    uint64_t sum = 0;
    uint64_t ops = 0;

    while (atomic_load_explicit(ta->total_consumed, memory_order_relaxed) < ta->expected_total) {
        uint64_t value;
        if (queue_dequeue(q, &value)) {
            sum += value;
            ops++;
            atomic_fetch_add_explicit(ta->total_consumed, 1, memory_order_relaxed);
        } else {
            sched_yield();
        }
    }

    ta->sum = sum;
    ta->ops_completed = ops;
    return NULL;
}

int main(void) {
    Queue* queue = aligned_alloc(64, sizeof(Queue));
    if (!queue) {
        fprintf(stderr, "Failed to allocate queue\n");
        return 1;
    }
    queue_init(queue);

    _Atomic uint64_t g_total_consumed = 0;
    uint64_t expected_total = (uint64_t)NUM_PRODUCERS * OPS_PER_PRODUCER;

    pthread_t producers[NUM_PRODUCERS];
    pthread_t consumers[NUM_CONSUMERS];
    ThreadArg producer_args[NUM_PRODUCERS];
    ThreadArg consumer_args[NUM_CONSUMERS];

    // Initialize thread arguments
    for (int i = 0; i < NUM_PRODUCERS; i++) {
        producer_args[i].queue = queue;
        producer_args[i].total_consumed = &g_total_consumed;
        producer_args[i].expected_total = expected_total;
        producer_args[i].id = i;
        producer_args[i].sum = 0;
        producer_args[i].ops_completed = 0;
    }
    for (int i = 0; i < NUM_CONSUMERS; i++) {
        consumer_args[i].queue = queue;
        consumer_args[i].total_consumed = &g_total_consumed;
        consumer_args[i].expected_total = expected_total;
        consumer_args[i].id = i;
        consumer_args[i].sum = 0;
        consumer_args[i].ops_completed = 0;
    }

    double start = now_ms();

    // Start all threads
    for (int i = 0; i < NUM_PRODUCERS; i++) {
        pthread_create(&producers[i], NULL, producer_thread, &producer_args[i]);
    }
    for (int i = 0; i < NUM_CONSUMERS; i++) {
        pthread_create(&consumers[i], NULL, consumer_thread, &consumer_args[i]);
    }

    // Wait for producers
    for (int i = 0; i < NUM_PRODUCERS; i++) {
        pthread_join(producers[i], NULL);
    }
    // Wait for consumers
    for (int i = 0; i < NUM_CONSUMERS; i++) {
        pthread_join(consumers[i], NULL);
    }

    double elapsed_ms = now_ms() - start;

    // Calculate totals
    uint64_t total_produced = 0;
    uint64_t total_consumed = 0;
    uint64_t total_sum = 0;

    for (int i = 0; i < NUM_PRODUCERS; i++) {
        total_produced += producer_args[i].ops_completed;
    }
    for (int i = 0; i < NUM_CONSUMERS; i++) {
        total_consumed += consumer_args[i].ops_completed;
        total_sum += consumer_args[i].sum;
    }

    // Calculate expected checksum
    // Sum of all values: for each producer i, values are (i*OPS + 1) to (i*OPS + OPS)
    uint64_t expected_sum = 0;
    for (int i = 0; i < NUM_PRODUCERS; i++) {
        uint64_t base = (uint64_t)i * OPS_PER_PRODUCER;
        // Sum from (base+1) to (base+OPS) = OPS*base + OPS*(OPS+1)/2
        expected_sum += (uint64_t)OPS_PER_PRODUCER * base +
                        (uint64_t)OPS_PER_PRODUCER * (OPS_PER_PRODUCER + 1) / 2;
    }

    double ops_per_sec = (double)total_consumed / (elapsed_ms / 1000.0);

    printf("elapsed_ms=%.3f ops_per_sec=%.0f produced=%lu consumed=%lu checksum=%lu expected=%lu\n",
           elapsed_ms, ops_per_sec, total_produced, total_consumed, total_sum, expected_sum);

    free(queue);
    return (total_sum == expected_sum) ? 0 : 1;
}
