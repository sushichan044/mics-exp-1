import subprocess
import csv


def call_copy(src: str, dst: str):
    # call a.out
    proc = subprocess.run(
        [
            "/usr/bin/time",
            "-f",
            "%e\n%U\n%S",
            "./a.out",
            src,
            dst,
        ],  # Use /usr/bin/time for more control over output format
        text=True,
        capture_output=True,
    )
    return proc.stdout, proc.stderr


def generate_file_with_size(file_name: str, size: int):
    with open(file_name, "w") as f:
        f.write("a" * size)


SIZES = [16**n for n in range(1, 9)]

if __name__ == "__main__":
    with open("execution_times.csv", "w", newline="") as csvfile:
        fieldnames = ["size", "real_time", "user_time", "sys_time"]
        writer = csv.DictWriter(csvfile, fieldnames=fieldnames)

        writer.writeheader()

        for size in SIZES:
            generate_file_with_size("src", size)

            # Copy the file and get the execution time
            stdout, stderr = call_copy("src", "dst")

            [real_time, user_time, sys_time] = stderr.strip().split("\n")

            # Write the size and execution time to the CSV
            writer.writerow(
                {
                    "size": size,
                    "real_time": real_time,
                    "user_time": user_time,
                    "sys_time": sys_time,
                }
            )
