# GANT - Ganerate antlr4 makefile easily

[GANT](https://github.com/3013216027/gant) is a tiny makefile Generate script of ANTlr4 for [JBer](http://zhengdongjian.xyz), only for personal use now. It uses makefile to help you manage your antlr project.

## Requirement
- Java compile and runtime environment. You may use Oracle Java, see [Oracle JavaSE Doc](http://docs.oracle.com/javase/8/docs/technotes/guides/install/install_overview.html)
- Antlr4, see [here](http://www.antlr.org/)
 - You should also make the aliases needed when you configurate antlr4(microsoft windows users can create the .bat file).
- Make, windows user can use mingw32-make(Gnumake, included with [dev-cpp](http://orwelldevcpp.blogspot.com/)) or [Gnumake](http://gnuwin32.sourceforge.net/packages/make.htm).
- Moreover, gant can only deal with SINGLE antlr4 file, ~~the start symbol of the gammar SHOULD be `prog`,~~ and the expressions you want to parse should be input by a file named `Expression.txt`


## Installation
- See [Release Page](https://github.com/3013216027/gant/releases) and download the lastest version(`v2.3` now).

- Extract
 - for `.zip` file: `unzip gant-2.3.zip`
 - for `.tar.gz` file: `tar -xf gant-2.3.tar.gz`
 - then change the directory into it: `cd gant-2.3`

- Install

> ./install.sh

## Example

> vim Expr.g4

```
grammar Expr;
prog:	(expr NEWLINE)*;
expr:	expr ('*'|'/') expr | expr ('+'|'-') expr | INT | '(' expr ')' ;
NEWLINE	:	[\t\r\n]+ ;
INT		:	[0-9]+ ;
```

- Generate the makefile
> gant Expr

- Compile
> make

- Running
> make run

- Clean the temporary files
> make clean

- Clean all files generate (only your source files preserved)
> make rm

## API

- Please see `gant -h` or `gant --help` for more help
