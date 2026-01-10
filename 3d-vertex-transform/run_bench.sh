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
  
  for ((i=0; i<runs; i++)); do
    echo "Running $name (run $((i+1))/$runs)..."
    # We capture the full output to show the "Live" session logs
    out="$(docker run --rm "$name")"
    
    # Print the live session logs for the first run of each language
    if [ $i -eq 0 ]; then
       echo "--- $name LIVE SESSION LOG ---"
       echo "$out" | grep "\[LIVE FRAME"
       echo "------------------------------"
    fi

    elapsed="$(echo "$out" | awk -F'[= ]' '{for (i=1;i<=NF;i++) if ($i=="elapsed_ms") {print $(i+1); exit}}')"
    throughput="$(echo "$out" | awk -F'[= ]' '{for (i=1;i<=NF;i++) if ($i=="vertices_per_sec") {print $(i+1); exit}}')"
    times+=("$elapsed")
    throughputs+=("$throughput")
  done

  local min mean
  min="$(printf "%s\n" "${times[@]}" | sort -n | head -n1)"
  mean="$(printf "%s\n" "${times[@]}" | awk '{s+=$1} END {printf "%.3f", s/NR}')"
  local t_mean
  t_mean="$(printf "%s\n" "${throughputs[@]}" | awk '{s+=$1} END {printf "%.0f", s/NR}')"

  printf "% -15s % -12s % -12s % -20s\n" "$name" "$min" "$mean" "$t_mean"
}

build transform-c Dockerfile.c
build transform-cpp Dockerfile.cpp
build transform-rust Dockerfile.rust

echo
printf "% -15s % -12s % -12s % -20s\n" "lang" "min_ms" "mean_ms" "Vertices/sec"
run_one transform-c
run_one transform-cpp
run_one transform-rust
