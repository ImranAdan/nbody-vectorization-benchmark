# N-Body Simulation Benchmark (Audited)

## The Story: "The Math-Errno Penalty"
This benchmark simulates gravitational interactions between 1,500 particles. It originally showed Rust winning, but our **Fairness Audit** revealed that C and C++ were being penalized by a legacy rule (`math_errno`) that forces the compiler to track errors for every `sqrt()` call, preventing SIMD optimization.

### The Algorithm
**Symmetric $O(N^2/2)$ algorithm**. Newton's Third Law ($F_{ij} = -F_{ji}$) is applied to halve the workload.

## The Results (Fairness Audited)
| Language | Time (ms) | Relative | Status |
|----------|-----------|----------|--------|
| **C++**  | **1,067** | **1.0x** | **Winner** |
| C        | 1,100     | 1.03x    | Close Second |
| Rust     | 1,266     | 1.18x    | Third |

## Lead Analyst's Fairness Audit
*   **Flags:** Added `-fno-math-errno` and `-ffinite-math-only` to C/C++.
*   **Result:** With the legacy penalty removed, C++'s optimizer was able to out-schedule Rust's scalar loops.
*   **Conclusion:** In raw floating-point loops, C++ remains the performance king once the compiler is "unlocked."

---
[← Back to Main README](../README.md)