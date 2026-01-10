#include <iostream>
#include <vector>
#include <cmath>
#include <chrono>

struct Point3D { double x, y, z; };
struct Point2D { double x, y; };

Point2D rotate_and_project(const Point3D& p, double angle) {
    double cos_a = std::cos(angle);
    double sin_a = std::sin(angle);

    double x1 = p.x * cos_a + p.z * sin_a;
    double z1 = -p.x * sin_a + p.z * cos_a;

    double y2 = p.y * cos_a - z1 * sin_a;
    double z2 = p.y * sin_a + z1 * cos_a;

    double viewer_distance = 5.0;
    double scale = 1000.0;
    double factor = scale / (z2 + viewer_distance);

    return { x1 * factor, y2 * factor };
}

int main() {
    const int num_vertices = 250000;
    const int num_frames = 100;
    
    std::vector<Point3D> vertices(num_vertices);
    double pi = std::acos(-1.0);
    double sqrt5 = std::sqrt(5.0);

    for (int i = 0; i < num_vertices; i++) {
        double phi = i * pi * (3.0 - sqrt5);
        double y = 1.0 - ((double)i / (num_vertices - 1)) * 2.0;
        double radius = std::sqrt(1.0 - y * y);
        vertices[i] = { radius * std::cos(phi), y, radius * std::sin(phi) };
    }

    std::printf("Starting Live 3D Calculation Session...\n");
    auto start = std::chrono::high_resolution_clock::now();
    double checksum = 0.0;

    for (int frame = 0; frame < num_frames; frame++) {
        double angle = frame * 0.01;
        for (const auto& v : vertices) {
            Point2D p2d = rotate_and_project(v, angle);
            checksum += p2d.x + p2d.y;
        }

        if (frame % 20 == 0) {
            Point2D p2d = rotate_and_project(vertices[0], angle);
            std::printf("[LIVE FRAME %3d] Tracking Vertex 0: x=%.2f, y=%.2f\n", frame, p2d.x, p2d.y);
        }
    }

    auto end = std::chrono::high_resolution_clock::now();
    double elapsed_ms = std::chrono::duration<double, std::milli>(end - start).count();
    double total_vertices = (double)num_vertices * num_frames;

    std::printf("------------------------------------------------\n");
    std::printf("elapsed_ms=%.3f vertices_per_sec=%.0f checksum=%.6f\n", 
                elapsed_ms, total_vertices / (elapsed_ms / 1000.0), checksum);

    return 0;
}
