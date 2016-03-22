default:  Expr.g4
	antlr4  Expr.g4
	javac  Expr*.java

run:  ExprLexer.class Expression.txt
	grun  Expr cao -gui Expression.txt

clean:
	rm -rf *.java
	rm -rf *.tokens

rm: clean
	rm -rf *.class
