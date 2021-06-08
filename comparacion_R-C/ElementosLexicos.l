%{
    /* Elementos léxicos en R */
%}

TKSUBINDIZQ  “\[“
TKSUBINDDER  “\]“
ASIGNIZQ  [“<-”"="]
PARENTASIGNIZQ  "<<-"
ASIGNDER  ["->"]
PARENTASIGNDER  "->>"
TKRANGO  “:”
TKCOMA  “,”
OPSUM  "+"
OPSUBS  "-"
OPMULT  "*"
OPDIV  "/"
OPEXP  "^"
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
STRING  \"[^\"]*\"|\'[^\']*\'
INTEGER  [0-9]+|[0-9]+["L"]
DIGIT [0-9]
OPERATIONCOMP  ["%"][^0-9^a-z^A-Z]["%"]


%%
{TKSUBINDIZQ} {printf("%s TKSUBINDIZQ", yytext);
               //return TKSUBINDIZQ;}
{TKSUBINDDER} {printf("%s TKSUBINDDER", yytext);
               //return TKSUBINDDER;}
{ASIGNIZQ} {printf("%s ASIGNIZQ", yytext);
               //return ASIGNIZQ;}
{PARENTASIGNIZQ} {printf("%s PARENTASIGNIZQ", yytext);
               //return PARENTASIGNIZQ;}
{ASIGNDER} {printf("%s ASIGNDER", yytext);
               //return ASIGNDER;}
{PARENTASIGNDER} {printf("%s PARENTASIGNDER", yytext);
               //return PARENTASIGNDER;}
{TKRANGO} {printf("%s TKRANGO", yytext);
               //return TKRANGO;}
{TKCOMA} {printf("%s TKCOMA", yytext);
               //return TKCOMA;}
{OPSUM} {printf("%s OPSUM", yytext);
               //return OPSUM;}
{OPSUBS} {printf("%s OPSUBS", yytext);
               //return OPSUBS;}
{OPMULT} {printf("%s OPMULT", yytext);
               //return OPMULT;}
{OPDIV} {printf("%s OPDIV", yytext);
               //return OPDIV;}
{OPEXP} {printf("%s OPEXP", yytext);
               //return OPEXP;}
{OPMOD} {printf("%s OPMOD", yytext);
               //return OPMOD;}
{OPINTDIV} {printf("%s OPINTDIV", yytext);
               //return OPINTDIV;}
{LOGLESS} {printf("%s LOGLESS", yytext);
               //return LOGLESS;}
{LOGGREAT} {printf("%s LOGGREAT", yytext);
               //return LOGGREAT;}
{LOGLEQ} {printf("%s LOGLEQ", yytext);
               //return LOGLEQ;}
{LOGGEQ} {printf("%s LOGGEQ", yytext);
               //return LOGGEQ;}
{LOGEQ} {printf("%s LOGEQ", yytext);
               //return LOGEQ;}
{LOGNOTEQ} {printf("%s LOGNOTEQ", yytext);
               //return LOGNOTEQ;}
{LOGNOT} {printf("%s LOGNOT", yytext);
               //return LOGNOT;}
{LOGANDEW} {printf("%s LOGANDEW", yytext);
               //return LOGANDEW;}
{LOGAND} {printf("%s LOGAND", yytext);
               //return LOGAND;}
{LOGOREW} {printf("%s LOGOREW", yytext);
               //return LOGOREW;}
{LOGOR} {printf("%s LOGOR", yytext);
               //return LOGOR;}
{COMMENT} {printf("%s COMMENT", yytext);
               //return COMMENT;}
{STRING} {printf("%s STRING", yytext);
               //return STRING;}
{INTEGER} {printf("%s INTEGER", yytext);
               //return INTEGER;}
[{DIGIT}+[.]{DIGIT}+]|[{DIGIT}*[.]{DIGIT}+] {printf("%s FLOAT", yytext);
               //return FLOAT;}
{OPERATIONCOMP} {printf("%s OPERATIONCOMP", yytext);
               //return OPERATIONCOMP;}

%%

int yywrap(void) {
    return 1;
}

int main (int argc, char *argv[]){
    yylex();
    retunr 0;
}
