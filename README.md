# Computational Benchmarks

A collection of cross-language performance benchmarks for various computational kernels and algorithms.

## Current Benchmarks

### 1. [N-Body Simulation](./nbody-simulation/)
A gravitational N-body simulation comparing C, C++, and Rust.
*   **Key Finding:** Rust (Scalar) outperforms C/C++ by ~23% with identical algorithms.
*   **Advanced Implementations:** Includes manual AArch64 Assembly and Symmetric $O(N^2/2)$ optimizations.

### 2. [Mandelbrot Set](./mandelbrot/)
A multi-threaded fractal generator testing raw arithmetic throughput and parallel scaling.
*   **Key Finding:** Rust (using Rayon) is ~18% faster than C (using OpenMP) and ~2.8x faster than C++ (using std::thread).
*   **Story:** Demonstrates how modern work-stealing schedulers (Rayon) handle non-uniform computational workloads more efficiently than static partitioning.

### 3. [3D Vertex Transform](./3d-vertex-transform/)
A high-volume linear algebra benchmark projecting a rotating 250,000-vertex mesh across 100 frames.
*   **Key Finding:** Rust is **~4.4x faster** than C/C++ (425M vs 95M vertices/sec).
*   **Story:** Showcases Rust's ability to trigger aggressive auto-vectorization and inlining for mathematical kernels, significantly outperforming Clang-compiled C/C++ even with identical logic.

## Project Goal
To provide a fair, containerized environment for assessing the execution efficiency of different programming languages across diverse computational tasks.

## Getting Started
Each benchmark is self-contained within its own directory and includes a `run_bench.sh` script that utilizes Docker for reproducible results.

---
License: MIT
