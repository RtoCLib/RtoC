%{
#include<stdio.h>
%}
// info en: https://www.ibm.com/docs/en/aix/7.1?topic=concepts-lex-yacc-program-information
%start E

%union { char a; }

%left P D DP M
%left S R 
%left T id
%left Sp Rp Pp Dp DPp Mp


%% 
E   : S // E   : S
    ;
S   :  Sp R  // S   : S'R | R
    | R
    ;
Sp  : S '+' Sp  // S'    : S + S' | R
    {
      $$ = $1 + $3
    }
    | R
    ;
R   : Rp P    // R   : R'P | P
    | P
    ;
Rp  : R '-' Rp // R'    : R - R' | P
    {
      $$ = $1 - $3
    }
    | P
    ;
P   : Pp D  // P   : P'D | D
    | D
    ;
Pp  : P '*' Pp // P'    : P * P' | D
    {
      $$ = $1 '*' $3
    }
    | D
    ;
D   : Dp DP  // D   : D'DP | DP
    | DP
    ;
Dp  : D '/' Dp // D'    : D / D' | DP
    {
      $$ = $1 / $3
    }
    | DP
    ;
DP  : DPp M  // DP    : DP'M | M
    | M
    ;
DPp : DP '%' '/' '%' DPp //DP'   : DP %/% DP' | M
    {
      $$ = ($1 - ($1 % $5) ) / $5  
    } 
    | M
    ;
M   : Mp T // M   : M'T | T 
    | T 
    ;
Mp  : M '%' Mp //M'    : M %% M' | T
    {
      $$ = $1 % $3
    } 
    | T
    ;
T   : id //T   : id | (E) 
    | ( E )
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
