#include <stdio.h>

void mycp(char const *source, char const *destination) {
  FILE *src = fopen(source, "r");
  FILE *dest = fopen(destination, "w");

  if (src == NULL || dest == NULL) {
    fprintf(stderr, "Error opening files\n");
    return;
  }

  char buffer[1024];
  size_t n;
  while ((n = fread(buffer, 1, sizeof(buffer), src)) > 0) {
    fwrite(buffer, 1, n, dest);
  }

  fclose(src);
  fclose(dest);
}

int main(int argc, char const *argv[]) {
  if (argc != 2) {
    fprintf(stderr, "Usage: %s <source> <destination>\n", argv[0]);
    return 1;
  }
  char const *source = argv[1];
  char const *destination = argv[2];
  mycp(source, destination);
  return 0;
}
