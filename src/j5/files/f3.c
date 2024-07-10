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
#define T_IF    20
#define T_BREAK 21
#define T_TRUE  22
#define T_FALSE 23
#define T_MUL   24
#define T_DIV   25
#define T_MOD   26
#define T_PRINTLN 27

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

void _emit_c(Node* node) {
  if (node == NULL) {
    return;
  }
  switch (node->node_type) {
    case T_STLIST:
      if (node->left != NULL) { _emit_c(node->left); }
      _emit_c(node->right);
      break;
    case T_ASSIGN:
      printf("\tv%d = ", node->left);
      _emit_c(node->right);
      printf(";\n");
      break;
    case T_READ:
      printf("\tscanf(\"%%d\", &v%d);\n", node->left);
      break;
    case T_PRINT:
      printf("\tprintf(\"%%d\",");
      _emit_c(node->left);
      printf(");\n");
      break;
    case T_PRINTLN:
      printf("\tprintf(\"%%d\",");
      _emit_c(node->left);
      printf(");\n");
      printf("\tprintf(\"\\n\");");
      printf("\n");
      break;
    case T_ADD:
      _emit_c(node->left);
      printf(" + ");
      _emit_c(node->right);
      break;
    case T_SUB:
      _emit_c(node->left);
      printf(" - ");
      _emit_c(node->right);
      break;
    case T_NUM:
      printf("%d", node->left);
      break;
    case T_VAR:
      printf("v%d", node->left);
      break;
    case T_WHILE:
      printf("\twhile (");
      _emit_c(node->left);
      printf(") {\n\t");
      _emit_c(node->right);
      printf("\t}\n");
      break;
    case T_LT:
      _emit_c(node->left);
      printf(" < ");
      _emit_c(node->right);
      break;
    case T_GT:
      _emit_c(node->left);
      printf(" > ");
      _emit_c(node->right);
      break;
    case T_LTE:
      _emit_c(node->left);
      printf(" <= ");
      _emit_c(node->right);
      break;
    case T_GTE:
      _emit_c(node->left);
      printf(" >= ");
      _emit_c(node->right);
      break;
    case T_EQ:
      _emit_c(node->left);
      printf(" == ");
      _emit_c(node->right);
      break;
    case T_NOT:
      printf("!");
      _emit_c(node->left);
      break;
    case T_AND:
      _emit_c(node->left);
      printf(" && ");
      _emit_c(node->right);
      break;
    case T_OR:
      _emit_c(node->left);
      printf(" || ");
      _emit_c(node->right);
      break;
    case T_PP:
      printf("v%d++", node->left);
      break;
    case T_BLOCK:
      _emit_c(node->left);
      break;
    case T_IF:
      printf("\tif (");
      _emit_c(node->left); /* 条件式 */
      printf(") {\n\t");
      _emit_c(node->right); /* 文 */
      printf("\t}\n");
      break;
    case T_BREAK:
      printf("\tbreak;\n");
      break;
    case T_TRUE:
      printf("1");
      break;
    case T_FALSE:
      printf("0");
      break;
    case T_MUL:
      _emit_c(node->left);
      printf(" * ");
      _emit_c(node->right);
      break;
    case T_DIV:
      _emit_c(node->left);
      printf(" / ");
      _emit_c(node->right);
      break;
    case T_MOD:
      _emit_c(node->left);
      printf(" %% ");
      _emit_c(node->right);
      break;
  }
}

void emit_c(Node* node) {
  printf("#include <stdio.h>\n");
  printf("int main() {\n");
  int i;
  for (i = 0; i < stabuse; i++) {
    printf("\tint v%d;\n", i);
  }
  _emit_c(node);
  printf("}\n");
}

#include "y.tab.c"
#include "lex.yy.c"

int main() {
  yydebug = 1;
  yyparse();
  return 0;
}
