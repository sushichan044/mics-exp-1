#include <stdio.h>
extern char *yytext;

#include "y.tab.c"
#include "lex.yy.c"

int main() {
  yydebug = 1;
  yyparse();
  return 0;
}
