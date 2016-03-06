# GANT - Ganerate antlr4 makefile easily

[GANT](https://github.com/3013216027/gant) is a tiny makefile Generate script of ANTlr4 for [JBer](http://zhengdongjian.xyz), only for personal use now.

## Requirement
- Java compile and runtime environment. You may use Oracle Java, see [Oracle JavaSE Doc](http://docs.oracle.com/javase/8/docs/technotes/guides/install/install_overview.html)
- Antlr4, see [here](http://www.antlr.org/)
 - You should also make the aliases needed when you configurate antlr4(microsoft windows users can create the .bat file).
- Moreover, gant can only deal with SINGLE antlr4 file, the start symbol of the gammar SHOULD be `prog`, and the expressions you want to parse should be input by a file named `Expression.txt`


## Installation
> curl -O 
## Example
> $ vim Expr.g4
```
grammar Expr;
prog:	(expr NEWLINE)*;
expr:	expr ('*'|'/') expr | expr ('+'|'-') expr | INT | '(' expr ')' ;
NEWLINE	:	[\t\r\n]+ ;
INT		:	[0-9]+ ;
```
> $ 
