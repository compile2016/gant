default:  Expr.g4
	antlr4  Expr.g4
	javac  Expr*.java

run:  ExprLexer.class Expression.txt
	grun  Expr prog -gui Expression.txt

clean:
	rm -rf *.java
	rm -rf *.class
	rm -rf *.tokens
