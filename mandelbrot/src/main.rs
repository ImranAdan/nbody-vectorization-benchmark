use std::fs::File;
use std::io::{Write, BufWriter};
use std::time::Instant;
use rayon::prelude::*;

fn mandelbrot(c_re: f64, c_im: f64, max_iter: u32) -> u32 {
    let mut z_re = 0.0;
    let mut z_im = 0.0;
    for i in 0..max_iter {
        let z_re2 = z_re * z_re;
        let z_im2 = z_im * z_im;
        if z_re2 + z_im2 > 4.0 {
            return i;
        }
        let new_z_im = 2.0 * z_re * z_im + c_im;
        z_re = z_re2 - z_im2 + c_re;
        z_im = new_z_im;
    }
    max_iter
}

fn main() {
    let width = 4000;
    let height = 4000;
    let max_iter = 1000;
    
    let x_min = -2.0;
    let x_max = 1.0;
    let y_min = -1.5;
    let y_max = 1.5;

    let mut pixels = vec![0u32; width * height];

    let start = Instant::now();

    // Parallel calculation using Rayon
    pixels.par_chunks_mut(width).enumerate().for_each(|(y, row)| {
        let c_im = y_min + (y as f64 / height as f64) * (y_max - y_min);
        for x in 0..width {
            let c_re = x_min + (x as f64 / width as f64) * (x_max - x_min);
            row[x] = mandelbrot(c_re, c_im, max_iter);
        }
    });

    let elapsed_ms = start.elapsed().as_secs_f64() * 1000.0;

    // Save image to verify correctness
    let file = File::create("mandelbrot.ppm").unwrap();
    let mut writer = BufWriter::new(file);
    writeln!(writer, "P3\n{} {}\n255", width, height).unwrap();

    for (i, p) in pixels.iter().enumerate() {
        if *p == max_iter {
            write!(writer, "0 0 0 ").unwrap();
        } else {
            let color = (*p % 256) as u8;
            write!(writer, "{} {} 255 ", color, color).unwrap();
        }
        if i % 16 == 0 { // Just to keep line lengths reasonable (matches C/C++)
            writeln!(writer).unwrap();
        }
    }

    println!("elapsed_ms={:.3} mpixels_per_sec={:.3}", elapsed_ms, (width * height) as f64 / (elapsed_ms * 1000.0));
}