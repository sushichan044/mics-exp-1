#include <stdio.h>
int main() {
  int v0;
  int v1;
  v1 = 0;
  while (1) {
    if (v0 >= 100) {
      break;
    }
    const int v2 = 1;
    scanf("%d", &v1);
    v0 = v0 + v1;
    printf("%d", v0);
    printf("\n");
  }
}
