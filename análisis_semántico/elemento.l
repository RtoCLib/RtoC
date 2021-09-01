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
                return TKPARENTIZ;}
{TKPARENTDER} {printf(" TKPARENTDER");
                return TKPARENTDE;}
               /*return TKSUBINDDER;*/
{ASIGNIZQ} {printf(" ASIGNIZQ");
               return ASIGNIZQ;}
{PARENTASIGNIZQ} {printf(" PARENTASIGNIZQ");
               return PARENTASIGNIZQ;}
{ASIGNDER} {printf(" ASIGNDER");
               return ASIGNDER;}
{ASIGN}  {printf(" ASIGN");
               return ASIGN;}
{PARENTASIGNDER} {printf(" PARENTASIGNDER");
                return PARENTASIGNDER;}
{TKRANGO} {printf(" TKRANGO");
               return TKRANGO;}
{TKCOMA} {printf(" TKCOMA");
                return TKCOMA;}
{OPSUM} {printf(" OPSUM");
               return S;}
{OPSUBS} {printf(" OPSUBS");
               return R;}
{OPMULT} {printf(" OPMULT");
               return P;}
{OPDIV} {printf(" OPDIV");
               return D;}
{OPEXP} {printf(" OPEXP");
               return EX;}
{OPMOD} {printf(" OPMOD");
               return M;}
{OPINTDIV} {printf(" OPINTDIV");
               return DI;}

{TKCOMMENT} {printf(" TKCOMMENT"); 
               return TKCOMMENT;}/*ahora si toma todo el comentario*/
{STRING} {printf(" STRING");
               return STRING;}/*ahora si toma los string*/
{INTEGER} {printf(" INTEGER"); 
               return INTEGER;}/*modificado*/
{FLOAT} {printf(" FLOAT");
               return FLOAT;} /*ahora si toma los string*/
{TKVALOR} {printf(" VALOR");
            return TKVALOR;}
{TKARRAY} {printf ("ARRAY");
        return TKARRAY;} /*preguntar formato: Array( elementos ) or only array*/
{TKCAT} {printf (" CAT"); 
        return TKCAT;}/*preguntar formato: Array( elementos ) or only array*/

{TKLIBRERIA} {printf(" LIBRERIA"); return TKLIBRERIA;}
{TKFUNCTION} {printf(" FUNCTION"); return TKFUNCTION;}
{CHARACTER}+[{DIGIT}|{CHARACTER}]* {printf(" VARIABLE"); return VARIABLE;}
%%
/*
int yywrap () {
  
    return 1;
}

int main(){
    yylex();
    return 0;

}*/
/* dan error tenerlos :C
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
{LOGNOT} {printf(" LOGNOT");
               return LOGNOT;}
{LOGANDEW} {printf(" LOGANDEW");
                return LOGANDEW;}
{LOGAND} {printf(" LOGAND");
               return LOGAND;}
{LOGOREW} {printf(" LOGOREW");
               return LOGOREW;}
{LOGOR} {printf(" LOGOR");
               return LOGOR;}*/
