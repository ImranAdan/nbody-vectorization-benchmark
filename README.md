# N-Body Simulation: Rust vs C/C++ Vectorization Benchmark

A benchmark comparing the performance of C, C++, and Rust implementations of an N-body gravitational simulation. 

## Key Finding: Rust Consistently Wins

After applying **algorithmic optimization** (Symmetry/Newton's 3rd Law) to all implementations, Rust continues to outperform C and C++ by a significant margin. 

| Language | Time (ms) | Relative | Checksum | Algorithm |
|----------|-----------|----------|----------|-----------|
| C        | 1,630     | 1.0x     | 6673.544927 | Symmetric ($N^2/2$) |
| C++      | 1,626     | 1.0x     | 6673.544927 | Symmetric ($N^2/2$) |
| Rust     | **1,260** | **0.77x**| 6673.544927 | **Symmetric ($N^2/2$)** |
| Rust (ASM)| 1,233    | 0.75x    | 6676.618500 | Brute Force ($N^2$) |

*Tested on Apple Silicon (ARM64/aarch64) with Docker*

### Final Conclusion
1.  **Rust is faster than C/C++:** Even with identical algorithms and `restrict` pointers in C, Rust's generated scalar code is ~23% faster than C/C++. 
2.  **Algorithmic Beats Micro-Optimization:** The Symmetric Rust implementation (Scalar) is nearly as fast as the hand-tuned vectorized Assembly implementation, while maintaining bit-perfect correctness.
3.  **LLVM and Rust:** Rust's strict aliasing and ownership model likely allows LLVM to perform more aggressive scalar optimizations than it can for C/C++ in this specific numerical kernel.

## Update: The Solution

We have optimized all implementations to use the **Symmetric** version of the N-Body algorithm. By calculating forces once per pair ($F_{ij} = -F_{ji}$), we halved the computational work. 

The results show that while all languages benefited from the $O(N^2/2)$ optimization, Rust maintained its performance lead over the Clang-compiled C and C++ versions.

## The "Problem" (Debunked)

### The Winning Rust Code
Using standard iterators eliminated bounds checks and allowed LLVM to optimize the scalar loop aggressively:

```rust
for ((((xj, yj), zj), mj), _) in x.iter().zip(&*y).zip(&*z).zip(&*m).zip(0..n) {
    let dx = xj - xi;
    let dy = yj - yi;
    let dz = zj - zi;
    let dist2 = dx * dx + dy * dy + dz * dz + softening;
    let inv = 1.0 / dist2.sqrt();
    let inv3 = inv * inv * inv;
    let s = mj * inv3;
    fx += dx * s;
    fy += dy * s;
    fz += dz * s;
}
```

## The "Problem" (Debunked)

We previously thought the lack of auto-vectorization was a critical failure. However, the scalar Rust code is executing **faster** than the vectorized C code on ARM64. This suggests that for this specific kernel and architecture, the overhead of setting up vector registers or handling the reduction/conditional logic in SIMD might be outweighing the throughput benefits, or that LLVM's scalar optimization for Rust is simply superior here.

### Why C/C++ Vectorizes
The C compiler auto-vectorizes the inner loop, generating ARM NEON SIMD instructions that process **2 double-precision floats per instruction**:

```asm
; C assembly - SIMD vectorized (2 doubles at once)
fmul    v0.2d, v0.2d, v7.2d
fadd    v0.2d, v2.2d, v0.2d
```

### Why Rust Doesn't Vectorize (And Why It Doesn't Matter)
Rust generates scalar instructions:

```asm
; Rust assembly - scalar only
fmul    d0, d0, d7
fadd    d0, d2, d0
```
Despite executing more instructions, the throughput is higher, likely due to better instruction pipelining, lack of vector setup overhead, or better register allocation.

## What We Tried (And Failed)

### Attempt 1: Manual SIMD (portable_simd / std::arch)
- Result: **Incorrect results** and complexity.
- Problem: Floating-point associativity differences caused checksum mismatches. The scalar approach is both simpler and faster.

## Project Structure

```
.
├── bench.c           # C implementation (reference - fastest)
├── bench.cpp         # C++ implementation (matches C)
├── bench.rs          # Rust implementation (7.5x slower)
├── Dockerfile.c      # Docker build for C
├── Dockerfile.cpp    # Docker build for C++
├── Dockerfile.rust   # Docker build for Rust
├── run_bench.sh      # Benchmark runner script
├── asm/              # Generated assembly files
│   ├── bench-c.asm
│   ├── bench-cpp.asm
│   └── bench-rust.asm
└── README.md
```

## Running the Benchmark

### Prerequisites
- Docker Desktop

### Run All Benchmarks
```bash
./run_bench.sh
```

### Run Individual Languages
```bash
# Build and run C
docker build -f Dockerfile.c -t bench-c . && docker run --rm bench-c

# Build and run C++
docker build -f Dockerfile.cpp -t bench-cpp . && docker run --rm bench-cpp

# Build and run Rust
docker build -f Dockerfile.rust -t bench-rust . && docker run --rm bench-rust
```

## The Algorithm

This is a classic **N-body gravitational simulation**:

- **N = 1,500 particles**
- **400 simulation steps** (plus 5 warmup steps)
- **O(n²) complexity** - every particle interacts with every other particle

```
For each timestep:
    For each particle i:
        For each particle j (where j != i):
            Calculate gravitational force from j on i
            Accumulate force
        Update velocity of i
    For each particle i:
        Update position based on velocity
```

## Compiler Flags

### C (Clang)
```
-O3 -flto -mcpu=native -fuse-ld=lld -fno-fast-math -ffp-contract=off
```

### C++ (Clang++)
```
-O3 -flto -mcpu=native -fuse-ld=lld -fno-fast-math -ffp-contract=off
```

### Rust (rustc)
```
-C opt-level=3 -C lto=fat -C codegen-units=1 -C target-cpu=native
-C target-feature=+neon,-fma -C llvm-args=-ffp-contract=off
```

Note: `-fno-fast-math` and `-ffp-contract=off` ensure consistent floating-point behavior across all implementations for fair comparison.

## Conclusions

1. **Auto-vectorization isn't always the answer** - In this case, scalar code compiled with full optimizations beat the auto-vectorized C code.
2. **Idiomatic Rust is fast** - Standard iterators and zip allow the compiler to optimize effectively, removing bounds checks and enabling aggressive scalar optimizations.
3. **Correctness matters** - The scalar implementation is numerically stable and identical to the C/C++ results, whereas manual SIMD attempts introduced subtle errors.

## License

MIT
