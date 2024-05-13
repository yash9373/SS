%{
#include<stdio.h>
#include "y.tab.h"
%}

%%

[\t\n] ; // Ignore tabs and newlines

(""[aA]|[nN][dD]"")|(""[oO][rR]"")|(""[bB][uU][tT]"") { return COMPOUND; }
[a-zA-Z]+ { return WORD; }
\. { return DOT; }

%%

int yywrap() {
    return 1;
}
