%{

    #include "y.tab.h"

%}

%%

[0-9]+      {yylval = atoi(yytext); return INTEGER;}
[-+*/]      return *yytext;
"("         return *yytext;
")"         return *yytext;
"\n"        return END;
[ \t]       ;

%%

int yywrap(){

    return 0;
}
