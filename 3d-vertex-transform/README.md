# 3D Vertex Transform Benchmark (Audited)

## The Story: "The SIMD Unlock"
A linear algebra benchmark projecting 250,000 vertices. This originally showed a massive Rust lead, but our audit found that the C++ compiler was "blocked" from using SIMD by the `math_errno` legacy requirement.

## The Results (Fairness Audited)
| Language | Throughput | Relative | Status |
|----------|------------|----------|--------|
| **C++**  | **639 M/s**| **1.0x** | **Winner** |
| C        | 610 M/s    | 0.95x    | Close Second |
| Rust     | 389 M/s    | 0.61x    | Third |

## Lead Analyst's Fairness Audit
*   **The Change:** Added `-fno-math-errno`.
*   **The Impact:** C++ throughput jumped from **96 M/s to 639 M/s (a 6.6x increase)**.
*   **Conclusion:** Once the C++ compiler was allowed to ignore `errno`, it performed much more aggressive auto-vectorization than Rust's compiler for this specific coordinate-mapping kernel.

---
[← Back to Main README](../README.md)