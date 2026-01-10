# Computational Benchmarks Lab (Audited)

A multi-language suite comparing **C**, **C++**, and **Rust**. This project underwent a **Fairness Audit** to remove legacy compiler penalties and library biases, resulting in a scientifically honest comparison.

> **Audit Status (2026-01-10):** Critical fairness issues identified and CORRECTED. All benchmarks re-run with matching checksums. See [FAIRNESS_AUDIT_REPORT.md](./FAIRNESS_AUDIT_REPORT.md) for full details.

## Results Summary (Post-Audit)

| Benchmark | C | C++ | Rust | Winner |
|-----------|---|-----|------|--------|
| Mandelbrot | 10.0 MPix/s | **10.2 MPix/s** | 9.9 MPix/s | C++ |
| N-Body | 1099 ms | **1065 ms** | 1271 ms | C++ |
| SHA-256 | 1.84 MH/s | 1.78 MH/s | **2.44 MH/s** | Rust |
| 3D Vertex | **650 M/s** | 631 M/s | 404 M/s | C |
| Kernel Pipe | 2.03 GB/s | **2.11 GB/s** | 1.76 GB/s | C++ |

## The Benchmark Stories

### 1. [N-Body Simulation](./nbody-simulation/)
*   **The Story:** "The Math-Errno Penalty" (Legacy rules vs speed).
*   **Winner:** **C++** (1065 ms) beats Rust (1271 ms) by 19%.
*   **Lesson:** Raw floating-point loops are still C++'s domain once the compiler is "unlocked."

### 2. [Mandelbrot Set Fractal](./mandelbrot/)
*   **The Story:** "Work-Stealing vs. The World" (Parallel efficiency).
*   **Winner:** **C++** (10.2 MPix/s) edges out Rust (9.9 MPix/s) by 3%.
*   **Lesson:** In Docker/emulated environments, atomic-based work-stealing matches Rayon.

### 3. [3D Vertex Transform](./3d-vertex-transform/)
*   **The Story:** "The SIMD Unlock" (Aggressive vectorization).
*   **Winner:** **C** (650 M/s) beats Rust (404 M/s) by 61%.
*   **Lesson:** C/C++ auto-vectorization is more aggressive than Rust for trigonometric functions.

### 4. [SHA-256 Cryptography](./sha256-cryptography/)
*   **The Story:** "The Bit-Crunching Logic" (Raw integer throughput).
*   **Winner:** **Rust** (2.44 MH/s) beats C (1.84 MH/s) by 32%.
*   **Key Lesson:** Rust excels at bitwise operations - VALIDATED with matching checksums.

### 5. [Kernel Pipe Throughput](./kernel-pipe-throughput/)
*   **The Story:** "The High-Speed Pipe" (Syscall overhead & memory).
*   **Winner:** **C++** (2.11 GB/s) beats Rust (1.76 GB/s) by 20%.
*   **Key Lesson:** C++ leads in data piping with vectorized XOR loops.

### 6. [3D Live Polyglot Visualizer (WIP)](./3d-live-visualizer/)

---

## Infrastructure
*   **Dockerized:** Every benchmark is containerized for reproducibility.
*   **Audited:** Build flags standardized (`-fno-math-errno`) to ensure fairness.
*   **Verified:** Identical algorithms and bit-perfect checksums.

## How to Run
```bash
# Example: Run the N-Body Benchmark
cd nbody-simulation
./run_bench.sh
```

---
License: MIT
