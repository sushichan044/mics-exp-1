#include <fcntl.h>
#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>

#define BUFFER_SIZE 128

void mycp(const char *src, const char *dst, size_t buffer_size) {
  int src_fd = open(src, O_RDONLY);
  if (src_fd == -1) {
    perror("Error opening source file");
    exit(EXIT_FAILURE);
  }

  int dst_fd = open(dst, O_WRONLY | O_CREAT | O_TRUNC, 0644);
  if (dst_fd == -1) {
    perror("Error opening destination file");
    close(src_fd);
    exit(EXIT_FAILURE);
  }

  char *buffer = (char *)malloc(buffer_size);
  if (buffer == NULL) {
    perror("Error allocating buffer");
    close(src_fd);
    close(dst_fd);
    exit(EXIT_FAILURE);
  }

  ssize_t bytes_read;
  while ((bytes_read = read(src_fd, buffer, buffer_size)) > 0) {
    if (write(dst_fd, buffer, bytes_read) != bytes_read) {
      perror("Error writing to destination file");
      free(buffer);
      close(src_fd);
      close(dst_fd);
      exit(EXIT_FAILURE);
    }
  }

  if (bytes_read == -1) {
    perror("Error reading from source file");
  }

  free(buffer);
  close(src_fd);
  close(dst_fd);
}

int main(int argc, char const *argv[]) {
  if (argc != 3) {
    fprintf(stderr, "Usage: %s <source> <destination>\n", argv[0]);
    return 1;
  }
  char const *source = argv[1];
  char const *destination = argv[2];
  mycp(source, destination, BUFFER_SIZE);
  return 0;
}
