
#include <stdio.h>
#include <stdlib.h>
int main() {
  int *p;
  p = (int *)main;
  printf("*p = %x\n", *p);
  *p = 0x12345678;
  printf("*p = %x\n", *p);
  return 0;
}
