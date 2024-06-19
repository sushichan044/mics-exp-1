#define RNUM 1
#define NUM 2
#define IDENT 3
#include "lex.yy.c"
int main() {
    int code;
    while((code=yylex())) {
        switch(code) {
            case RNUM: printf("rnum: %s\n", yytext); break;
            case NUM: printf("num: %s\n", yytext); break;
            case IDENT: printf("id: %s\n", yytext); break;
        }
    }
    return 0;
}
