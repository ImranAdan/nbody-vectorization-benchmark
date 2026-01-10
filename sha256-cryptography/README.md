# SHA-256 Cryptography Benchmark (Audited)

## The Story: "The Bit-Crunching Logic"
A pure software test of bitwise operations and integer logic. We removed the hardware-accelerated libraries to see which language handles raw "software-only" logic better.

## The Results (Fairness Audited)
| Language | Hash Rate | Relative | Status |
|----------|------------|----------|--------|
| **Rust** | **2.76 MH/s**| **1.0x** | **Winner** |
| C++      | 1.87 MH/s    | 0.67x    | Second |
| C        | 1.85 MH/s    | 0.67x    | Third |

## Lead Analyst's Fairness Audit
*   **The Equalizer:** Removed the professional `sha2` crate from Rust and used the **exact same code logic** as the C version.
*   **Result:** Rust still outperformed C/C++ by **~50%**.
*   **Analysis:** Rust's compiler is exceptionally good at optimizing bitwise rotations and logical XOR/AND chains. It likely eliminated overhead that the Clang compiler left in the C code.

---
[← Back to Main README](../README.md)