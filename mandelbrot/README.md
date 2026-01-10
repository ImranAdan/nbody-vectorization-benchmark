# Mandelbrot Set Benchmark (Audited)

## The Story: "Work-Stealing vs. The World"
This benchmark generates a 16-million pixel fractal. It tests how languages handle **heterogeneous workloads** where some pixels take 100x longer to compute than others.

## The Results (Fairness Audited)
| Language | Throughput | Relative | Strategy |
|----------|------------|----------|-------------------|
| **Rust** | **12.67 M/s**| **1.0x** | **Rayon (Work-Stealing)** |
| C++      | 10.67 M/s  | 0.84x    | std::atomic (Dynamic) |
| C        | 9.40 M/s   | 0.74x    | OpenMP (Dynamic) |

## Lead Analyst's Fairness Audit
*   **Fix:** Updated C++ to use a dynamic `std::atomic` counter to match the dynamic nature of Rust and C.
*   **Result:** C++ improved by over 200%, but **Rust still wins**.
*   **Conclusion:** Rust's `Rayon` library uses a sophisticated work-stealing algorithm that is more efficient at keeping CPU cores saturated than a simple atomic counter or OpenMP dynamic loop.

---
[← Back to Main README](../README.md)