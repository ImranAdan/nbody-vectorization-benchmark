#define _POSIX_C_SOURCE 200809L

#include <math.h>
#include <stdint.h>
#include <stdio.h>
#include <stdlib.h>
#include <time.h>
#include <string.h> // for memset

static inline uint64_t lcg_next(uint64_t *state) {
    *state = (*state * 6364136223846793005ULL) + 1ULL;
    return *state;
}

static inline double lcg_double(uint64_t *state) {
    uint64_t v = lcg_next(state);
    // Map to [-1.0, 1.0]
    return ((v >> 11) * (1.0 / 9007199254740992.0)) * 2.0 - 1.0;
}

static double now_ms(void) {
    struct timespec ts;
    clock_gettime(CLOCK_MONOTONIC, &ts);
    return (double)ts.tv_sec * 1000.0 + (double)ts.tv_nsec / 1.0e6;
}

void run_steps(int n, int count, double dt, double softening, 
               double *restrict x, double *restrict y, double *restrict z,
               double *restrict vx, double *restrict vy, double *restrict vz,
               double *restrict m,
               double *restrict fx_buf, double *restrict fy_buf, double *restrict fz_buf) {
    
    for (int step = 0; step < count; step++) {
        // Zero out force buffers
        memset(fx_buf, 0, n * sizeof(double));
        memset(fy_buf, 0, n * sizeof(double));
        memset(fz_buf, 0, n * sizeof(double));

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
                double inv = 1.0 / sqrt(dist2);
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

int main(void) {
    const int n = 1500;
    const int steps_warmup = 5;
    const int steps = 400;
    const double dt = 0.01;
    const double softening = 1e-9;

    double *restrict x = (double *)malloc(sizeof(double) * n);
    double *restrict y = (double *)malloc(sizeof(double) * n);
    double *restrict z = (double *)malloc(sizeof(double) * n);
    double *restrict vx = (double *)malloc(sizeof(double) * n);
    double *restrict vy = (double *)malloc(sizeof(double) * n);
    double *restrict vz = (double *)malloc(sizeof(double) * n);
    double *restrict m = (double *)malloc(sizeof(double) * n);
    
    // Auxiliary buffers for forces
    double *restrict fx_buf = (double *)malloc(sizeof(double) * n);
    double *restrict fy_buf = (double *)malloc(sizeof(double) * n);
    double *restrict fz_buf = (double *)malloc(sizeof(double) * n);

    if (!x || !y || !z || !vx || !vy || !vz || !m || !fx_buf || !fy_buf || !fz_buf) {
        fprintf(stderr, "allocation failed\n");
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
        m[i] = fabs(lcg_double(&seed)) + 0.5;
    }

    run_steps(n, steps_warmup, dt, softening, x, y, z, vx, vy, vz, m, fx_buf, fy_buf, fz_buf);

    double start_ms = now_ms();
    run_steps(n, steps, dt, softening, x, y, z, vx, vy, vz, m, fx_buf, fy_buf, fz_buf);
    double end_ms = now_ms();

    double checksum = 0.0;
    for (int i = 0; i < n; i++) {
        checksum += x[i] + y[i] + z[i] + vx[i] + vy[i] + vz[i];
    }

    printf("elapsed_ms=%.3f checksum=%.6f\n", end_ms - start_ms, checksum);

    free(x);
    free(y);
    free(z);
    free(vx);
    free(vy);
    free(vz);
    free(m);
    free(fx_buf);
    free(fy_buf);
    free(fz_buf);

    return 0;
}