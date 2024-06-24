%token NUM;
%%
expr   : NUM            { value = atoi(yytext); } /* 本来(int)atof(yytext)として指数表現に対応したかったがgccに怒られた */
       | expr '+' NUM   { value = value + atoi(yytext); }
       | expr '-' NUM   { value = value - atoi(yytext); }
       | expr '*' NUM   { value = value * atoi(yytext); }
       | expr '/' NUM   { value = value / atoi(yytext); }
       | expr '%' NUM   { value = value % atoi(yytext); }
       ;
