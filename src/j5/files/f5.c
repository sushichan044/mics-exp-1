/* c f5.c */
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

extern char *yytext;

#define T_STRING 1
#define T_NUMBER 2
#define T_TRUE 3
#define T_FALSE 4
#define T_NULL_VAL 5
#define T_OBJECT 6
#define T_MEMBERS 7
#define T_PAIR 8
#define T_ARRAY 9
#define T_ELEMENTS 10

typedef struct Node {
    int node_type;
    union {
        int i;
        char* s;
    } value;
    struct Node* left;
    struct Node* right;
} Node;

// 新しいノードを作る関数
Node* createNode(int node_type, Node* left, Node* right) {
    Node* newNode = (Node*)malloc(sizeof(Node));
    newNode->node_type = node_type;
    newNode->left = left;
    newNode->right = right;
    return newNode;
}

void print_indent(int depth) {
    for (int i = 0; i < depth; ++i) {
        printf("  ");
    }
}

void _emit_yaml(Node* node, int depth) {
  if (node == NULL) {
    return;
  }
  switch (node->node_type) {
    case T_STRING:
      printf("STRING");
      printf("\"%s\"", node->left);
      break;
    case T_NUMBER:
      printf("%d", node->left);
      break;
    case T_TRUE:
      printf("true");
      break;
    case T_FALSE:
      printf("false");
      break;
    case T_NULL_VAL:
      printf("null");
      break;
    case T_OBJECT:
      printf("\n");
      print_indent(depth);
      printf("{}");
      break;
    case T_MEMBERS:
      _emit_yaml(node->left, depth);
      if (node->right != NULL) {
        printf("\n");
        _emit_yaml(node->right, depth);
      }
      break;
    case T_PAIR:
      print_indent(depth);
      printf("%s: ", node->left->left);
      _emit_yaml(node->right, depth + 1);
      break;
    case T_ARRAY:
      printf("\n");
      print_indent(depth);
      printf("[]");
      break;
    case T_ELEMENTS:
      _emit_yaml(node->left, depth);
      if (node->right != NULL) {
        printf(",\n");
        _emit_yaml(node->right, depth);
      }
      break;
  }
}

void emit_yaml(Node* node) {
  _emit_yaml(node, 0);
  printf("\n");
}

#include "y.tab.c"
#include "lex.yy.c"

int main() {
  yydebug = 1;
  yyparse();
  return 0;
}
