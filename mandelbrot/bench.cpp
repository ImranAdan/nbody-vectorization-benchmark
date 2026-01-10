#include <iostream>
#include <vector>
#include <chrono>
#include <fstream>
#include <thread>
#include <algorithm>
#include <atomic>

uint32_t mandelbrot(double c_re, double c_im, uint32_t max_iter) {
    double z_re = 0.0;
    double z_im = 0.0;
    for (uint32_t i = 0; i < max_iter; i++) {
        double z_re2 = z_re * z_re;
        double z_im2 = z_im * z_im;
        if (z_re2 + z_im2 > 4.0) return i;
        double new_z_im = 2.0 * z_re * z_im + c_im;
        z_re = z_re2 - z_im2 + c_re;
        z_im = new_z_im;
    }
    return max_iter;
}

void render_dynamic(std::atomic<int>& next_row, int width, int height, uint32_t max_iter, 
                    double x_min, double x_max, double y_min, double y_max,
                    uint32_t* pixels) {
    int y;
    while ((y = next_row.fetch_add(1)) < height) {
        double c_im = y_min + ((double)y / height) * (y_max - y_min);
        for (int x = 0; x < width; x++) {
            double c_re = x_min + ((double)x / width) * (x_max - x_min);
            pixels[y * width + x] = mandelbrot(c_re, c_im, max_iter);
        }
    }
}

int main() {
    const int width = 4000;
    const int height = 4000;
    const uint32_t max_iter = 1000;
    const double x_min = -2.0, x_max = 1.0;
    const double y_min = -1.5, y_max = 1.5;

    std::vector<uint32_t> pixels(width * height);
    auto start = std::chrono::high_resolution_clock::now();

    unsigned int num_threads = std::thread::hardware_concurrency();
    if (num_threads == 0) num_threads = 2;
    
    std::atomic<int> next_row(0);
    std::vector<std::thread> threads;

    for (unsigned int i = 0; i < num_threads; i++) {
        threads.emplace_back(render_dynamic, std::ref(next_row), width, height, max_iter, 
                             x_min, x_max, y_min, y_max, pixels.data());
    }

    for (auto& t : threads) t.join();

    auto end = std::chrono::high_resolution_clock::now();
    double elapsed_ms = std::chrono::duration<double, std::milli>(end - start).count();

    // Save image to match the other implementations
    std::ofstream f("mandelbrot.ppm");
    f << "P3\n" << width << " " << height << "\n255\n";
    for (int i = 0; i < width * height; i++) {
        uint32_t p = pixels[i];
        if (p == max_iter) {
            f << "0 0 0 ";
        } else {
            uint8_t color = (uint8_t)(p % 256);
            f << (int)color << " " << (int)color << " 255 ";
        }
        if (i % 16 == 0) f << "\n";
    }
    f.close();

    printf("elapsed_ms=%.3f mpixels_per_sec=%.3f\n", elapsed_ms, (double)(width * height) / (elapsed_ms * 1000.0));
    return 0;
}