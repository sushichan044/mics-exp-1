exp      "e"
digit [0-9]
white [\t ]
%%
{digit}+({exp}{digit}+)? { return NUM; } /* 符号つき実数(指数も可能) */
[+*-/%^()]       { return yytext[0]; }
"\n"      { return '\n'; }
{white}   { ; }
