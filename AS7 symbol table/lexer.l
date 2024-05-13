%{
  #include"y.tab.h"
  #include<stdio.h>
  #include<string.h>
  void yyerror(char* s);
  int yylex();
%}

%option noyywrap

%%
"print" { return print; }
"int"|"float"|"char" { yylval.type = strdup(yytext); return TYPE; }
[a-zA-Z][a-zA-Z0-9]* { yylval.id = strdup(yytext); return ID; }
";" { return SEMI_COLON; }
"," { return COMMA; }
[ \t\n] { }
. { printf("\nUnrecognied Syntaxx"); }

%%