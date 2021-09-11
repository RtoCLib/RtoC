%{
#include <stdio.h>
#include "y.tab.h"
    /* Elementos léxicos en R */
%}
/* Agrupar operaciones binarias en un sólo token, así como las uniarias y operaciones lógicas*/
TKPARENTIZQ \(
TKPARENTDER \)
/*ASIGNIZQ  "<-"*/
/*ASIGN "="*/
/*BINOP*/
OPSUM  "+"
OPSUBS  "-"
OPMULT  \*
OPDIV  \/
OPEXP  \^
OPMOD  "%%"
OPINTDIV  "%/%"
/*LOGICOP*/
LOGLESS  "<"
LOGGREAT  ">"
LOGLEQ  "<="
LOGGEQ  ">="
LOGEQ  "=="
LOGNOTEQ  "!="
LOGANDEW  "&"
LOGAND  "&&"
LOGOREW  "|"
LOGOR  "||"
LOGNEG "!"
/*Hasta aquí*/
/*UNARYOP*/

/*TKCOMMENT  "#".*? */
/*STRING  \".*\" */
DIGIT [0-9]
/*CHARACTER [a-zA-Z] */
FLOAT {DIGIT}*\.{DIGIT}+
INTEGER  [0-9]+|[0-9]+["L"]
TRUE "TRUE"
FALSE "FALSE"
/*Cosas nueva*/
/*ver esto:*/
/*VARIABLE {CHARACTER}+[{DIGIT}|{CHARACTER}]* */
%%
{TKPARENTIZQ} {printf(" TKPARENTIZQ");
                return PARIZQ;}
{TKPARENTDER} {printf(" TKPARENTDER");
                return PARDER;}
               /*return TKSUBINDDER;*/
{LOGNEG} {printf(" LOGNEG"); return LOGNEG;}
{LOGLESS} {printf(" LOGLESS");
               return LOGLESS;}
{LOGGREAT} {printf(" LOGGREAT");
               return LOGGREAT;}
{LOGLEQ} {printf(" LOGLEQ");
               return LOGLEQ;}
{LOGGEQ} {printf(" LOGGEQ");
               return LOGGEQ;}
{LOGEQ} {printf(" LOGEQ");
               return LOGEQ;}
{LOGNOTEQ} {printf(" LOGNOTEQ");
               return LOGNOTEQ;}
{LOGANDEW} {printf(" LOGANDEW");
                return LOGANDEW;}
{LOGAND} {printf(" LOGAND");
               return LOGAND;}
{LOGOREW} {printf(" LOGOREW");
               return LOGOREW;}
{LOGOR} {printf(" LOGOR");
               return LOGOR;}
 /*{ASIGNIZQ} {printf(" ASIGNIZQ"); return ASIGNIZQ;} */
 /*{ASIGN}  {printf(" ASIGN"); return ASIGN;} */
{OPSUM} {printf(" OPSUM");
               return S;}
{OPSUBS} {printf(" OPSUBS");
               return R;}
{OPMULT} {printf(" OPMULT");
               return P;}
{OPDIV} {printf(" OPDIV");
               return D;}
{OPEXP} {printf(" OPEXP");
               return OPEXP;}
{OPMOD} {printf(" OPMOD");
               return M;}
{OPINTDIV} {printf(" OPINTDIV");
               return DP;}

 /*{TKCOMMENT} {printf(" TKCOMMENT"); return TKCOMMENT;}*/ /*ahora si toma todo el comentario*/
 /* {STRING} {printf(" STRING"); return STRING;}*//*ahora si toma los string*/
{INTEGER} {printf(" INTEGER"); 
               return INTEGER;}/*modificado*/
{FLOAT} {printf(" FLOAT");
               return FLOAT;} 
{TRUE} {printf(" TRUE");
               return TRUE;} 
{FALSE} {printf(" FALSE");
               return FALSE;} 
 /*{VARIABLE} {printf(" VARIABLE"); return VARIABLE;}*/
%%
/*
int yywrap () {
  
    return 1;
}

int main(){
    yylex();
    return 0;

}*/
