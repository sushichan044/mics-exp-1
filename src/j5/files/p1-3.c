#define RNUM 2
#define EXPRNUM 3
#define NUM 1
#define IDENT 4
#include "lex.yy.c"
int main() {
    int code;
    while((code=yylex())) {
        switch(code) {
            case NUM: printf("num: %s\n", yytext); break;
            case RNUM: printf("rnum: %s\n", yytext); break;
            case EXPRNUM: printf("exprnum: %s\n", yytext); break;
            case IDENT: printf("id: %s\n", yytext); break;
        }
    }
    return 0;
}
