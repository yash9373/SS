%{
#include <stdio.h>
%}

%token COMPOUND WORD DOT

%%

S1: S S1
    | S
    ;

S : WORD_LIST COMPOUND WORD_LIST DOT { printf("\n Compound statement"); }
    | WORD_LIST DOT { printf("\n Simple Statement"); }
    ;

WORD_LIST : WORD WORD_LIST
    | WORD
    ;

%%

extern FILE *yyin;

int main() {
    yyin = fopen("sample.txt", "r");
    yyparse();
    return 0;
}

int yyerror(const char *msg) {
    fprintf(stderr, "Error: %s\n", msg);
    return 1;
}
      