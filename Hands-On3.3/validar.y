%{
    #include <stdio.h>
    #include <stdlib.h>
    
    int yylex(void);
    void yyerror(const char *s);
    %}
    
    %token AND OR NOT BOOL NUMBER
    %left OR
    %left AND
    %left '+' '-'
    %left '*' '/'
    %right NOT
    
    %%
    input:
          expr '\n' { printf("Expresion valida\n"); }
        | error '\n' { yyerror("Expresion invalida"); yyerrok; }
        ;
    
    expr:
          expr '+' expr
        | expr '-' expr
        | expr '*' expr
        | expr '/' expr
        | expr AND expr
        | expr OR expr
        | NOT expr
        | '(' expr ')'
        | NUMBER
        | BOOL
        ;
    %%
    void yyerror(const char *s) {
        fprintf(stderr, "Error: %s\n", s);
    }
    