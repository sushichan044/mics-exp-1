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
        | '(' expr ')'      { $$ = $2; }
        | NUM               { $$ = atoi(yytext); }
        ;
%%
