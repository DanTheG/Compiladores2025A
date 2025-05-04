%{
#include <stdio.h>
#include <stdlib.h>

// Declaraciones para evitar errores
int yylex(void);
void yyerror(const char *s);
%}
%token NUMBER
%left '+' '-'
%left '*' '/'
%right UMINUS
%%
input: expr '\n' { printf("Expresion valida\n"); }
| error '\n' { yyerror("Expresion invalida"); yyerrok; }
;
expr: expr '+' expr
| expr '-' expr
| expr '*' expr
| expr '/' expr
| '-' expr %prec UMINUS
| '(' expr ')'
| NUMBER
;
%%
void yyerror(const char *s) {
    fprintf(stderr, "Error: %s\n", s);
}