%{
    #include "y.tab.h"
%}

num [0-9]

integer {num}{num}*
float   {num}{num}*.({num}{1,2})  
double  {num}{num}*.({num}{3,8})

%%

{integer}   return INTEGER;
{float}    return FLOAT;
{double}    return DOUBLE;
[\t()]      {;}
"+"         return PLUS;
"="         return EQUAL;
"\n"        return END;
" "         {;}

%%

int yywrap(){
    return 0;
}