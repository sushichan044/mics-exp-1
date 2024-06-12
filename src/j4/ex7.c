#include <stdio.h>
#include <stdlib.h>
#include <sys/fcntl.h>
#include <unistd.h>

int main(int argc, char const *argv[]) {
  if (argc < 2) {
    fprintf(stderr, "Usage: %s <command> <args...> <output destination>\n",
            argv[0]);
    return 1;
  }
  char const *destination = argv[argc - 1];
  int fd;
  if ((fd = open(destination, O_WRONLY | O_CREAT | O_TRUNC, 0644)) < 0) {
    perror("error opening destination file: ");
    perror(destination);
    perror("\n");
    exit(1);
  }

  char const *command = argv[1];
  int args_length = argc - 2;
  char const *args[args_length + 1];
  for (int i = 0; i < args_length; i++) {
    args[i] = argv[i + 1];
  }
  args[args_length] = NULL;

  close(1);
  dup(fd);
  close(fd);

  execvp(command, args);
  return 0;
}
