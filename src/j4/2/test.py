import argparse
import subprocess
import csv

TEST_HOSTS = [
    "github.com",
    "www.google.com",
    "www.youtube.com",
    "www.facebook.com",
    "uec.ac.jp",
    "www.yahoo.co.jp",
    "www.amazon.co.jp",
    "www.rakuten.co.jp",
    "www.dmm.com",
]


def call_bin(bin: str):
    # call a.out
    proc = subprocess.run(
        [
            "/usr/bin/time",
            "-f",
            "%e\n%U\n%S",
            f"./{bin}",
            *TEST_HOSTS,
        ],  # Use /usr/bin/time for more control over output format
        text=True,
        capture_output=True,
    )
    return proc.stdout, proc.stderr


def generate_file_with_size(file_name: str, size: int):
    with open(file_name, "w") as f:
        f.write("a" * size)


if __name__ == "__main__":
    parser = argparse.ArgumentParser(
        prog="ex2",
    )
    parser.add_argument("filename")

    args = parser.parse_args()
    filename = args.filename

    with open(f"{filename}.csv", "w", newline="") as csvfile:
        fieldnames = ["real_time", "user_time", "sys_time"]
        writer = csv.DictWriter(csvfile, fieldnames=fieldnames)

        writer.writeheader()

        # Copy the file and get the execution time
        stdout, stderr = call_bin(args.filename)
        print(stdout)
        [real_time, user_time, sys_time] = stderr.strip().split("\n")
        # Write the size and execution time to the CSV
        writer.writerow(
            {
                "real_time": real_time,
                "user_time": user_time,
                "sys_time": sys_time,
            }
        )
