#include <stdio.h>
#include <stdlib.h>

void copy_file_stdio(const char *src, const char *dst) {
  FILE *src_file = fopen(src, "rb");
  if (src_file == NULL) {
    perror("Error opening source file");
    exit(EXIT_FAILURE);
  }

  FILE *dst_file = fopen(dst, "wb");
  if (dst_file == NULL) {
    perror("Error opening destination file");
    fclose(src_file);
    exit(EXIT_FAILURE);
  }

  int ch;
  while ((ch = fgetc(src_file)) != EOF) {
    if (fputc(ch, dst_file) == EOF) {
      perror("Error writing to destination file");
      fclose(src_file);
      fclose(dst_file);
      exit(EXIT_FAILURE);
    }
  }

  fclose(src_file);
  fclose(dst_file);
}
