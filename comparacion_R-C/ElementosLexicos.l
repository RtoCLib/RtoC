%{
#include <stdio.h>
    /* Elementos léxicos en R */
%}

TKSUBINDIZQ  \[
TKSUBINDDER  \]
ASIGNIZQ  “<-”=
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
COMMENT  "#"
STRING  [\^]*|[\^]*
INTEGER  [0-9]+|[0-9]+["L"]
DIGIT [0-9]
OPERATIONCOMP  ["%"][^0-9^a-z^A-Z]["%"]


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
{COMMENT} {printf(" COMMENT");}
               /*return COMMENT;*/
{STRING} {printf(" STRING");}
               /*return STRING;*/
{INTEGER} {printf(" INTEGER");}
               /*return INTEGER;*/
[{DIGIT}+[.]{DIGIT}+]|[{DIGIT}*[.]{DIGIT}+] {printf(" FLOAT");}
               /*return FLOAT;*/
{OPERATIONCOMP} {printf("%s OPERATIONCOMP", yytext);}
               /*return OPERATIONCOMP;*/

%%

int yywrap(void) {
    return 1;
}

int main (int argc, char *argv[]){
    yylex();
    return 0;
}
