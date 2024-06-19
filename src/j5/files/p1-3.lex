
sign     [+-]
exp      "e"
digit [0-9]
dot      "."
alpha [a-zA-Z]
white [\n\t ]
%%
{digit}+                  { return NUM; }
{sign}?{digit}+({dot}{digit}+)? { return RNUM; } /* 符号つき実数 */
{sign}?{digit}+({dot}{digit}+)?({exp}{digit}+)? { return EXPRNUM; } /* 符号つき指数表現 */
{alpha}({alpha}|{digit})* { return IDENT; }
{white}                   { ; }
