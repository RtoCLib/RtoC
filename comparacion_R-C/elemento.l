%{
#include <stdio.h>
    /* Elementos léxicos en R */
%}

TKSUBINDIZQ  \[
TKSUBINDDER  \]
TKPARENTIZQ \(
TKPARENTDER \)
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
FLOAT {DIGIT}*\.{DIGIT}+
INTEGER  [0-9]+|[0-9]+["L"]
OPERATIONCOMP "%".+"%"
/*Cosas nueva*/
/*ver esto:*/
TKVALOR [{INTEGER}|{STRING}|{FLOAT}] 
TKARRAY "c{TKPARENTIZQ}"
TKCAT "cat"{TKPARENTIZQ}
/*VAR {FIRSTCHARACTER}{BLANK}*{ASIGNIZQ}*/

TKLIBRERIA "library"
TKFUNCTION "function"
%%
{TKSUBINDIZQ} {printf(" TKSUBINDIZQ");}
               /*return TKSUBINDIZQ;*/
{TKSUBINDDER} {printf(" TKSUBINDDER");}
{TKPARENTIZQ} {printf(" TKPARENTIZQ");}
{TKPARENTDER} {printf(" TKPARENTDER");}
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
{TKVALOR} {printf(" VALOR");}
{TKARRAY} {printf ("ARRAY");} /*preguntar formato: Array( elementos ) or only array*/
        /*return ARRAY;*/
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
