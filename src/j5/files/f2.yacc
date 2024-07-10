%{
#include <stdio.h>
#include <stdlib.h>
#define YYSTYPE double
#define MY_PI	3.141592653589793238462643

double pow(const double a, const int b) {
  double result = 1;
  if (b == 0) {
    return result;
  }
  if (b < 0) {
    return 1 / pow(a, -b);
  }

  for (int i = 0; i < b; i++) {
    result *= a;
  }
  return result;
}

%}
%token NUM PI;
%left '+' '-'
%left '*' '/'
%left UMINUS
%right '^'
%%
exprlist:
        | exprlist expr '\n'    { printf("%.16g\n", $2); }
        ;
expr    : expr '+' expr     { $$ = $1 + $3; }
        | expr '-' expr     { $$ = $1 - $3; }
        | expr '*' expr     { $$ = $1 * $3; }
        | expr '/' expr     { $$ = $1 / $3; }
        | expr '^' expr     { $$ = pow($1, (int)$3); }
        | '-' expr %prec UMINUS   { $$ = -$2; }
        | '(' expr ')'      { $$ = $2; }
        | PI                { $$ = MY_PI; }
        | NUM               { $$ = strtod(yytext, NULL); }
        ;
%%
