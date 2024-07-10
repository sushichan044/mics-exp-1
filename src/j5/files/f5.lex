alpha   [a-zA-Z]
digit   [0-9]
white      [ \t\n\r]

%%
"true"                      { return TRUE; }
"false"                     { return FALSE; }
"null"                      { return NULL_TOKEN; }
{digit}+                    { return NUMBER; }
\"[^"]*\"                   { return STRING; }
"{"                         { return '{'; }
"}"                         { return '}'; }
"\["                        { return '['; }
"\]"                        { return ']'; }
":"                         { return ':'; }
","                         { return ','; }
{white}
%%
