%{
#include <stdio.h>
#include <stdlib.h>

int yylex(void);
void yyerror(const char *s);
%}

%token AND OR NOT BOOLEAN
%left OR
%left AND
%right NOT

%%
input:
      expr '\n' { printf("Expresion valida\n"); }
    | error '\n' { yyerror("Expresion invalida"); yyerrok; }
    ;

expr:
      expr AND term
    | expr OR term
    | term
    ;

term:
      NOT factor
    | factor
    ;

factor:
      '(' expr ')'
    | BOOLEAN
    ;
%%

void yyerror(const char *s) {
    fprintf(stderr, "Error: %s\n", s);
}
