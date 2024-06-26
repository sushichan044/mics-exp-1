#include <stdio.h>

int main() {
  int v0;
  scanf("%d", &v0);
  while (v0 <= 10) {
    printf("%d", v0++);
  }
}
