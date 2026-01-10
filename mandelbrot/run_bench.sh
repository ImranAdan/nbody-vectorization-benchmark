#!/usr/bin/env bash
set -euo pipefail

ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

build() {
  local name="$1"
  local dockerfile="$2"
  echo "Building $name..."
  docker build -f "$ROOT_DIR/$dockerfile" -t "$name" "$ROOT_DIR" >/dev/null
}

run_one() {
  local name="$1"
  local runs="${RUNS:-3}"
  
  # Extract ASM
  docker run --rm "$name" objdump -d /bench/bench > "$ROOT_DIR/asm/${name}.asm"
  
  local times=()
  local throughputs=()
  local out elapsed throughput
  # Ensure output directory exists
  mkdir -p "$ROOT_DIR/output"

  for ((i=0; i<runs; i++)); do
    echo "Running $name (run $((i+1))/$runs)..."
    docker rm -f "${name}-tmp" >/dev/null 2>&1 || true
    out="$(docker run --name "${name}-tmp" "$name")"
    elapsed="$(echo "$out" | awk -F'[= ]' '{for (i=1;i<=NF;i++) if ($i=="elapsed_ms") {print $(i+1); exit}}')"
    throughput="$(echo "$out" | awk -F'[= ]' '{for (i=1;i<=NF;i++) if ($i=="mpixels_per_sec") {print $(i+1); exit}}')"
    times+=("$elapsed")
    throughputs+=("$throughput")
    
    # Extract the image from the last run to verify
    if [ $i -eq $((runs-1)) ]; then
       docker cp "${name}-tmp:/bench/mandelbrot.ppm" "$ROOT_DIR/output/${name}.ppm"
    fi
    docker rm "${name}-tmp" >/dev/null
  done

  local min mean
  min="$(printf "%s\n" "${times[@]}" | sort -n | head -n1)"
  mean="$(printf "%s\n" "${times[@]}" | awk '{s+=$1} END {printf "%.3f", s/NR}')"
  local t_mean
  t_mean="$(printf "%s\n" "${throughputs[@]}" | awk '{s+=$1} END {printf "%.3f", s/NR}')"

  printf "% -12s % -12s % -12s % -15s\n" "$name" "$min" "$mean" "$t_mean"
}

build mandel-c Dockerfile.c
build mandel-cpp Dockerfile.cpp
build mandel-rust Dockerfile.rust

echo
printf "% -12s % -12s % -12s % -15s\n" "lang" "min_ms" "mean_ms" "MPix/sec"
run_one mandel-c
run_one mandel-cpp
run_one mandel-rust
