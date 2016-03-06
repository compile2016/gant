# GANT - Ganerate antlr4 makefile easily

[GANT](https://github.com/3013216027/gant) is a tiny makefile Generate script of ANTlr4 for [JBer](http://zhengdongjian.xyz), only for personal use now. It uses makefile to help you manage your antlr project.

## Requirement
- Java compile and runtime environment. You may use Oracle Java, see [Oracle JavaSE Doc](http://docs.oracle.com/javase/8/docs/technotes/guides/install/install_overview.html)
- Antlr4, see [here](http://www.antlr.org/)
 - You should also make the aliases needed when you configurate antlr4(microsoft windows users can create the .bat file).
- Make, windows user can use mingw32-make(Gnumake, included with dev-cpp) or [Gnumake](http://gnuwin32.sourceforge.net/packages/make.htm).
- Moreover, gant can only deal with SINGLE antlr4 file, the start symbol of the gammar SHOULD be `prog`, and the expressions you want to parse should be input by a file named `Expression.txt`


## Installation
Download the shell script directly into your binary-files directory and add execute permission(**run with root if necessary**)
> $ curl -o /usr/local/bin/gant https://raw.githubusercontent.com/3013216027/gant/master/gant.sh
> $ chmod a+x /usr/local/bin/gant
- Windows git-bash user should do like this(add the alias to your bash profile as I recommand you to do):
> $ curl -o /usr/bin/gant.sh https://raw.githubusercontent.com/3013216027/gant/master/gant.sh
> $ alias gant='/usr/bin/gant.sh'

## Example

> $ vim Expr.g4
```
grammar Expr;
prog:	(expr NEWLINE)*;
expr:	expr ('*'|'/') expr | expr ('+'|'-') expr | INT | '(' expr ')' ;
NEWLINE	:	[\t\r\n]+ ;
INT		:	[0-9]+ ;
```

- Generate the makefile
> $ gant Expr

- Compile
> $ make

- Running
> $ make run

- Clean the temporary files
> $ make clean
