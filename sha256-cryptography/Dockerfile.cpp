FROM ubuntu:22.04
RUN apt-get update && apt-get install -y clang lld binutils && rm -rf /var/lib/apt/lists/*
WORKDIR /bench
COPY bench.cpp sha256.c sha256.h ./
RUN clang++ -O3 -flto -mcpu=native -fuse-ld=lld -fno-math-errno -ffinite-math-only bench.cpp sha256.c -o bench
CMD ["./bench"]