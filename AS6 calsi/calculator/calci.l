%{
#include "y.tab.h"
#include <stdio.h>
#include <math.h>
%}

%%

[ \t]               ; // Ignore whitespace
\n                  return 0; // Newline ends token
[0-9]+(\.[0-9]*)?   { yylval.dval = atof(yytext); return NUMBER; } // Match numbers
sin                 return SIN;
cos                 return COS;
tan                 return TAN;
log                 return LOG;
sqrt                return SQRT;
ln                  return LN;
.                   return yytext[0]; // Any other character is returned as is

%%

int yywrap() {
    return 1;
}
