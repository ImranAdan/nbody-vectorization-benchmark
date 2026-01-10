# Computational Benchmarks Lab (Audited)

A multi-language suite comparing **C**, **C++**, and **Rust**. This project underwent a **Fairness Audit** to remove legacy compiler penalties and library biases, resulting in a scientifically honest comparison.

## The Benchmark Stories

### 1. [N-Body Simulation](./nbody-simulation/)
*   **The Story:** "The Math-Errno Penalty" (Legacy rules vs speed).
*   **Winner:** **C++** (1.06s) beats Rust (1.26s).
*   **Lesson:** Raw floating-point loops are still C++'s domain once the compiler is "unlocked."

### 2. [Mandelbrot Set Fractal](./mandelbrot/)
*   **The Story:** "Work-Stealing vs. The World" (Parallel efficiency).
*   **Winner:** **Rust** (12.6 M/s) beats C++ (10.6 M/s).
*   **Lesson:** Rust's **Rayon** library provides superior parallel scheduling out-of-the-box.

### 3. [3D Vertex Transform](./3d-vertex-transform/)
*   **The Story:** "The SIMD Unlock" (Aggressive vectorization).
*   **Winner:** **C++** (639 M/s) beats Rust (389 M/s).
*   **Lesson:** C++ auto-vectorization can be more aggressive than Rust's for coordinate math.

### 4. [SHA-256 Cryptography](./sha256-cryptography/)
*   **The Story:** "The Bit-Crunching Logic" (Raw integer throughput).
*   **Winner:** **Rust** (2.7 MH/s) beats C++ (1.8 MH/s).
*   **Lesson:** Rust is exceptionally fast at pure software bitwise logic and rotations.

### 5. [3D Live Polyglot Visualizer (WIP)](./3d-live-visualizer/)
*   **Status:** Work In Progress. Experimental interactive mode.

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
