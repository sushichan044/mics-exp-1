%{
#include <stdio.h>
#include <stdlib.h>
#include <math.h>
%}
%token NUM;
%left '+' '-'
%left '*' '/' '%'
%right '^'
%%
exprlist:
        | exprlist expr '\n'    { printf("%d\n", $2); }
        ;
expr    : expr '+' expr     { $$ = $1 + $3; }
        | expr '-' expr     { $$ = $1 - $3; }
        | expr '*' expr     { $$ = $1 * $3; }
        | expr '/' expr     { $$ = $1 / $3; }
        | expr '%' expr     { $$ = $1 % $3; }
        | expr '^' expr     { $$ = pow($1, $3);  }
        | '(' expr ')'      { $$ = $2; }
        | NUM               { $$ = atoi(yytext); }
        ;
%%
