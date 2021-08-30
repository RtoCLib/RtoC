%{
#include <stdio.h>
#include "y.tab.h"
    /* Elementos léxicos en R */
%}
/* Agrupar operaciones binarias en un sólo token, así como las uniarias y operaciones lógicas*/
TKSUBINDIZQ  \[
TKSUBINDDER  \]
TKPARENTIZQ \(
TKPARENTDER \)
ASIGNIZQ  "<-"
ASIGNDER  "->"
ASIGN "="
PARENTASIGNIZQ  "<<-"
PARENTASIGNDER  "->>"
TKRANGO  :
TKCOMA  ,
/*BINOP*/
OPSUM  "+"
OPSUBS  -
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
LOGNOT  "!"
LOGANDEW  "&"
LOGAND  "&&"
LOGOREW  "|"
LOGOR  "||"
LOGNEG "!"
/*Hasta aquí*/
/*UNARYOP*/

TKCOMMENT  "#".*?
STRING  \".*\"
DIGIT [0-9]
CHARACTER [a-zA-Z]
FLOAT {DIGIT}*\.{DIGIT}+
INTEGER  [0-9]+|[0-9]+["L"]
OPERATIONCOMP "%".+"%"
/*Cosas nueva*/
/*ver esto:*/
TKVALOR [{INTEGER}|{STRING}|{FLOAT}] 
TKARRAY "c{TKPARENTIZQ}"
TKCAT "cat"{TKPARENTIZQ}

/*agregar nombres reservados desde:  https://www.statmethods.net/management/functions.html*/
TKLIBRERIA "library"
TKFUNCTION "function"
%%
{TKSUBINDIZQ} {printf(" TKSUBINDIZQ");}
               /*return TKSUBINDIZQ;*/
{TKSUBINDDER} {printf(" TKSUBINDDER");}
{TKPARENTIZQ} {printf(" TKPARENTIZQ");
                return PARIZQ;}
{TKPARENTDER} {printf(" TKPARENTDER");
                return PARDER;}
               /*return TKSUBINDDER;*/
{ASIGNIZQ} {printf(" ASIGNIZQ");}
               /*return ASIGNIZQ;*/
{PARENTASIGNIZQ} {printf(" PARENTASIGNIZQ");}
               /*return PARENTASIGNIZQ;*/
{ASIGNDER} {printf(" ASIGNDER");}
               /*return ASIGNDER;*/
{PARENTASIGNDER} {printf(" PARENTASIGNDER");}
               /*return PARENTASIGNDER;*/
{TKRANGO} {printf(" TKRANGO");}
               /*return TKRANGO;*/
{TKCOMA} {printf(" TKCOMA");}
               /*return TKCOMA;*/
{OPSUM} {printf(" OPSUM");
               return S;}
{OPSUBS} {printf(" OPSUBS");
               return R;}
{OPMULT} {printf(" OPMULT");
               return P;}
{OPDIV} {printf(" OPDIV");
               return D;}
{OPEXP} {printf(" OPEXP");}
               /*return OPEXP;*/
{OPMOD} {printf(" OPMOD");
               return M;}
{OPINTDIV} {printf(" OPINTDIV");}
               /*return DP;*/
{LOGLESS} {printf(" LOGLESS");}
               /*return LOGLESS;*/
{LOGGREAT} {printf(" LOGGREAT");}
               /*return LOGGREAT;*/
{LOGLEQ} {printf(" LOGLEQ");}
               /*return LOGLEQ;*/
{LOGGEQ} {printf(" LOGGEQ");}
               /*return LOGGEQ;*/
{LOGEQ} {printf(" LOGEQ");}
               /*return LOGEQ;*/
{LOGNOTEQ} {printf(" LOGNOTEQ");}
               /*return LOGNOTEQ;*/
{LOGNOT} {printf(" LOGNOT");}
               /*return LOGNOT;*/
{LOGANDEW} {printf(" LOGANDEW");}
               /*return LOGANDEW;*/
{LOGAND} {printf(" LOGAND");}
               /*return LOGAND;*/
{LOGOREW} {printf(" LOGOREW");}
               /*return LOGOREW;*/
{LOGOR} {printf(" LOGOR");}
               /*return LOGOR;*/
{TKCOMMENT} {printf(" TKCOMMENT");} /*ahora si toma todo el comentario*/
               /*return COMMENT;*/
{STRING} {printf(" STRING");} /*ahora si toma los string*/
               /*return STRING;*/
{INTEGER} {printf(" INTEGER");} /*modificado*/
               /*return INTEGER;*/
{FLOAT} {printf(" FLOAT");} /*ahora si toma los string*/
               /*return FLOAT;*/
{TKVALOR} {printf(" VALOR");}
{TKARRAY} {printf ("ARRAY"); /*preguntar formato: Array( elementos ) or only array*/
        /*return ARRAY;*/}
{TKCAT} {printf (" CAT");} /*preguntar formato: Array( elementos ) or only array*/
        /*return ARRAY;*/

{TKLIBRERIA} {printf(" LIBRERIA");}
{TKFUNCTION} {printf(" FUNCTION");}
{CHARACTER}+[{DIGIT}|{CHARACTER}]* {printf(" VARIABLE");}
%%

int yywrap(void) {
    return 1;
}

int main (int argc, char *argv[]){
    yylex();
    return 0;
}
