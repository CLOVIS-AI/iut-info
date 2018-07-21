#!/bin/bash

for i in */*.tex; do
	[ -f $i ] || break
	DIR=$( dirname $i)
	cd $DIR
	NAME=$( basename $i)
	echo -n ">> compiling $i ["
	pdflatex -shell-escape $NAME >> /dev/null; echo -n "="
	pdflatex -shell-escape $NAME >> /dev/null; echo -n "="
	echo "]"
	cd ..
done
