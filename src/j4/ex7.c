#include <stdlib.h>
#include <sys/fcntl.h>
#include <unistd.h>

int main(int argc, char const *argv[]) {
  if (argc < 3) {
    write(2, "Usage: <command> <args...> <output destination>\n", 48);
    exit(1);
  }
  char const *destination = argv[argc - 1];
  int fd;
  if ((fd = open(destination, O_WRONLY | O_CREAT | O_TRUNC, 0644)) < 0) {
    write(2, "Error opening destination\n", 26);
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

  exit(0);
}
