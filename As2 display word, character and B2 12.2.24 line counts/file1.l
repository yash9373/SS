/* DESCRIPTION/DEFINITION SECTION */
%{
#include<stdio.h>
#include <stdio.h>

int lc=0,sc=0,tc=0,ch=0,wc=0;	 // GLOBAL VARIABLES
%}


%%
[\n] { lc++; ch+=yyleng;}
[ \t] { sc++; ch+=yyleng;}
[^\t] { tc++; ch+=yyleng;}
[^\t\n ]+ { wc++; ch+=yyleng;} 
%%

int yywrap(){ return 1; }
/*	 After inputting press ctrl+d		 */


int main() {
    FILE *file = fopen("input1.txt", "r"); // Open input file
    if (!file) {
        printf("Error opening file\n");
        return 1;
    }

    yyin = file; // Set the input file for the parser

    yyparse(); // Parse the input file

    fclose(file); // Close the input file

    return 0;
}

