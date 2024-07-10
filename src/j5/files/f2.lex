digit [0-9]
dot      "."
exp      "e"
pi       "pi"
sign     [+-]
white [\t ]
%%
{digit}+({dot}{digit}+)?({exp}{sign}?{digit}+)? { return NUM; } /* 符号つき実数(指数表現にも対応) */
"pi" { return PI;}
[+*-/^()]       { return yytext[0]; }
"\n"      { return '\n'; }
{white}   { ; }
