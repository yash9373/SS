%{
#include <stdio.h>
#include <stdlib.h>
#include <math.h>

extern double yylval_dval; // Defined in the Lex file

void yyerror(const char *s);

%}

%union {
    double dval;
}

%token <dval> NUMBER
%token SIN COS TAN LOG LN SQRT SQUARE CUBE

%left '+' '-'
%left '*' '/'
%nonassoc uminus  //%prec uminus: This declaration specifies the precedence level for the unary minus (-) operator. In your grammar, it's associated with the production

%type <dval> exp

%%

ss: exp { printf("Answer=%g\n", $1); }

exp: exp '+' exp  { $$ = $1 + $3; }
    | exp '-' exp  { $$ = $1 - $3; }
    | exp '*' exp  { $$ = $1 * $3; }
    | exp '/' exp  { 
                        if ($3 == 0) {
                            yyerror("Divide By Zero");
                            exit(0);
                        }
                        else {
                            $$ = $1 / $3;
                        }
                    }
    | '-' exp %prec uminus { $$ = -$2; }  //ou are specifying the precedence level for the unary minus (-) operator.
    | '(' exp ')'   { $$ = $2; }
    | SIN '(' exp ')'   { $$ = sin($3); }
    | COS '(' exp ')'   { $$ = cos($3); }
    | TAN '(' exp ')'   { $$ = tan($3); }
    | LOG '(' exp ')'   { $$ = log($3); }
    | LN '(' exp ')'    { $$ = log($3); }
    | SQRT '(' exp ')'  { $$ = sqrt($3); }
    | SQUARE '(' exp ')'    { $$ = $3 * $3; }
    | CUBE '(' exp ')'  { $$ = $3 * $3 * $3; }
    | NUMBER        { $$ = $1; }
    ;

%%

void yyerror(const char *s) {
    printf("ERROR: %s\n", s);
}

int main() {
  int a = 4;
  do{
    printf("\nEnter expression: ");
    yyparse();
  }while(a = 1)
    return 0;
}
