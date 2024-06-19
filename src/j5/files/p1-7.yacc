%token NUM;
%left '+' '-'
%left '*' '/' '%'
%%
expr : NUM              { printf("NUM: %s\n", yytext); }
     | expr '*' expr     { printf("MUL: %s\n", yytext); }
     | expr '/' expr     { printf("DIV: %s\n", yytext); }
     | expr '%' expr     { printf("MOD: %s\n", yytext); }
     | expr '+' expr     { printf("ADD: %s\n", yytext); }
     | expr '-' expr     { printf("SUB: %s\n", yytext); }
     ;
