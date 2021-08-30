%{
#include<stdio.h>
%}
// info en: https://www.ibm.com/docs/en/aix/7.1?topic=concepts-lex-yacc-program-information
%start E

//%union { char a; }

%left PARIZQ PARDER
%left P D DP M
%left S R 
%left id


%% 
E   : S {printf($1 \n);} // E   : S
    ;
Sum   :  Sp Rest  // S   : S'R | R
    | Rest
    ;
Sp  : Sum S Sp  // S'    : S + S' | R
    {
      $$ = $1 + $3
    }
    | R
    ;
Rest   : Rp Prod    // R   : R'P | P
    | P
    ;
Rp  : Rest R Rp // R'    : R - R' | P
    {
      $$ = $1 - $3
    }
    | P
    ;
Prod   : Pp Div  // P   : P'D | D
    | Div
    ;
Pp  : Prod P Pp // P'    : P * P' | D
    {
      $$ = $1 * $3
    }
    | Div
    ;
Div   : Dp DivP  // D   : D'DP | DP
    | DivP
    ;
Dp  : Div D Dp // D'    : D / D' | DP
    {
      $$ = $1 / $3
    }
    | DivP
    ;
DivP  : DPp Mod  // DP    : DP'M | M
    | Mod
    ;
DPp : DP M DPp //DP'   : DP %/% DP' | M
    {
      $$ = ($1 - ($1 % $3) ) / $3  
    } 
    | Mod
    ;
Mod   : Mp T // M   : M'T | T 
    | T 
    ;
Mp  : Mod M Mp //M'    : M %% M' | T
    {
      $$ = $1 % $3
    } 
    | T
    ;
T   : id //T   : id | (E) 
    | PARIZQ E PARDER
    ;

%%
main()
{
 return(yyparse());
}

yyerror(s)
char *s;
{
  fprintf(stderr, "%s\n",s);
}

yywrap()
{
  return(1);
}
