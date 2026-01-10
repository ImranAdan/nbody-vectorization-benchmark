FROM ubuntu:22.04
RUN apt-get update && apt-get install -y clang lld binutils && rm -rf /var/lib/apt/lists/*
WORKDIR /bench
COPY bench.c .
RUN clang -O3 -flto -mcpu=native -fuse-ld=lld -fno-fast-math -fno-math-errno -ffinite-math-only bench.c -lm -o bench
CMD ["./bench"]