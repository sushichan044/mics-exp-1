
sign     [+-]
digit [0-9]
dot      "."
alpha [a-zA-Z]
white [\n\t ]
%%
{digit}+                  { return NUM; }
{sign}?{digit}+({dot}{digit}+)? { return RNUM; } /* 符号つき実数 */
{alpha}({alpha}|{digit})* { return IDENT; }
{white}                   { ; }
