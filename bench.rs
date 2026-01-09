use std::time::Instant;

#[inline(always)]
fn lcg_next(state: &mut u64) -> u64 {
    *state = state.wrapping_mul(6364136223846793005).wrapping_add(1);
    *state
}

#[inline(always)]
fn lcg_double(state: &mut u64) -> f64 {
    let v = lcg_next(state);
    (((v >> 11) as f64) * (1.0 / 9007199254740992.0)) * 2.0 - 1.0
}

#[inline(always)]
fn run_steps(
    count: usize,
    n: usize,
    dt: f64,
    softening: f64,
    x: &mut [f64],
    y: &mut [f64],
    z: &mut [f64],
    vx: &mut [f64],
    vy: &mut [f64],
    vz: &mut [f64],
    m: &[f64],
) {
    for _ in 0..count {
        for i in 0..n {
            let mut fx = 0.0f64;
            let mut fy = 0.0f64;
            let mut fz = 0.0f64;
            let xi = x[i];
            let yi = y[i];
            let zi = z[i];

            for j in 0..n {
                let dx = x[j] - xi;
                let dy = y[j] - yi;
                let dz = z[j] - zi;
                let dist2 = dx * dx + dy * dy + dz * dz + softening;
                let inv = 1.0 / dist2.sqrt();
                let inv3 = inv * inv * inv;
                let s = m[j] * inv3;
                fx += dx * s;
                fy += dy * s;
                fz += dz * s;
            }
            vx[i] += dt * fx;
            vy[i] += dt * fy;
            vz[i] += dt * fz;
        }

        for i in 0..n {
            x[i] += dt * vx[i];
            y[i] += dt * vy[i];
            z[i] += dt * vz[i];
        }
    }
}

fn main() {
    let n: usize = 1500;
    let steps_warmup: usize = 5;
    let steps: usize = 400;
    let dt: f64 = 0.01;
    let softening: f64 = 1e-9;

    let mut x = vec![0.0f64; n];
    let mut y = vec![0.0f64; n];
    let mut z = vec![0.0f64; n];
    let mut vx = vec![0.0f64; n];
    let mut vy = vec![0.0f64; n];
    let mut vz = vec![0.0f64; n];
    let mut m = vec![0.0f64; n];

    let mut seed: u64 = 1;
    for i in 0..n {
        x[i] = lcg_double(&mut seed);
        y[i] = lcg_double(&mut seed);
        z[i] = lcg_double(&mut seed);
        vx[i] = lcg_double(&mut seed) * 0.1;
        vy[i] = lcg_double(&mut seed) * 0.1;
        vz[i] = lcg_double(&mut seed) * 0.1;
        m[i] = lcg_double(&mut seed).abs() + 0.5;
    }

    run_steps(
        steps_warmup, n, dt, softening, &mut x, &mut y, &mut z, &mut vx, &mut vy, &mut vz, &m,
    );

    let start = Instant::now();
    run_steps(steps, n, dt, softening, &mut x, &mut y, &mut z, &mut vx, &mut vy, &mut vz, &m);
    let elapsed_ms = start.elapsed().as_secs_f64() * 1000.0;

    let mut checksum = 0.0;
    for i in 0..n {
        checksum += x[i] + y[i] + z[i] + vx[i] + vy[i] + vz[i];
    }

    println!("elapsed_ms={:.3} checksum={:.6}", elapsed_ms, checksum);
}