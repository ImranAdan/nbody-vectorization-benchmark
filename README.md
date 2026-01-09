# N-Body Simulation: Rust vs C/C++ Vectorization Benchmark

A benchmark comparing the performance of C, C++, and Rust implementations of an N-body gravitational simulation. 

## Key Finding: Rust Wins!

**Clean, idiomatic scalar Rust is ~33% faster than the auto-vectorized C/C++ code** for this workload (~1.78s vs ~2.66s), contrary to initial assumptions about auto-vectorization being necessary for performance.

| Language | Time (ms) | Relative | Checksum | SIMD Instructions |
|----------|-----------|----------|----------|-------------------|
| C        | 2,662     | 1.0x     | 6673.544927 | Yes (`fmul v*.2d`, `fadd v*.2d`) |
| C++      | 2,669     | 1.0x     | 6673.544927 | Yes (`fmul v*.2d`, `fadd v*.2d`) |
| Rust     | 1,782     | **0.67x**| 6673.544927 | **No** (scalar only) |

*Tested on Apple Silicon (ARM64/aarch64) with Docker*

## Update: The Solution

We initially observed Rust being 7.5x slower (20s). This turned out to be due to suboptimal build flags or test conditions. By simply using **clean, idiomatic Rust** (standard iterators/loops) and ensuring the correct release profile, Rust outperforms the auto-vectorized C code even without using SIMD instructions.

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
