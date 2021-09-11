#Compilacion:


 flex elemento.l && yacc -d Yacc.y  && cc lex.yy.c y.tab.c -lm
