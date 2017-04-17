%{
    #include<stdio.h>
    #include<stdlib.h>
    #include<string.h>

    int yyerror(char *msg);
    int yylex();
%}

%start program
%token INTEGER
%token END
%left '+' '-'
%left '*' '/'

%%

program     : line program
            | line
            ;

line        : expr END        {printf("%d\n",$1);}
            | END
            ;

expr        : mulex             {$$ = $1;}
            | expr '+' mulex    {$$ = $1 + $3;}
            | expr '-' mulex    {$$ = $1 - $3;}
            ;

mulex       : term              {$$ = $1;}
            | mulex '*' term    {$$ = $1 * $3;}
            | mulex '/' term    {$$ = $1 / $3;}
            ;

term        : INTEGER           {$$ = yylval;}
            | '(' expr ')'      {$$ = $2;}
            ;

%%

int main(){

    yyparse();
    return 0;
}

int yyerror(char *msg){

    printf("Error : %s",msg);
    return 0;
}

