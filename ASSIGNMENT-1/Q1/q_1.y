%{
#include <stdio.h>
#include <stdlib.h>
%}

%union {
    double num_val;
    char* str_val;
}

%token <num_val> NUMBER
%token <str_val> ID
%token PLUS MINUS MULTIPLY DIVIDE LPAREN RPAREN

%left PLUS MINUS
%left MULTIPLY DIVIDE

%%

expr: expr PLUS expr
    | expr MINUS expr
    | expr MULTIPLY expr
    | expr DIVIDE expr
    | LPAREN expr RPAREN
    | ID
    | NUMBER
    ;

%%

int main() {
	printf("Enter the string:\n");
    yyparse();
    
    return 0;
}

int yyerror(const char* msg) {
    fprintf(stderr, "Error: %s\n", msg);
    return 0;
}
