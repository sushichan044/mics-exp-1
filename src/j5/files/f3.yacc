%union {
  Node* np;
  int i;
}
%type <np> stlist stat expr prim var cond
%token NUM IDENT READ PRINT PRINTLN WHILE IF BREAK
%token PLUSPLUS LTE GTE EQ AND OR TRUE FALSE


%left OR
%left AND
%left '<' '>' LTE GTE EQ
%right '!'
%%
prog   : IDENT '{' stlist '}'       { emit_c($3); return 0; }
       ;
stlist :                            { $$ = NULL; }
       | stlist stat                { $$ = createNode(T_STLIST, $1, $2); }
       ;
stat   : var '=' expr ';'           { $$ = createNode(T_ASSIGN, $1, $3); }
       | READ var ';'               { $$ = createNode(T_READ, $2, NULL); }
       | PRINT expr ';'             { $$ = createNode(T_PRINT, $2, NULL); }
       | PRINTLN expr ';'           { $$ = createNode(T_PRINTLN, $2, NULL); }
       | IF '(' cond ')' stat       { $$ = createNode(T_IF, $3, $5); }
       | WHILE '(' cond ')' stat    { $$ = createNode(T_WHILE, $3, $5); }
       | BREAK ';'                  { $$ = createNode(T_BREAK, NULL, NULL); }
       | '{' stlist '}'             { $$ = createNode(T_BLOCK, $2, NULL); }
       ;
expr   : prim                       { $$ = $1; }
       | expr '+' prim              { $$ = createNode(T_ADD, $1, $3); }
       | expr '-' prim              { $$ = createNode(T_SUB, $1, $3); }
       | expr '*' prim              { $$ = createNode(T_MUL, $1, $3); }
       | expr '/' prim              { $$ = createNode(T_DIV, $1, $3); }
       | expr '%' prim              { $$ = createNode(T_MOD, $1, $3); }
       ;
prim   : NUM                        { $$ = createNode(T_NUM, atoi(yytext), NULL); }
       | var                        { $$ = createNode(T_VAR, $1, NULL); }
       | '(' expr ')'               { $$ = $2; }
       | var PLUSPLUS               { $$ = createNode(T_PP, $1, NULL); }
       ;
var    : IDENT                      { $$ = lookup(yytext); }
       ;
cond   : expr '<' expr     { $$ = createNode(T_LT, $1, $3); }
       | expr '>' expr     { $$ = createNode(T_GT, $1, $3); }
       | expr GTE expr     { $$ = createNode(T_GTE, $1, $3); }
       | expr LTE expr     { $$ = createNode(T_LTE, $1, $3); }
       | expr EQ expr      { $$ = createNode(T_EQ, $1, $3); }
       | cond AND cond     { $$ = createNode(T_AND, $1, $3); }
       | cond OR cond      { $$ = createNode(T_OR, $1, $3); }
       | '!' '(' cond ')'  { $$ = createNode(T_NOT, $3, NULL); }
       | TRUE             { $$ = createNode(T_TRUE, NULL, NULL); }
       | FALSE            { $$ = createNode(T_FALSE, NULL, NULL); }
       ;
