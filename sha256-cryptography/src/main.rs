use std::time::Instant;

// SHA-256 constants
const K: [u32; 64] = [
    0x428a2f98, 0x71374491, 0xb5c0fbcf, 0xe9b5dba5, 0x3956c25b, 0x59f111f1, 0x923f82a4, 0xab1c5ed5,
    0xd807aa98, 0x12835b01, 0x243185be, 0x550c7dc3, 0x72be5d74, 0x80deb1fe, 0x9bdc06a7, 0xc19bf174,
    0xe49b69c1, 0xefbe4786, 0x0fc19dc6, 0x240ca1cc, 0x2de92c6f, 0x4a7484aa, 0x5cb0a9dc, 0x76f988da,
    0x983e5152, 0xa831c66d, 0xb00327c8, 0xbf597fc7, 0xc6e00bf3, 0xd5a79147, 0x06ca6351, 0x14292967,
    0x27b70a85, 0x2e1b2138, 0x4d2c6dfc, 0x53380d13, 0x650a7354, 0x766a0abb, 0x81c2c92e, 0x92722c85,
    0xa2bfe8a1, 0xa81a664b, 0xc24b8b70, 0xc76c51a3, 0xd192e819, 0xd6990624, 0xf40e3585, 0x106aa070,
    0x19a4c116, 0x1e376c08, 0x2748774c, 0x34b0bcb5, 0x391c0cb3, 0x4ed8aa4a, 0x5b9cca4f, 0x682e6ff3,
    0x748f82ee, 0x78a5636f, 0x84c87814, 0x8cc70208, 0x90befffa, 0xa4506ceb, 0xbef9a3f7, 0xc67178f2,
];

const INIT_STATE: [u32; 8] = [
    0x6a09e667, 0xbb67ae85, 0x3c6ef372, 0xa54ff53a,
    0x510e527f, 0x9b05688c, 0x1f83d9ab, 0x5be0cd19,
];

#[inline(always)]
fn rotr(x: u32, n: u32) -> u32 {
    (x >> n) | (x << (32 - n))
}

#[inline(always)]
fn ch(x: u32, y: u32, z: u32) -> u32 {
    (x & y) ^ (!x & z)
}

#[inline(always)]
fn maj(x: u32, y: u32, z: u32) -> u32 {
    (x & y) ^ (x & z) ^ (y & z)
}

#[inline(always)]
fn ep0(x: u32) -> u32 {
    rotr(x, 2) ^ rotr(x, 13) ^ rotr(x, 22)
}

#[inline(always)]
fn ep1(x: u32) -> u32 {
    rotr(x, 6) ^ rotr(x, 11) ^ rotr(x, 25)
}

#[inline(always)]
fn sig0(x: u32) -> u32 {
    rotr(x, 7) ^ rotr(x, 18) ^ (x >> 3)
}

#[inline(always)]
fn sig1(x: u32) -> u32 {
    rotr(x, 17) ^ rotr(x, 19) ^ (x >> 10)
}

struct Sha256Ctx {
    data: [u8; 64],
    datalen: usize,
    bitlen: u64,
    state: [u32; 8],
}

impl Sha256Ctx {
    fn new() -> Self {
        Sha256Ctx {
            data: [0u8; 64],
            datalen: 0,
            bitlen: 0,
            state: INIT_STATE,
        }
    }

    fn transform(&mut self) {
        let mut m = [0u32; 64];

        for i in 0..16 {
            m[i] = ((self.data[i * 4] as u32) << 24)
                | ((self.data[i * 4 + 1] as u32) << 16)
                | ((self.data[i * 4 + 2] as u32) << 8)
                | (self.data[i * 4 + 3] as u32);
        }

        for i in 16..64 {
            m[i] = sig1(m[i - 2])
                .wrapping_add(m[i - 7])
                .wrapping_add(sig0(m[i - 15]))
                .wrapping_add(m[i - 16]);
        }

        let mut a = self.state[0];
        let mut b = self.state[1];
        let mut c = self.state[2];
        let mut d = self.state[3];
        let mut e = self.state[4];
        let mut f = self.state[5];
        let mut g = self.state[6];
        let mut h = self.state[7];

        for i in 0..64 {
            let t1 = h
                .wrapping_add(ep1(e))
                .wrapping_add(ch(e, f, g))
                .wrapping_add(K[i])
                .wrapping_add(m[i]);
            let t2 = ep0(a).wrapping_add(maj(a, b, c));
            h = g;
            g = f;
            f = e;
            e = d.wrapping_add(t1);
            d = c;
            c = b;
            b = a;
            a = t1.wrapping_add(t2);
        }

        self.state[0] = self.state[0].wrapping_add(a);
        self.state[1] = self.state[1].wrapping_add(b);
        self.state[2] = self.state[2].wrapping_add(c);
        self.state[3] = self.state[3].wrapping_add(d);
        self.state[4] = self.state[4].wrapping_add(e);
        self.state[5] = self.state[5].wrapping_add(f);
        self.state[6] = self.state[6].wrapping_add(g);
        self.state[7] = self.state[7].wrapping_add(h);
    }

    fn update(&mut self, data: &[u8]) {
        for &byte in data {
            self.data[self.datalen] = byte;
            self.datalen += 1;
            if self.datalen == 64 {
                self.transform();
                self.bitlen += 512;
                self.datalen = 0;
            }
        }
    }

    fn finalize(&mut self, hash: &mut [u8; 32]) {
        let mut i = self.datalen;

        if self.datalen < 56 {
            self.data[i] = 0x80;
            i += 1;
            while i < 56 {
                self.data[i] = 0x00;
                i += 1;
            }
        } else {
            self.data[i] = 0x80;
            i += 1;
            while i < 64 {
                self.data[i] = 0x00;
                i += 1;
            }
            self.transform();
            for j in 0..56 {
                self.data[j] = 0;
            }
        }

        self.bitlen += (self.datalen as u64) * 8;
        self.data[63] = (self.bitlen) as u8;
        self.data[62] = (self.bitlen >> 8) as u8;
        self.data[61] = (self.bitlen >> 16) as u8;
        self.data[60] = (self.bitlen >> 24) as u8;
        self.data[59] = (self.bitlen >> 32) as u8;
        self.data[58] = (self.bitlen >> 40) as u8;
        self.data[57] = (self.bitlen >> 48) as u8;
        self.data[56] = (self.bitlen >> 56) as u8;
        self.transform();

        for i in 0..8 {
            hash[i * 4] = (self.state[i] >> 24) as u8;
            hash[i * 4 + 1] = (self.state[i] >> 16) as u8;
            hash[i * 4 + 2] = (self.state[i] >> 8) as u8;
            hash[i * 4 + 3] = self.state[i] as u8;
        }
    }
}

fn main() {
    let num_hashes = 1_000_000u32;
    let base_message = b"Computational Benchmarks - Language Performance Lab";

    let start = Instant::now();
    let mut final_hash = [0u8; 32];

    for nonce in 0..num_hashes {
        let mut ctx = Sha256Ctx::new();
        ctx.update(base_message);

        let nonce_bytes = [
            (nonce >> 24) as u8,
            (nonce >> 16) as u8,
            (nonce >> 8) as u8,
            nonce as u8,
        ];
        ctx.update(&nonce_bytes);
        ctx.finalize(&mut final_hash);
    }

    let elapsed_ms = start.elapsed().as_secs_f64() * 1000.0;
    let hashes_per_sec = (num_hashes as f64) / (elapsed_ms / 1000.0);

    print!("elapsed_ms={:.3} hashes_per_sec={:.0} checksum=", elapsed_ms, hashes_per_sec);
    for byte in &final_hash {
        print!("{:02x}", byte);
    }
    println!();
}
