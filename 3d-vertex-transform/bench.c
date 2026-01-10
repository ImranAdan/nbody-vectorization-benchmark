#define _POSIX_C_SOURCE 200809L
#include <stdio.h>
#include <stdlib.h>
#include <math.h>
#include <time.h>

typedef struct { double x, y, z; } Point3D;
typedef struct { double x, y; } Point2D;

static inline double now_ms(void) {
    struct timespec ts;
    clock_gettime(CLOCK_MONOTONIC, &ts);
    return (double)ts.tv_sec * 1000.0 + (double)ts.tv_nsec / 1.0e6;
}

Point2D rotate_and_project(Point3D p, double angle) {
    double cos_a = cos(angle);
    double sin_a = sin(angle);

    double x1 = p.x * cos_a + p.z * sin_a;
    double z1 = -p.x * sin_a + p.z * cos_a;

    double y2 = p.y * cos_a - z1 * sin_a;
    double z2 = p.y * sin_a + z1 * cos_a;

    double viewer_distance = 5.0;
    double scale = 1000.0;
    double factor = scale / (z2 + viewer_distance);

    return (Point2D){ x1 * factor, y2 * factor };
}

int main() {
    const int num_vertices = 250000;
    const int num_frames = 100;
    
    Point3D *vertices = malloc(num_vertices * sizeof(Point3D));
    double pi = 3.14159265358979323846;
    double sqrt5 = sqrt(5.0);

    for (int i = 0; i < num_vertices; i++) {
        double phi = i * pi * (3.0 - sqrt5);
        double y = 1.0 - ((double)i / (num_vertices - 1)) * 2.0;
        double radius = sqrt(1.0 - y * y);
        vertices[i] = (Point3D){ radius * cos(phi), y, radius * sin(phi) };
    }

    printf("Starting Live 3D Calculation Session...\n");
    double start = now_ms();
    double checksum = 0.0;

    for (int frame = 0; frame < num_frames; frame++) {
        double angle = frame * 0.01;
        for (int i = 0; i < num_vertices; i++) {
            Point2D p2d = rotate_and_project(vertices[i], angle);
            checksum += p2d.x + p2d.y;
        }

        if (frame % 20 == 0) {
            Point2D p2d = rotate_and_project(vertices[0], angle);
            printf("[LIVE FRAME %3d] Tracking Vertex 0: x=%.2f, y=%.2f\n", frame, p2d.x, p2d.y);
        }
    }

    double elapsed_ms = now_ms() - start;
    double total_vertices = (double)num_vertices * num_frames;

    printf("------------------------------------------------\n");
    printf("elapsed_ms=%.3f vertices_per_sec=%.0f checksum=%.6f\n", 
           elapsed_ms, total_vertices / (elapsed_ms / 1000.0), checksum);

    free(vertices);
    return 0;
}
