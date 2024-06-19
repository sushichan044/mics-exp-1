%token NUM;
%%
expr : NUM              { printf("NUM: %s\n", yytext); }
     | NUM '+' expr     { printf("ADD: %s\n", yytext); }
     ;
