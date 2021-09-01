%{
#include<stdio.h>
%}
%start Estart
%left VARIABLE TKSUBINDIZQ TKSUBINDDER TKPARENTIZ TKPARENTDE ASIGNIZQ ASIGNDER ASIGN PARENTASIGNIZQ PARENTASIGNDER TKRANGO TKCOMA 
%left OPSUM OPSUBS OPMULT OPDIV OPEXP OPMOD OPINTDIV
%left TKCOMMENT STRING DIGIT CHARACTER FLOAT INTEGER OPERATIONCOMP 
%left TKVALOR TKARRAY TKCAT TKFUNCTION TKLIBRERIA
%left R S P D DI M EX 

%%
Estart:     stat
            {
              yyerrok;
            }
            ;
stat:       VARIABLE Asignacion result
            ;

Asignacion: ASIGN
            |
            ASIGNIZQ
            ;
  

          
result:     INTEGER op INTEGER
            |
            R INTEGER
            |
            INTEGER
            |
            FLOAT op FLOAT
            |
            R FLOAT
            |
            FLOAT
            ;

op:         R
            |
            S
            |
            P
            |
            D
            |
            DI
            |
            M
            |
            EX
            |
            ;
%%


int yywrap(void) {
    return 1;
}

int yyerror(s)
char *s;
{
  fprintf(stderr, "%s\n",s);
}

int main (int argc, char *argv[]){
    return (yyparse());
}
