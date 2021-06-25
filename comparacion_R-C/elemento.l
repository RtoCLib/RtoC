%{
#include <stdio.h>
    /* Elementos léxicos en R */
%}

TKSUBINDIZQ  \[
TKSUBINDDER  \]
ASIGNIZQ  "<-"
ASIGN "="
PARENTASIGNIZQ  "<<-"
ASIGNDER  "->"
PARENTASIGNDER  "->>"
TKRANGO  :
TKCOMA  ,
OPSUM  "+"
OPSUBS  -
OPMULT  \*
OPDIV  \/
OPEXP  \^
OPMOD  "%%"
OPINTDIV  "%/%"
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
COMMENT  "#".*?
STRING  \".*\"
DIGIT [0-9]
CHARACTER [a-zA-Z]
ULTRACHARACTER [a-zA-Z0-9]
FLOAT {DIGIT}*\.{DIGIT}+
FIRSTCHARACTER {CHARACTER}+{ULTRACHARACTER}*
BLANK \b
INTEGER  [0-9]+|[0-9]+["L"]
/*OPERATIONCOMP  ["%"][^0-9^a-z^A-Z]["%"]*/
OPERATIONCOMP "%".+"%"
/*Cosas nueva*/
/*ver esto:*/
VALOR [{INTEGER}|{STRING}|{FLOAT}] 
ARRAY "c( {VALOR}+ )"
VAR {FIRSTCHARACTER}{BLANK}*{ASIGNIZQ}

LIBRERIA "library("{CHARACTER}+")"
%%
{TKSUBINDIZQ} {printf(" TKSUBINDIZQ");}
               /*return TKSUBINDIZQ;*/
{TKSUBINDDER} {printf(" TKSUBINDDER");}
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
{OPSUM} {printf(" OPSUM");}
               /*return OPSUM;*/
{OPSUBS} {printf(" OPSUBS");}
               /*return OPSUBS;*/
{OPMULT} {printf(" OPMULT");}
               /*return OPMULT;*/
{OPDIV} {printf(" OPDIV");}
               /*return OPDIV;*/
{OPEXP} {printf(" OPEXP");}
               /*return OPEXP;*/
{OPMOD} {printf(" OPMOD");}
               /*return OPMOD;*/
{OPINTDIV} {printf(" OPINTDIV");}
               /*return OPINTDIV;*/
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
{COMMENT} {printf(" COMMENT");} /*ahora si toma todo el comentario*/
               /*return COMMENT;*/
{STRING} {printf(" STRING");} /*ahora si toma los string*/
               /*return STRING;*/
{INTEGER} {printf(" INTEGER");} /*modificado*/
               /*return INTEGER;*/
{FLOAT} {printf(" FLOAT");} /*ahora si toma los string*/
               /*return FLOAT;*/
{OPERATIONCOMP} {printf("OPERATIONCOMP");} /*Modificado*/
               /*return OPERATIONCOMP;*/
{ARRAY} {printf ("ARRAY");} /*preguntar formato: Array( elementos ) or only array*/
        /*return ARRAY;*/
{ASIGN} {printf("ASIGNACION");}

{VAR} {printf("VAR");}
{LIBRERIA} {printf("LIBRERIA");}
%%

int yywrap(void) {
    return 1;
}

int main (int argc, char *argv[]){
    yylex();
    return 0;
}