#include <stdio.h>
#include <unistd.h>

int main(int argc, char const* argv[]) {
  char const* command = argv[1];
  char const* args[argc];
  for (int i = 1; i < argc; i++) {
    args[i - 1] = argv[i];
  }
  args[argc - 1] = NULL;

  execvp(command, args);
}
