#!/bin/bash
#################################################
#  File Name: gant.sh
#  
#  Author: zhengdongjian@tju.edu.cn
#  
#  Created Time: Sun Mar  6 15:16:56 2016
#  
#################################################

####################################################################################
#The MIT License (MIT)
#
#Copyright (c) 2015 zhengdongjian
#
#Permission is hereby granted, free of charge, to any person obtaining a copy
#of this software and associated documentation files (the "Software"), to deal
#in the Software without restriction, including without limitation the rights
#to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
#copies of the Software, and to permit persons to whom the Software is
#furnished to do so, subject to the following conditions:
#
#The above copyright notice and this permission notice shall be included in all
#copies or substantial portions of the Software.
#
#THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
#IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
#FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
#AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
#LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
#OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
#SOFTWARE.
####################################################################################

###############
#show help doc
###############
help() {
		if [ $# -ne 0 ]; then
				cat 1>&2 << EOF
GANT v2.0 - makefile generator for antlr4 (2016 Mar 22)
EOF
		else
				cat 1>&2 << EOF
GANT v2.0 - makefile generator for antlr4 (2016 Mar 22)

usage: gant [arguments] [file name]       generate makefile for the specific file

Arguments:
    -g  or  --gui             Generate with -gui running option (Default)

    -t  or  --tree            Generate with -tree running option

    -o  or  --tokens          Generate with -tokens running option

    -s  or  --start-symbol    Appoint start symbol(Default prog)

    -h  or  --help            Print Help (this message) and exit

    -v  or  --version         Print version information and exit


    * If more than 1 of {-g, -t, -o} options are given, the later one(s) would be ignored.

    * The default start symbol is "prog", the default input file is Expression.txt

EOF
		fi
}

###################
#file name checker
###################
check() {
		# TODO: wait for rm.
		if [ $# -ne 1 ]; then
				echo "Error: Too many file names appoint!"
				help
				return 1
		fi

		for file in $@; do
				if [ ! -f ${file}.g4 ]; then
						echo "Error: cound not find file ${file}.g4!"
						return 2
				fi
		done
		return 0
}

##################
# check arguments
##################
if [ $# -lt 1 ]; then
		echo -e "Usage: $0 <your file name(without appending format type)>\n"
		help
		exit 1
fi

##############################
# options and file name table
##############################
opt_g="false"
opt_t="false"
opt_o="false"
opt_s="false"
opt_h="false"
opt_v="false"
files=""
start_symbol="prog"

while [ $# -gt 0 ]; do
		#echo "check "$1
		arg=$1
		if [ ${arg:0:2} == "--" ]; then
				#echo "get "$arg
				case $arg in
						\-\-gui) opt_g="true";;
						\-\-tree) opt_t="true";;
						\-\-tokens) opt_o="true";;
						\-\-start\-symbol) opt_s="true";;
						\-\-help) opt_h="true";;
						\-\-version) opt_v="true";;
						*) files=$files" "$arg;;
				esac
		elif [ ${arg:0:1} == "-" ]; then
				#echo "get "$arg
				case $arg in
						\-g) opt_g="true";;
						\-t) opt_t="true";;
						\-o) opt_o="true";;
						\-s) opt_s="true";;
						\-h) opt_h="true";;
						\-v) opt_v="true";;
						*) files=$files" "$arg;;
				esac
		else
				files=$files" "$1
		fi
		if [ $opt_s == "true" ]; then
				opt_s="false"
				shift
				start_symbol=$1
		fi
		shift
		#echo "files = "$files
		#echo "cmd = "$*
done

# Final options
opt_com=
if [ $opt_h == "true" ]; then
		help
		exit 0
elif [ $opt_v == "true" ]; then
		help version
elif [ $opt_g == "true" ]; then
		opt_com="-gui"
elif [ $opt_t == "true" ]; then
		opt_com="-tree"
elif [ $opt_o == "true" ]; then
		opt_com="-tokens"
else
		opt_com="-gui"
fi

check $files
##############################
# TODO: match multiple files 
##############################

if [ $? -ne 0 ]; then
		exit 1
fi

cat > makefile << EOF
default: compile

compile: ${files}.g4
	antlr4 ${files}.g4
	javac $files*.java

run: ${files}Lexer.class Expression.txt
	grun $files $start_symbol $opt_com Expression.txt

clean:
	rm -rf *.java
	rm -rf *.tokens

rm: clean
	rm -rf *.class
EOF
