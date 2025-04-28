%{
#include "validar.tab.h"
#include <unistd.h>  // Añade esto para isatty()
#include <io.h>      // Necesario para MSYS2/Mingw
%}

%option noyywrap
%option nounput
%option noinput

%%
[0-9]+      { yylval = atoi(yytext); return NUMBER; }
[ \t]       ;
[\n]        { return '\n'; }
[+\-*/()]   { return yytext[0]; }
.           { return yytext[0]; }
%%