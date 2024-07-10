%union {
  Node* np;
  int i;
  char* s;
}
%token TRUE FALSE NULL_TOKEN
%token <i> NUMBER
%token <s> STRING
%type <np> value object members pair array elements

%%

json: value {emit_yaml($1); return 0;}
    ;

value: object { $$ = $1; }
     | array { $$ = $1; }
     | STRING { $$ = createNode(T_STRING, $1, NULL); }
     | NUMBER { $$ = createNode(T_NUMBER, $1, NULL); }
     | TRUE { $$ = createNode(T_TRUE, NULL, NULL); }
     | FALSE { $$ = createNode(T_FALSE, NULL, NULL); }
     | NULL_TOKEN { $$ = createNode(T_NULL_VAL, NULL, NULL); }
     ;

object: '{' '}' { $$ = createNode(T_OBJECT, NULL, NULL); } /* 空のオブジェクト */
      | '{' members '}' { $$ = $2; }
      ;

members: pair { $$ = $1; } /* 空でないオブジェクト内のKey-Value */
       | pair ',' members { $$ = createNode(T_MEMBERS, $1, $3); }
       ;

pair: STRING ':' value { 
        Node* key = createNode(T_STRING, $1, NULL);
        $$ = createNode(T_PAIR, key, $3);
    }
  ;

array: '[' ']' { $$ = createNode(T_ARRAY, NULL, NULL); } /* 空の配列 */
     | '[' elements ']' { $$ = $2; }
     ;

elements: value { $$ = $1; } /* 空でない配列内の要素 */
        | value ',' elements { $$ = createNode(T_ELEMENTS, $1, $3); }
        ;
%%
