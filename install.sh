#!/bin/bash
#################################################
#  File Name: install.sh
#  
#  Author: zhengdongjian@tju.edu.cn
#  
#  Created Time: Thu Mar 24 12:05:00 2016
#  
#################################################

# test permission
tmp_name=`mktemp -up /usr/bin/`
touch $tmp_name
if [ $? -ne 0 ]; then
		echo 'Please check your permission to /usr/bin/ directory, run with sudo if necessary:)'
else
		rm -f $tmp_name
fi

if [ -f /usr/bin/gant.sh ]; then
		mv -v /usr/bin/gant.sh /usr/bin/gant.sh.bak
fi
cp -v ./gant.sh /usr/bin/gant.sh

#alias 'gant' > /dev/null 2>&1
#if [ $? -eq 0 ]; then
#		echo 'Done!'
#		exit 0
#fi

echo -n 'Add alias to your ~/.bashrc profile...'
echo 'alias gant="/usr/bin/gant.sh"' >> ~/.bashrc
if [ $? -ne 0 ]; then
		echo 'Error!'
		exit 1
else
		echo 'Done!'
fi

echo -n 'Reload bashrc profile...'
source ~/.bashrc
if [ $? -ne 0 ]; then
		echo 'Error!'
		exit 1
else
		echo 'Done!'
fi
