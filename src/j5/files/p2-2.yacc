%token NUM;
%%
exprlist:
        | exprlist expr '\n'    { printf("%d\n", $2); }
        ;

expr    : term                  { $$ = $1; }
        | expr '+' term         { $$ = $1 + $3; }
        ;
term    : prim                  { $$ = $1; }
        | term '*' prim         { $$ = $1 * $3; }
        ;
prim    : NUM                   { $$ = atoi(yytext); }
        | '(' expr ')'          { $$ = $2; }
        ;
