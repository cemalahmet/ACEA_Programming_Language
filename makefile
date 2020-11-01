acea: acea.l acea.y
	lex acea.l
	yacc acea.y
	gcc -o acea y.tab.c
