#include <stdio.h>
struct stab {
  int val;
  char name[20];
} stab[100];
int stabuse = 0;

extern char *yytext;

#define T_STLIST 1
#define T_ASSIGN 2
#define T_READ   3
#define T_PRINT  4
#define T_ADD    5
#define T_SUB    6
#define T_NUM    7
#define T_VAR    8
#define T_WHILE  9
#define T_LT     10
#define T_GT     11
#define T_LTE    12
#define T_GTE    13
#define T_EQ     14
#define T_NOT    15
#define T_AND    16
#define T_OR     17
#define T_PP     18
#define T_BLOCK  19

typedef struct Node {
    int node_type;
    struct Node* left;
    struct Node* right;
} Node;


// 引数にとる文字列が表にあれば見つかった位置を返して，なければ追加する関数
int lookup(char *s) {
  int i;
  // 表の使っているところを順に見ていって
  for (i = 0; i < stabuse; ++i) {
    if (strcmp(stab[i].name, s) == 0) {
      // 見つかった場合はその位置を返す
      return i;
    }
  }
  if (stabuse >= 99) {
    // 変数の上限の個数を超えてしまった
    printf("table overflow,\n");
    exit(1);
  }

  // 表になかったので追加する
  strcpy(stab[stabuse].name, s);
  return stabuse++;  // 追加した位置を返す
}

// 新しいノードを作る関数
Node* createNode(int node_type, Node* left, Node* right) {
    Node* newNode = (Node*)malloc(sizeof(Node));
    newNode->node_type = node_type;
    newNode->left = left;
    newNode->right = right;
    return newNode;
}

static int label = 0;

void _emit_asm(Node* node) {
  if (node == NULL) {
    return;
  }
  switch (node->node_type) {
    case T_STLIST:
      if (node->left != NULL) { _emit_asm(node->left); }
      _emit_asm(node->right);
      break;
    case T_ASSIGN:
      _emit_asm(node->right);
      printf("  popq %d(%%rbp)\n", -((int)node->left + 1) * 8);
      break;
    case T_READ:
      printf("  movq $.Lprompt, %%rdi\n");
      printf("  movq $0, %%rax\n");
      printf("  call printf\n");
      printf("  leaq %d(%%rbp), %%rsi\n", -((int)node->left + 1) * 8);
      printf("  movq $.Lread, %%rdi\n");
      printf("  movq $0, %%rax\n");
      printf("  call scanf\n");
      break;
    case T_PRINT:
      _emit_asm(node->left);
      printf("  popq %%rsi\n");
      printf("  movq $.Lprint, %%rdi\n");
      printf("  movq $0, %%rax\n");
      printf("  call printf\n");
      break;
    case T_ADD:
      _emit_asm(node->left);
      _emit_asm(node->right);
      printf("  popq %%rdx\n");
      printf("  popq %%rax\n");
      printf("  addq %%rdx, %%rax\n");
      printf("  pushq %%rax\n");
      break;
    case T_SUB:
      _emit_asm(node->left);
      _emit_asm(node->right);
      printf("  popq %%rdx\n");
      printf("  popq %%rax\n");
      printf("  subq %%rdx, %%rax\n");
      printf("  pushq %%rax\n");
      break;
    case T_NUM:
      printf("  pushq $%d\n", node->left);
      break;
    case T_VAR:
      printf("  pushq %d(%%rbp)\n", -((int)node->left + 1) * 8);
      break;
    case T_WHILE:
      int l = label++;
      printf(".L%d:\n", l);
      _emit_asm(node->left);
      printf("  popq %%rax\n");
      printf("  cmpq $0, %%rax\n");
      printf("  je .L%d\n", l + 1);
      _emit_asm(node->right);
      printf("  jmp .L%d\n", l);
      printf(".L%d:\n", l + 1);
      break;
    case T_LT:
      _emit_asm(node->left);
      _emit_asm(node->right);
      printf("  popq %%rdx\n");
      printf("  popq %%rax\n");
      printf("  cmpq %%rdx, %%rax\n");
      printf("  setl %%al\n");
      printf("  movzbq %%al, %%rax\n");
      printf("  pushq %%rax\n");
      break;
    case T_GT:
      _emit_asm(node->left);
      _emit_asm(node->right);
      printf("  popq %%rdx\n");
      printf("  popq %%rax\n");
      printf("  cmpq %%rdx, %%rax\n");
      printf("  setg %%al\n");
      printf("  movzbq %%al, %%rax\n");
      printf("  pushq %%rax\n");
      break;
    case T_LTE:
      _emit_asm(node->left);
      _emit_asm(node->right);
      printf("  popq %%rdx\n");
      printf("  popq %%rax\n");
      printf("  cmpq %%rdx, %%rax\n");
      printf("  setle %%al\n");
      printf("  movzbq %%al, %%rax\n");
      printf("  pushq %%rax\n");
      break;
    case T_GTE:
      _emit_asm(node->left);
      _emit_asm(node->right);
      printf("  popq %%rdx\n");
      printf("  popq %%rax\n");
      printf("  cmpq %%rdx, %%rax\n");
      printf("  setge %%al\n");
      printf("  movzbq %%al, %%rax\n");
      printf("  pushq %%rax\n");
      break;
    case T_EQ:
      _emit_asm(node->left);
      _emit_asm(node->right);
      printf("  popq %%rdx\n");
      printf("  popq %%rax\n");
      printf("  cmpq %%rdx, %%rax\n");
      printf("  sete %%al\n");
      printf("  movzbq %%al, %%rax\n");
      printf("  pushq %%rax\n");
      break;
    case T_NOT:
      _emit_asm(node->left);
      printf("  popq %%rax\n");
      printf("  cmpq $0, %%rax\n");
      printf("  sete %%al\n");
      printf("  movzbq %%al, %%rax\n");
      printf("  pushq %%rax\n");
      break;
    case T_AND:
      _emit_asm(node->left);
      _emit_asm(node->right);
      printf("  popq %%rdx\n");
      printf("  popq %%rax\n");
      printf("  andq %%rdx, %%rax\n");
      printf("  pushq %%rax\n");
      break;
    case T_OR:
      _emit_asm(node->left);
      _emit_asm(node->right);
      printf("  popq %%rdx\n");
      printf("  popq %%rax\n");
      printf("  orq %%rdx, %%rax\n");
      printf("  pushq %%rax\n");
      break;
    case T_PP:
      printf("  movq %d(%%rbp), %%rax\n", -((int)node->left + 1) * 8);
      printf("  addq $1, %%rax\n");
      printf("  movq %%rax, %d(%%rbp)\n", -((int)node->left + 1) * 8);
      break;
    case T_BLOCK:
      _emit_asm(node->left);
      break;
  }
}

void emit_asm(Node* node) {
  int stk;
  printf("     .section .rodata\n");
  printf(".Lprompt: .string \"> \"\n");
  printf(".Lread: .string \"%%ld\"\n");
  printf(".Lprint: .string \"%%ld\\n\"\n");
  printf("     .text\n");
  printf(".globl main\n");
  printf("main:\n");
  printf("     pushq %%rbp\n");
  printf("     movq %%rsp, %%rbp\n");
  stk = (8 * stabuse + 15) / 16;
  stk *= 16;
  printf("     subq $%d, %%rsp\n", stk);
  _emit_asm(node);
  printf("     leave\n");
  printf("     ret\n\n");
}

#include "y.tab.c"
#include "lex.yy.c"

int main() {
  yyparse();
  return 0;
}
