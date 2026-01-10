use std::time::Instant;

struct Point3D {
    x: f64,
    y: f64,
    z: f64,
}

struct Point2D {
    x: f64,
    y: f64,
}

fn rotate_and_project(p: &Point3D, angle: f64) -> Point2D {
    // Rotation Matrix around Y and X axes
    let cos_a = angle.cos();
    let sin_a = angle.sin();

    // Rotate around Y
    let x1 = p.x * cos_a + p.z * sin_a;
    let z1 = -p.x * sin_a + p.z * cos_a;

    // Rotate around X
    let y2 = p.y * cos_a - z1 * sin_a;
    let z2 = p.y * sin_a + z1 * cos_a;

    // Perspective Projection
    let viewer_distance = 5.0;
    let scale = 1000.0;
    let factor = scale / (z2 + viewer_distance);

    Point2D {
        x: x1 * factor,
        y: y2 * factor,
    }
}

fn main() {
    let num_vertices = 250_000;
    let num_frames = 100;
    
    // Initialize vertices (a sphere)
    let mut vertices = Vec::with_capacity(num_vertices);
    for i in 0..num_vertices {
        let phi = (i as f64) * std::f64::consts::PI * (3.0 - (5.0f64).sqrt());
        let y = 1.0 - (i as f64 / (num_vertices - 1) as f64) * 2.0;
        let radius = (1.0 - y * y).sqrt();
        vertices.push(Point3D {
            x: radius * phi.cos(),
            y,
            z: radius * phi.sin(),
        });
    }

    println!("Starting Live 3D Calculation Session...");
    let start = Instant::now();
    let mut checksum = 0.0;

    for frame in 0..num_frames {
        let angle = (frame as f64) * 0.01;
        
        // Simulating "Live" vertex streaming
        for p in &vertices {
            let p2d = rotate_and_project(p, angle);
            checksum += p2d.x + p2d.y;
        }

        // Output "Live" state of the first vertex for the UI modal
        if frame % 20 == 0 {
            let p2d = rotate_and_project(&vertices[0], angle);
            println!("[LIVE FRAME {:3}] Tracking Vertex 0: x={:.2}, y={:.2}", frame, p2d.x, p2d.y);
        }
    }

    let elapsed_ms = start.elapsed().as_secs_f64() * 1000.0;
    let total_vertices = (num_vertices * num_frames) as f64;

    println!("------------------------------------------------");
    println!("elapsed_ms={:.3} vertices_per_sec={:.0} checksum={:.6}", 
             elapsed_ms, total_vertices / (elapsed_ms / 1000.0), checksum);
}
