%token NUM;
%token NEWLINE
%%
expr : NUM              { printf("NUM: %s\n", yytext); }
     | expr '*' NUM     { printf("MUL: %s\n", yytext); }
     | expr '/' NUM     { printf("DIV: %s\n", yytext); }
     | expr '+' NUM     { printf("ADD: %s\n", yytext); }
     | expr '-' NUM     { printf("SUB: %s\n", yytext); }
     | expr '%' NUM     { printf("MOD: %s\n", yytext); }
     ;
