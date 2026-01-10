FROM ubuntu:22.04
RUN apt-get update && apt-get install -y clang lld binutils && rm -rf /var/lib/apt/lists/*
WORKDIR /bench
COPY bench.cpp .
RUN clang++ -O3 -flto -mcpu=native -fuse-ld=lld bench.cpp -o bench
CMD ["./bench"]
