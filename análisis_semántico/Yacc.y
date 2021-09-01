%{
#include<stdio.h>
%}

%token FLOAT INTEGER VARIABLE
%token PARIZQ PARDER 
%token R S P D DI M
%start Estart

%%
Estart:         PARIZQ Estart PARDER | Estart Op Estart | Var;
Var:            R varr | varr;
varr:           INTEGER | FLOAT | VARIABLE
Op:             R | S | P | D | DI | M;

%%


int yywrap() {
    return 1;
}

int yyerror(s)
char *s;
{
  fprintf(stderr, "\n%s\n",s);
}

void main(){
    yyparse();
    puts("\n");
}
