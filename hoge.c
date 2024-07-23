#include <stdio.h>
#include <stdlib.h>
main() {
  printf("getpid() = %d\n", getpid());
  printf("getppid() = %d\n", getppid());
  if (fork() == 0) sleep(3);

  printf("getpid() = %d\n", getpid());
  printf("getppid() = %d\n", getppid());

  return 0;
}
