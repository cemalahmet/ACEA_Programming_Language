acea: CS315f20_team58.lex CS315f20_team58.yacc
	lex CS315f20_team58.lex
	yacc CS315f20_team58.yacc
	gcc -o parser y.tab.c
