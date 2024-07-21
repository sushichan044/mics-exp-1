#include <fcntl.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <sys/wait.h>
#include <unistd.h>

int main(int argc, char *argv[]) {
  if (argc < 3) {
    fprintf(stderr, "Usage: %s logfile command [args...]\n", argv[0]);
    return 1;
  }

  char *logfile = argv[1];
  char *command = argv[2];
  char **args = &argv[3];

  int pipefd[2];
  if (pipe(pipefd) == -1) {
    perror("pipe");
    return 1;
  }

  pid_t pid = fork();

  if (pid == -1) {
    // フォーク失敗
    perror("fork");
    return 1;
  } else if (pid == 0) {
    // 子プロセス
    close(pipefd[1]);
    dup2(pipefd[0], STDIN_FILENO);  // リダイレクトする
    close(pipefd[0]);
    execvp(command, args);
    perror("execvp");
    exit(1);
  } else {
    // 親プロセス
    close(pipefd[0]);
    int logfd = open(logfile, O_WRONLY | O_CREAT | O_TRUNC, 0644);
    if (logfd == -1) {
      perror("open");
      exit(1);
    }

    char buffer[1024];
    ssize_t bytes;
    while ((bytes = read(STDIN_FILENO, buffer, sizeof(buffer))) > 0) {
      if (write(pipefd[1], buffer, bytes) == -1) {
        perror("write to pipe");
        exit(1);
      }
      if (write(logfd, buffer, bytes) == -1) {
        perror("write to logfile");
        exit(1);
      }
    }

    if (bytes == -1) {
      perror("read");
    }

    close(pipefd[1]);  // Close write end of pipe
    close(logfd);      // Close logfile

    // Wait for child process to finish
    wait(NULL);
  }

  return 0;
}
