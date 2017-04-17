%{

    #include<stdio.h>
    #include<stdlib.h>
    #include<math.h>

    int yylex();
    int yyerror(char *msg);
    int flag = 0;
%}
%start program
%token INTEGER
%token FLOAT
%token DOUBLE
%token END
%token PLUS
%token EQUAL

%left EQUAL
%left PLUS

%%

program : program exp END {
    
                if(flag==0)
                {
                    switch($2)
                    {
                        case 1 : printf("Integer\n"); break;
                        case 2 : printf("Float\n"); break;
                        case 3 : printf("Double\n"); break;
                        case 4 : printf("Boolean\n"); break;
                        case 5 : printf("Type Mismatch!\n"); break;
                    }
                }
        }
        |
        ;

exp     : INTEGER                       {$$ = 1;}
        | FLOAT                         {$$ = 2;}
        | DOUBLE                        {$$ = 3;}
        | exp PLUS exp                   {
            printf("%d %d",$1,$3);
            if($1 == $3) $$ = $1;
            else{
                if( ($1 == 2 && $3 == 1) || ($1 == 1 && $3== 2) ) $$ = 2;
                else if( ($1 == 3 && $3 == 2) || ($1 == 2 && $3 ==3)  ) $$ = 3;
                else $$ = 3;
            }
            
        }
        | exp EQUAL EQUAL exp                {
            
            if($1 == $4) $$ = 4;
            else $$ = 5;
        
        }
        |
        ;

%%

int main(){

    yyparse();
    return 0;
}

int yyerror(char *msg){

    printf("ERROR : %s" , msg);
    return 1;

}
