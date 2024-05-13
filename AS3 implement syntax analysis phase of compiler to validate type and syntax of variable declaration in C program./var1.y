%{
#include<stdio.h>
int yylex();
int yyerror();

%}
%token ID TYPE SC NL COMMA
%%
start:TYPE varlist SC NL 	{printf("valid declarative statement");}
;

varlist:varlist COMMA ID
	|ID
;

%%
int yyerror()
{
printf("Invalid declarative statement");
}

int yywrap()
{
return 1;
}

int main()
{
yyparse();
}
/*It defines a common language (the token types) that both files understand.
The lex file uses this agreement to recognize patterns and assign them appropriate token types.
The yacc file then uses these token types to build the parse tree and understand the structure of the input.*/