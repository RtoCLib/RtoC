%{
#include<stdio.h>
#include<math.h>
#define true 0
#define false 1

int IsInt = true;

%}

%start ARITLOG

//%union { char a; }

%left PARIZQ PARDER
%left OPEXP P D DP M
%left S R 
%left LOGNEG
%left LOGAND LOGANDEW
%left LOGOR LOGOREW
%left LOGLESS LOGGREAT LOGLEQ LOGGEQ LOGEQ LOGNOTEQ
%left FLOAT INTEGER TRUE FALSE


%% 
E   : Sum 
    {
        if (IsInt == true){
            printf("%d \n", $1);
           }else{
            printf("%f \n", $1);
           }
        printf("Es valido!\n");
    } 
    ;
Sum   :  Sp Rest  
    | Rest
    ;
Sp  : Sum S Sp  
    {
      $$ = $1 + $3;
    }
    | Rest
    ;
Rest   : Rp Prod   
    | Prod
    ;
Rp  : Rest R Rp 
    {
      $$ = $1 - $3;
    }
    | Prod
    ;
Prod   : Pp Div 
    | Div
    ;
Pp  : Prod P Pp 
    {
      $$ = $1 * $3;
    }
    | Div
    ;
Div   : Dp DivP 
    | DivP
    ;
Dp  : Div D Dp 
    {
      $$ = $1 / $3;
    }
    | DivP
    ;
DivP  : DPp Mod 
    | Mod
    ;
DPp : DP M DPp 
    {
      $$ = ($1 - ($1 % $3) ) / $3  ;
    } 
    | Mod
    ;
Mod   : Mp Expo 
    | Expo
    ;
Mp  : Mod M Mp 
    {
      $$ = $1 % $3;
    } 
    | Expo
    ;
Expo   : Ex T 
    | T
    ;
Ex  : Expo OPEXP Ex
    {
      $$ = pow($1, $3);
    }
    | T
    ;
T   : FLOAT
    {
      IsInt = false;
    }
    | INTEGER
    {
      IsInt = true;
    }
    | PARIZQ E PARDER
    ;
    
    
    
LOG   : EQU 
    {
        if ($1 == true){
            printf("TRUE \n");
           }else{
            printf("FALSE \n");
           }
        printf("Es valido!\n");
    }
    ;
EQU   :  EQ NEQU  
    | NEQU
    ;
EQ  : EQU LOGEQ EQ  
    {
      if ($1 == $3){
        $$ = true;
      }else{
        $$ = false;
      }
    }
    | NEQU
    ;
NEQU   : NEQ LESS   
    | LESS
    ;
NEQ  : NEQU LOGNOTEQ NEQ 
    {
      if ($1 != $3){
        $$ = true;
      }else{
        $$ = false;
      }
    }
    | LESS
    ;
LESS   : LLS GREAT 
    | GREAT
    ;
LLS  : LESS LOGLESS LLS 
    {
      if ($1 < $3){
        $$ = true;
      }else{
        $$ = false;
      }
    }
    | GREAT
    ;
GREAT   : LGT DivP 
    | DivP
    ;
LGT  : GREAT LOGGREAT LGT
    {
      if ($1 > $3){
        $$ = true;
      }else{
        $$ = false;
      }
    }
    | DivP
    ;
LESSEQ  : LEQ GREATEQ 
    | GREATEQ
    ;
LEQ : LESSEQ LOGLEQ LEQ
    {
      if ($1 <= $3){
        $$ = true;
      }else{
        $$ = false;
      }
    } 
    | GREATEQ
    ;
GREATEQ   : GEQ ANDEW 
    | ANDEW
    ;
GEQ  : GREATEQ LOGGEQ GEQ 
    {
      if ($1 >= $3){
        $$ = true;
      }else{
        $$ = false;
      }
    } 
    | ANDEW
    ;
ANDEW   : YEW OREW 
    | OREW
    ;
YEW  : ANDEW LOGANDEW YEW 
    {
      $$ = $1 & $3
    } 
    | OREW
    ;
OREW   : OEW AND 
    | AND
    ;
OEW  : OREW LOGOREW OEW 
    {
      $$ = $1 | $3
    } 
    | AND
    ;
AND   : Y OR 
    | OR
    ;
Y  : AND LOGAND Y
    {
      if ($1 >= $3){
        $$ = true;
      }else{
        $$ = false;
      }
    }  
    | OR
    ;
OR   : O Expo 
    | Expo
    ;
O  : OR LOGOR O 
    {
      $$ = $1 % $3
    } 
    | Expo
    ;
NEG   : NO
    | TL
    ;
NO  : LOGNEG LOG
    {
      if ($2 == true){
        $$ = false;
      }else{
        $$ = true;
      }
    }  
    | TL
    ;
TL   : TRUE
    | FALSE
    | INTEGER
    | PARIZQ LOG PARDER
    ;
    
ARITLOG : LOG | E ;
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
