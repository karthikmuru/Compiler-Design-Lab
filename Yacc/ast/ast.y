%{
    #include<stdio.h>
    #include<string.h>
    #include<stdlib.h>

    typedef struct node{
        struct node *left;
        struct node *right;
        char *token;
    }n;

    int yylex();
    int yyerror(char *msg);
    struct node *mknode(struct node *left,struct node *right,char *token);
    void printTree(struct node *tree);
%}

%start lines

%token NUMBER
%token PLUS MINUS TIMES
%token LEFT_PARA RIGHT_PARA
%token END

%left PLUS MINUS
%left TIMES

%%

lines   : 
        | lines line
        ;
        

line    : exp END                   {printTree($1); printf("\n");}
        ;

exp     : term                      {$$ = $1;}
        | exp PLUS term             {$$ = mknode($1, $3, "+");}
        | exp MINUS term            {$$ = mknode($1, $3, "-");}
        ;

term    : factor                    {$$ = $1;}
        | term TIMES factor         {$$ = mknode($1, $3, "*");}
        ;

factor  : NUMBER                    {$$ = mknode(0, 0, (char *)yylval);}
        | LEFT_PARA exp RIGHT_PARA  {$$ = $2;}
        ;

%%

int main(void){
    printf("Hello world");
    return yyparse();
}

struct node* mknode(struct node *left,struct node *right, char *token){

    printf("%s\n",token);
    struct node* newnode = (struct node *)malloc(sizeof(struct node));
    /*char *newstr = (char *)malloc(sizeof(token) + 1);
    newnode->left = left;
    newnode->right = right;

    strcpy(newstr, token);
    newnode->token = newstr;

    return(newnode);*/

}

void printTree(struct node *tree){

    /*printf("lkdsf");
    if(tree->left || tree->right)
        printf("(");

    printf("%s",tree->token);
    if(tree->left)
        printTree(tree->left);
    if(tree->right)
        printTree(tree->right);

    if(tree->left || tree->right)
        printf(")");*/

}
int yyerror(char *msg){
    printf("Error : %s",msg);
    return 0;
}



