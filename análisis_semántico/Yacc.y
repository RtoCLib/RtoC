%{
#include<stdio.h>
%}
// info en: https://www.ibm.com/docs/en/aix/7.1?topic=concepts-lex-yacc-program-information
%start E
%union {double type;}
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
        printf("%d\n",$1.type);
      }
      ;

Sim: PARIZQ Sim PARDER
    {
      $$.type = $2.type;
    }
    |
    Sim EX Sim
    {
      float pow = 1;
      for(int i = 0; i < $3; i++)
        pow = $1;
      $$.type = pow;
    }
    |
    Sim P Sim
    {
      $$.type = $1.type * $3.type;
    }
    |
    Sim D Sim
    {
      $$.type = $1.type / $3.type;
    }
    |
    Sim DI Sim
    {
      $$.type = ($1.type - ($1.type % $3.type) ) / $3.type;  
    }
    |
    Sim M Sim 
    {
      $$.type = $1.type % $3.type;
    } 
    |
    Sim sum Sim
    {
      $$.type = $1.type + $3.type;
    }
    |
    Sim R Sim
    {
      $$.type = $1.type - $3.type;
    }
    |   
    R Sim
    {
      $$.type = - $2.type;
    }
    |
    num
    ;
num:
    FLOAT
    {
      $$.type = $1.type;
    }
    |
    INTEGER
    {
      $$.type = $1.type;
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
