
%{

//LexTool program to count the number of variables, digits, operators and identifiers

#include<stdio.h>
#include<string.h>

char str[20];
int var = 0, dig = 0, op = 0, id = 0;
%}

digits [0-9]+
operators [+|-|*|/|=]
identifier "if"|"else"|"for"|"while"|"do"|"break"
variable [(a-zA-Z)(_a-zA-Z0-9)*]

%%

{digits} dig++;
{operators} op++;
{identifier} id++;
{variable} var++;
"\n" printf("\nVariables : %d \n Operators : %d \n Identifiers : %d \n Digits : %d\n",var,op,id,dig);

%%

int main()
{
  yylex();
  return 0;
}
int yywrap()
{
  return 0;
}
