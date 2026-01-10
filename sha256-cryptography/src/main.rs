use std::time::Instant;

fn rotr(x: u32, n: u32) -> u32 { (x >> n) | (x << (32 - n)) }
fn ch(x: u32, y: u32, z: u32) -> u32 { (x & y) ^ (!x & z) }
fn maj(x: u32, y: u32, z: u32) -> u32 { (x & y) ^ (x & z) ^ (y & z) }
fn ep0(x: u32) -> u32 { rotr(x, 2) ^ rotr(x, 13) ^ rotr(x, 22) }
fn ep1(x: u32) -> u32 { rotr(x, 6) ^ rotr(x, 11) ^ rotr(x, 25) }
fn sig0(x: u32) -> u32 { rotr(x, 7) ^ rotr(x, 18) ^ (x >> 3) }
fn sig1(x: u32) -> u32 { rotr(x, 17) ^ rotr(x, 19) ^ (x >> 10) }

const K: [u32; 64] = [
    0x428a2f98,0x71374491,0xb5c0fbcf,0xe9b5dba5,0x3956c25b,0x59f111f1,0x923f82a4,0xab1c5ed5,
    0xd807aa98,0x12835b01,0x243185be,0x550c7dc3,0x72be5d74,0x80deb1fe,0x9bdc06a7,0xc19bf174,
    0xe49b69c1,0xefbe4786,0x0fc19dc6,0x240ca1cc,0x2de92c6f,0x4a7484aa,0x5cb0a9dc,0x76f988da,
    0x983e5152,0xa831c66d,0xb00327c8,0xbf597fc7,0xc6e00bf3,0xd5a79147,0x06ca6351,0x14292967,
    0x27b70a85,0x2e1b2138,0x4d2c6dfc,0x53380d13,0x650a7354,0x766a0abb,0x81c2c92e,0x92722c85,
    0xa2bfe8a1,0xa81a664b,0xc24b8b70,0xc76c51a3,0xd192e819,0xd6990624,0xf40e3585,0x106aa070,
    0x19a4c116,0x1e376c08,0x2748774c,0x34b0bcb5,0x391c0cb3,0x4ed8aa4a,0x5b9cca4f,0x682e6ff3,
    0x748f82ee,0x78a5636f,0x84c87814,0x8cc70208,0x90befffa,0xa4506ceb,0xbef9a3f7,0xc67178f2
];

fn transform(state: &mut [u32; 8], data: &[u8]) {
    let mut m = [0u32; 64];
    for i in 0..16 {
        m[i] = (data[i*4] as u32) << 24 | (data[i*4+1] as u32) << 16 | (data[i*4+2] as u32) << 8 | (data[i*4+3] as u32);
    }
    for i in 16..64 {
        m[i] = sig1(m[i-2]).wrapping_add(m[i-7]).wrapping_add(sig0(m[i-15])).wrapping_add(m[i-16]);
    }
    let mut a = state[0]; let mut b = state[1]; let mut c = state[2]; let mut d = state[3];
    let mut e = state[4]; let mut f = state[5]; let mut g = state[6]; let mut h = state[7];

    for i in 0..64 {
        let t1 = h.wrapping_add(ep1(e)).wrapping_add(ch(e, f, g)).wrapping_add(K[i]).wrapping_add(m[i]);
        let t2 = ep0(a).wrapping_add(maj(a, b, c));
        h = g; g = f; f = e; e = d.wrapping_add(t1); d = c; c = b; b = a; a = t1.wrapping_add(t2);
    }
    state[0] = state[0].wrapping_add(a); state[1] = state[1].wrapping_add(b); state[2] = state[2].wrapping_add(c); state[3] = state[3].wrapping_add(d);
    state[4] = state[4].wrapping_add(e); state[5] = state[5].wrapping_add(f); state[6] = state[6].wrapping_add(g); state[7] = state[7].wrapping_add(h);
}

fn main() {
    let num_hashes = 1_000_000;
    let base_message = b"Computational Benchmarks - Language Performance Lab";
    let mut padded = [0u8; 64];
    padded[..base_message.len()].copy_from_slice(base_message);
    
    let start = Instant::now();
    let mut state = [0u32; 8];

    for nonce in 0..num_hashes as u32 {
        state = [0x6a09e667, 0xbb67ae85, 0x3c6ef372, 0xa54ff53a, 0x510e527f, 0x9b05688c, 0x1f83d9ab, 0x5be0cd19];
        // Simplified for benchmark: just hash the block with nonce in last 4 bytes
        padded[60] = (nonce >> 24) as u8; padded[61] = (nonce >> 16) as u8;
        padded[62] = (nonce >> 8) as u8; padded[63] = nonce as u8;
        transform(&mut state, &padded);
    }

    let elapsed = start.elapsed().as_secs_f64();
    println!("elapsed_ms={:.3} hashes_per_sec={:.0} checksum={:08x}", 
             elapsed * 1000.0, (num_hashes as f64) / elapsed, state[0]);
}