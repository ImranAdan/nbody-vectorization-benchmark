#!/usr/bin/env bash
set -eo pipefail

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

  # Ensure asm directory exists
  mkdir -p "$ROOT_DIR/asm"

  # Extract ASM
  docker run --rm "$name" objdump -d /bench/bench > "$ROOT_DIR/asm/${name}.asm" 2>/dev/null || true

  local times=()
  local throughputs=()
  local checksums=()
  local out elapsed throughput checksum expected

  for ((i=0; i<runs; i++)); do
    echo "Running $name (run $((i+1))/$runs)..."
    out="$(docker run --rm "$name")"
    elapsed="$(echo "$out" | awk -F'[= ]' '{for (i=1;i<=NF;i++) if ($i=="elapsed_ms") {print $(i+1); exit}}')"
    throughput="$(echo "$out" | awk -F'[= ]' '{for (i=1;i<=NF;i++) if ($i=="ops_per_sec") {print $(i+1); exit}}')"
    checksum="$(echo "$out" | awk -F'[= ]' '{for (i=1;i<=NF;i++) if ($i=="checksum") {print $(i+1); exit}}')"
    expected="$(echo "$out" | awk -F'[= ]' '{for (i=1;i<=NF;i++) if ($i=="expected") {print $(i+1); exit}}')"
    times+=("$elapsed")
    throughputs+=("$throughput")
    checksums+=("$checksum")
  done

  local min mean t_mean
  min="$(printf "%s\n" "${times[@]}" | sort -n | head -n1)"
  mean="$(printf "%s\n" "${times[@]}" | awk '{s+=$1} END {printf "%.3f", s/NR}')"
  t_mean="$(printf "%s\n" "${throughputs[@]}" | awk '{s+=$1} END {printf "%.0f", s/NR}')"

  # Verify checksum matches expected
  local status="OK"
  if [ "${checksums[0]}" != "$expected" ]; then
    status="MISMATCH"
  fi

  printf "%-15s %-12s %-12s %-15s %-20s %s\n" "$name" "$min" "$mean" "$t_mean" "${checksums[0]}" "$status"
}

echo "Building Docker images..."
build queue-c Dockerfile.c
build queue-cpp Dockerfile.cpp
build queue-rust Dockerfile.rust

echo
echo "Lock-Free Queue Benchmark: 4 producers, 4 consumers, 4M total operations"
echo
printf "%-15s %-12s %-12s %-15s %-20s %s\n" "lang" "min_ms" "mean_ms" "ops/sec" "checksum" "status"
echo "--------------------------------------------------------------------------------"
run_one queue-c
run_one queue-cpp
run_one queue-rust
