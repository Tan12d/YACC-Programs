%{
#include "y.tab.h"
%}

DIGIT       [0-9]
LETTER      [a-zA-Z]
ID          ({LETTER}|_)(({LETTER}|{DIGIT}|_)*)
NUMBER      {DIGIT}+(\.{DIGIT}+)?

%%
"+"         { return PLUS; }
"-"         { return MINUS; }
"*"         { return MULTIPLY; }
"/"         { return DIVIDE; }
"("         { return LPAREN; }
")"         { return RPAREN; }
{ID}        { yylval.str_val = strdup(yytext); return ID; }
{NUMBER}    { yylval.num_val = atof(yytext); return NUMBER; }
[ \t\n]     /* Skip whitespace */
.           { /* Handle error */ }
%%

int yywrap() {
    return 1;
}
