%{
    #include "y.tab.h"
%}

%%

[0-9]*  {yylval = (int)yytext; return NUMBER;};
"+"     {return PLUS;};
"-"     {return MINUS;};
"*"     {return TIMES;};
[\t\n]  {;};
"("     {return LEFT_PARA;};
")"     {return RIGHT_PARA;};
";"     {return END;};

%%

int yywrap(){return 1;}



