sign     [+-]
exp      "e"
digit [0-9]
dot      "."
alpha [a-zA-Z]
white [\n\t ]
%%
{sign}?{digit}+({dot}{digit}+)?({exp}{digit}+)? { return NUM; } /* 符号つき実数(指数も可能) */
"*"       { return '*'; }
"/"       { return '/'; }
"+"       { return '+'; }
"-"       { return '-'; }
"%"       { return '%'; }
{white}                   { ; }
