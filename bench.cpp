#include <cmath>
#include <cstdint>
#include <cstdio>
#include <cstdlib>
#include <time.h>
#include <vector>
#include <algorithm>

static inline uint64_t lcg_next(uint64_t *state) {
    *state = (*state * 6364136223846793005ULL) + 1ULL;
    return *state;
}

static inline double lcg_double(uint64_t *state) {
    uint64_t v = lcg_next(state);
    return ((v >> 11) * (1.0 / 9007199254740992.0)) * 2.0 - 1.0;
}

static double now_ms(void) {
    struct timespec ts;
    clock_gettime(CLOCK_MONOTONIC, &ts);
    return (double)ts.tv_sec * 1000.0 + (double)ts.tv_nsec / 1.0e6;
}

void run_steps(int n, int count, double dt, double softening, 
               double *__restrict__ x, double *__restrict__ y, double *__restrict__ z,
               double *__restrict__ vx, double *__restrict__ vy, double *__restrict__ vz,
               double *__restrict__ m,
               double *__restrict__ fx_buf, double *__restrict__ fy_buf, double *__restrict__ fz_buf) {
    
    for (int step = 0; step < count; step++) {
        std::fill(fx_buf, fx_buf + n, 0.0);
        std::fill(fy_buf, fy_buf + n, 0.0);
        std::fill(fz_buf, fz_buf + n, 0.0);

        for (int i = 0; i < n; i++) {
            double xi = x[i];
            double yi = y[i];
            double zi = z[i];
            double fxi = fx_buf[i];
            double fyi = fy_buf[i];
            double fzi = fz_buf[i];
            double mi = m[i];

            for (int j = i + 1; j < n; j++) {
                double dx = x[j] - xi;
                double dy = y[j] - yi;
                double dz = z[j] - zi;
                double dist2 = dx * dx + dy * dy + dz * dz + softening;
                double inv = 1.0 / std::sqrt(dist2);
                double inv3 = inv * inv * inv;
                
                double s_i = m[j] * inv3;
                double s_j = mi * inv3;

                fxi += dx * s_i;
                fyi += dy * s_i;
                fzi += dz * s_i;

                fx_buf[j] -= dx * s_j;
                fy_buf[j] -= dy * s_j;
                fz_buf[j] -= dz * s_j;
            }
            fx_buf[i] = fxi;
            fy_buf[i] = fyi;
            fz_buf[i] = fzi;
        }

        for (int i = 0; i < n; i++) {
            vx[i] += dt * fx_buf[i];
            vy[i] += dt * fy_buf[i];
            vz[i] += dt * fz_buf[i];
        }

        for (int i = 0; i < n; i++) {
            x[i] += dt * vx[i];
            y[i] += dt * vy[i];
            z[i] += dt * vz[i];
        }
    }
}

int main() {
    const int n = 1500;
    const int steps_warmup = 5;
    const int steps = 400;
    const double dt = 0.01;
    const double softening = 1e-9;

    double *__restrict__ x = (double *)std::malloc(sizeof(double) * n);
    double *__restrict__ y = (double *)std::malloc(sizeof(double) * n);
    double *__restrict__ z = (double *)std::malloc(sizeof(double) * n);
    double *__restrict__ vx = (double *)std::malloc(sizeof(double) * n);
    double *__restrict__ vy = (double *)std::malloc(sizeof(double) * n);
    double *__restrict__ vz = (double *)std::malloc(sizeof(double) * n);
    double *__restrict__ m = (double *)std::malloc(sizeof(double) * n);
    
    double *__restrict__ fx_buf = (double *)std::malloc(sizeof(double) * n);
    double *__restrict__ fy_buf = (double *)std::malloc(sizeof(double) * n);
    double *__restrict__ fz_buf = (double *)std::malloc(sizeof(double) * n);

    if (!x || !y || !z || !vx || !vy || !vz || !m || !fx_buf) {
        std::fprintf(stderr, "allocation failed\n");
        return 1;
    }

    uint64_t seed = 1;
    for (int i = 0; i < n; i++) {
        x[i] = lcg_double(&seed);
        y[i] = lcg_double(&seed);
        z[i] = lcg_double(&seed);
        vx[i] = lcg_double(&seed) * 0.1;
        vy[i] = lcg_double(&seed) * 0.1;
        vz[i] = lcg_double(&seed) * 0.1;
        m[i] = std::fabs(lcg_double(&seed)) + 0.5;
    }

    run_steps(n, steps_warmup, dt, softening, x, y, z, vx, vy, vz, m, fx_buf, fy_buf, fz_buf);

    double start_ms = now_ms();
    run_steps(n, steps, dt, softening, x, y, z, vx, vy, vz, m, fx_buf, fy_buf, fz_buf);
    double end_ms = now_ms();

    double checksum = 0.0;
    for (int i = 0; i < n; i++) {
        checksum += x[i] + y[i] + z[i] + vx[i] + vy[i] + vz[i];
    }

    std::printf("elapsed_ms=%.3f checksum=%.6f\n", end_ms - start_ms, checksum);

    std::free(x);
    std::free(y);
    std::free(z);
    std::free(vx);
    std::free(vy);
    std::free(vz);
    std::free(m);
    std::free(fx_buf);
    std::free(fy_buf);
    std::free(fz_buf);

    return 0;
}