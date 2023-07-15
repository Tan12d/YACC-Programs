%{
/* Definition section */
#include <stdio.h>
#include <stdlib.h>
void yyerror(char *msg);
%}

%token ID
%left '+' '-'
%left '*' '/'
%left UMINUS

/* Rule Section */
%%

S : E
E : E'+'{A1();}T{A2();}
| E'-'{A1();}T{A2();}
| T
;
T : T'*'{A1();}F{A2();}
| T'/'{A1();}F{A2();}
| F
;
F : '('E{A2();}')'
| '-'{A1();}F{A2();}
| ID{A3();}
;

%%

#include"lex.yy.c"
char st[100];
int top=0;

//driver code
int main()
{
	printf("Enter infix expression: ");
	yyparse();
	printf("\n");
	return 0;
}

int A1()
{
	st[top++]=yytext[0];
}

int A2()
{
	printf("%c", st[--top]);
}

int A3()
{
	printf("%c", yytext[0]);
}

void yyerror(char *msg)
{
fprintf(stderr, "\n%s", msg);
}



int yywrap()
{
return 1;
}
