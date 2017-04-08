%{
#include<stdio.h>
#include<string.h>

int vowels = 0,digits = 0,letters = 0;

%}
%%

[aeiouAEIOU] 	{vowels++;letters++;};
[0-9] 		digits++;
[a-zA-Z] 	letters++;
";"		{printf("Vowels : %d \nDigits : %d \nLetters : %d \n",vowels,digits,letters);}

%%

int main(){
	
	yylex();
	return 0;
}
int yywrap(){
	
	return 0;
}

