sign     [+-]
exp      "e"
digit [0-9]
dot      "."
white [\n\t ]
%%
{sign}?{digit}+({dot}{digit}+)? { return NUM; } /* 符号つき実数(指数は諦めた) */
"*"       { return '*'; }
"/"       { return '/'; }
"+"       { return '+'; }
"-"       { return '-'; }
"%"       { return '%'; }
{white}   { ; }
