#include<stdio.h>
extern int yylex(); // Declare yylex function defined in lex.yy.c
void main()
{
  int a,b,c;
   a=4;
   b=5;

  c=a+b;  // addition 
  printf("Accept number a");
 /* number is 
accepted */
yylex();  
 }
