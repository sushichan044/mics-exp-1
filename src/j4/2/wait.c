#include <stdio.h>
#include <stdlib.h>
#include <sys/wait.h>
#include <unistd.h>

int main(int argc, char const* argv[]) {
  if (argc < 2) {
    fprintf(stderr, "Usage: %s host1 host2 ...\n", argv[0]);
    return 1;
  }

  for (int i = 1; i < argc; i++) {
    pid_t pid = fork();

    if (pid == -1) {
      // フォーク失敗
      perror("fork");
      return 1;
    } else if (pid == 0) {
      // 子プロセス
      execlp("ping", "ping", "-c", "3", argv[i], (char*)NULL);
      perror("execvp");
      exit(1);
    } else {
      // 親プロセス
      int status;
      waitpid(pid, &status, 0);  // 子プロセスの終了を待つ
    }
  }

  return 0;
}
