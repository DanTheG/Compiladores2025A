%{
#include "validar.tab.h"
#include <unistd.h>
#include <io.h>
%}

%option noyywrap
%option nounput
%option noinput

%%
"AND"      { return AND; }
"OR"       { return OR; }
"NOT"      { return NOT; }
"true"|"false"|"1"|"0"  { return BOOL; } // Para los booleanos
[0-9]+     { yylval = atoi(yytext); return NUMBER; } // Para números enteros
[ \t]      ;      // Ignorar espacios y tabs
[\n]       { return '\n'; }
"("        { return '('; }
")"        { return ')'; }
"+"        { return '+'; }
"-"        { return '-'; }
"*"        { return '*'; }
"/"        { return '/'; }
.          { return yytext[0]; }
%%
