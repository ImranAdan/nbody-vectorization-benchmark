#include <iostream>
#include <vector>
#include <chrono>
#include <unistd.h>
#include <sys/wait.h>

#define TOTAL_BYTES (10ULL * 1024 * 1024 * 1024)
#define BUFFER_SIZE (64 * 1024)

int main() {
    int pipe_fds[2];
    if (pipe(pipe_fds) == -1) return 1;

    pid_t pid = fork();
    if (pid == 0) { // Child: Reader
        close(pipe_fds[1]);
        std::vector<uint8_t> buffer(BUFFER_SIZE);
        uint64_t total_received = 0;
        uint8_t checksum = 0;

        while (total_received < TOTAL_BYTES) {
            ssize_t n = read(pipe_fds[0], buffer.data(), BUFFER_SIZE);
            if (n <= 0) break;
            for (ssize_t i = 0; i < n; i++) checksum ^= buffer[i];
            total_received += n;
        }
        std::printf("CHECK:%02x\n", checksum);
        close(pipe_fds[0]);
        exit(0);
    } else { // Parent: Writer
        close(pipe_fds[0]);
        std::vector<uint8_t> buffer(BUFFER_SIZE);
        // Standardized buffer initialization (matches C and Rust)
        for (int i = 0; i < BUFFER_SIZE; i++) buffer[i] = (uint8_t)i;
        auto start = std::chrono::high_resolution_clock::now();
        uint64_t total_sent = 0;

        while (total_sent < TOTAL_BYTES) {
            ssize_t n = write(pipe_fds[1], buffer.data(), BUFFER_SIZE);
            if (n <= 0) break;
            total_sent += n;
        }

        auto end = std::chrono::high_resolution_clock::now();
        double elapsed_ms = std::chrono::duration<double, std::milli>(end - start).count();
        std::printf("elapsed_ms=%.3f throughput_gb_sec=%.3f\n", 
                    elapsed_ms, (TOTAL_BYTES / 1024.0 / 1024.0 / 1024.0) / (elapsed_ms / 1000.0));

        close(pipe_fds[1]);
        wait(NULL);
    }
    return 0;
}
