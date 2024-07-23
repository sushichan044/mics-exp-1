OS論期末レポート 2210342 鈴木謙太郎

1. forkの話

- forkから下の処理が親子プロセスの両方で実行される
- 親側で明示的にwaitしない限り親プロセスは子プロセスの終了を待たないので注意
  - 親プロセスが先に終了しても子プロセスは動き続ける。ただしシェルは親プロセスだけ見ているので、子プロセスのシェルへの出力がおかしくなる
  - waitしなかった場合子プロセスがゾンビプロセスになるのを防ぐため、PID1のinitプロセスが子プロセスの終了を待つ
    - ので親が消えた子プロセスのPPIDは1になる

```c
#include <stdio.h>
#include <stdlib.h>
#include <sys/wait.h>
#include <unistd.h>
int main() {
  int pid, w;
  printf("before fork(): getpid() = %d\n", getpid());
  if ((pid = fork()) == 0) { /* child process */
    printf("I'm a child. pid = %d, getpid() = %d\n", pid, getpid());
    exit(0);
  } else if (pid == -1) { /* error */
    perror("fork");
    exit(1);
  } else { /* parent process */
    printf("I'm a parent. pid = %d, getpid() = %d\n", pid, getpid());
  }
  if ((w = wait(NULL)) == -1) {
    perror("wait");
    exit(1);
  }
  printf("I'm a parent. w = %d\n", w);
  exit(0);
}
// before fork(): getpid() = 9488
// I'm a parent. pid = 9489, getpid() = 9488
// I'm a child. pid = 0, getpid() = 9489
// I'm a parent. w = 9489
```

```c
#include <stdio.h>
#include <stdlib.h>
#include <sys/wait.h>
#include <unistd.h>
int main() {
  int i, status;
  for (i = 0; i < 5; i++) {
    if (fork() == 0) exit(i);
    wait(&status); // statusに詰められる終了コードは8ビット左シフトされていることに注意
    printf("status = %d\n", status);
  }
  return 0;
}
// status = 0
// status = 256
// status = 512
// status = 768
// status = 1024
```

2. ALRMの話

3. エンディアンによるメモリ配置の違いの話

4. ファイルシステムの話

5. 用語集
