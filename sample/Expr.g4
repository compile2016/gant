grammar Expr;
prog:	(expr NEWLINE)*;
expr:	expr ('*'|'/') expr | expr ('+'|'-') expr | INT | '(' expr ')' ;
NEWLINE	:	[\t\r\n]+ ;
INT		:	[0-9]+ ;
