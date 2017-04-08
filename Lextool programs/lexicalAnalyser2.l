%{

#include<stdio.h>
#include<string.h>

char str[20];
int op = 0,var = 0,con = 0,id = 0;

%}

constant [0-9]+
operator [%|*|/|+|-]
identifier ["for"|"if"|"else"|"while"|"break"|"do"]
variable [a-zA-Z]+

%%

{constant} 	{printf("%s\n",yytext);con++;};
{operator}	{printf("%s\n",yytext);op++;};
{variable}	{printf("%s\n",yytext);var++;};
{identifier}	{printf("%s\n",yytext);id++;};
" " 		;

%%

int main()
{
	FILE *file;
	if(!file){
		
		printf("Could no open file!");
		return 0;
	}

	file =  fopen("abc.txt","r");
	yyin = file;
	yylex();	
	
	fclose(file);
		
	return 0;
}
int yywrap(){
	
	return 0;
	
}

