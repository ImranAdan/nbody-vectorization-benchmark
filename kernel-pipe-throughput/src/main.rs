use std::time::Instant;
use libc::{pipe, fork, read, write, wait, close, size_t, c_void};

const TOTAL_BYTES: u64 = 10 * 1024 * 1024 * 1024; // 10 GB
const BUFFER_SIZE: usize = 64 * 1024;             // 64 KB

fn main() {
    let mut pipe_fds = [0i32; 2];
    unsafe {
        if pipe(pipe_fds.as_mut_ptr()) == -1 {
            panic!("pipe failed");
        }

        let pid = fork();
        if pid == -1 {
            panic!("fork failed");
        }

        if pid == 0 { // Child: Reader
            close(pipe_fds[1]);
            let mut buffer = vec![0u8; BUFFER_SIZE];
            let mut total_received = 0u64;
            let mut checksum = 0u8;

            while total_received < TOTAL_BYTES {
                let n = read(pipe_fds[0], buffer.as_mut_ptr() as *mut c_void, BUFFER_SIZE as size_t);
                if n <= 0 { break; }
                for i in 0..n as usize {
                    checksum ^= buffer[i];
                }
                total_received += n as u64;
            }
            println!("CHECK:{:02x}", checksum);
            close(pipe_fds[0]);
            std::process::exit(0);
        } else { // Parent: Writer
            close(pipe_fds[0]);
            // Standardized buffer initialization (matches C and C++)
            let mut buffer = vec![0u8; BUFFER_SIZE];
            for i in 0..BUFFER_SIZE {
                buffer[i] = i as u8;
            }
            let mut total_sent = 0u64;

            let start = Instant::now();
            while total_sent < TOTAL_BYTES {
                let n = write(pipe_fds[1], buffer.as_ptr() as *const c_void, BUFFER_SIZE as size_t);
                if n <= 0 { break; }
                total_sent += n as u64;
            }

            let elapsed = start.elapsed();
            let elapsed_ms = elapsed.as_secs_f64() * 1000.0;
            println!("elapsed_ms={:.3} throughput_gb_sec={:.3}", 
                     elapsed_ms, (TOTAL_BYTES as f64 / 1024.0 / 1024.0 / 1024.0) / (elapsed.as_secs_f64()));

            close(pipe_fds[1]);
            let mut status = 0;
            wait(&mut status);
        }
    }
}
