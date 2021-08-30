%{
#include<stdio.h>
%}
// info en: https://www.ibm.com/docs/en/aix/7.1?topic=concepts-lex-yacc-program-information
%start E

//%token TKSUBINDER TKSUBNIZQASIGNIZQ ASIGNDER PARENTIGNDER TKRANG TKCOMA TKSUBNIZQ ASIGNI INTEGER FLOAT ARRAY LOGOR LOGLES LOGGRE LOGGEQ LOGLEQ LOGOREW LOGNOTEQ LOGAND LOGNOT COMMEN
%token PARIZQ PARDER INTEGER FLOAT
%token R sum
%token P D M DI
%token EX


%% 
E: 
  |
  E stat '\n'
  |
  E error '\n'
  {
    yyerrok;
  }
  ;

stat: Sim
      {
        printf("%d\n",$1);
      }
      ;

Sim: PARIZQ Sim PARDER
    {
      $$ = $2;
    }
    |
    Sim EX Sim
    {
      float pow = 1;
      for(int i = 0; i < $3; i++)
        pow = $1;
      $$ = pow;
    }
    |
    Sim P Sim
    {
      $$ = $1 * $3;
    }
    |
    Sim D Sim
    {
      $$ = $1 / $3;
    }
    |
    Sim DI Sim
    {
      $$ = ($1 - ($1 % $3) ) / $3;  
    }
    |
    Sim M Sim 
    {
      $$ = $1 % $3;
    } 
    |
    Sim sum Sim
    {
      $$ = $1 + $3;
    }
    |
    Sim R Sim
    {
      $$ = $1 - $3;
    }
    |   
    R Sim
    {
      $$ = - $2;
    }
    |
    num
    ;
num:
    FLOAT
    {
      $$ = $1;
    }
    |
    INTEGER
    {
      $$ = $1;
    }
    ;

%%


int yywrap(void) {
    return 1;
}

int yyerror(s)
char *s;
{
  fprintf(stderr, "%s\n",s);
}

int main (int argc, char *argv[]){
    return (yyparse());
}
