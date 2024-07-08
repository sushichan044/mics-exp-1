#include <stdio.h>
#include <stdlib.h>
#include <math.h>
extern char *yytext;

#include "y.tab.c"
#include "lex.yy.c"

int main() {
  yyparse();
  return 0;
}
