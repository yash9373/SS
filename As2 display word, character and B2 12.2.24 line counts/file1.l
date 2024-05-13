/* DESCRIPTION/DEFINITION SECTION */
%{
#include<stdio.h>

int lc=0, sc=0, tc=0, ch=0, wc=0; // GLOBAL VARIABLES
%}

%%
[\n] { lc++; ch += yyleng; }
[ \t] { sc++; ch += yyleng; }
[^\t\n ] { tc++; ch += yyleng; }
[^\t\n ]+ { wc++; ch += yyleng; }
%%

int yywrap() { return 1; }
/* After inputting press ctrl+d */

int main() {
    FILE *file = fopen("input1.txt", "r"); // Open input file
    if (!file) {
        printf("Error opening file\n");
        return 1;
    }

    yyin = file; // Set the input file for the lexer

    yylex(); // Run the lexer

    fclose(file); // Close the input file

    // Print counts
    printf("Line count: %d\n", lc);
    printf("Space count: %d\n", sc);
    printf("Tab count: %d\n", tc);
    printf("Character count: %d\n", ch);
    printf("Word count: %d\n", wc);

    return 0;
}
