#!/bin/bash

for i in */*.tex; do
	[ -f $i ] || break
	cd $( dirname $i)
	NAME=$( basename $i)
	pdflatex $NAME
	pdflatex $NAME
	cd ..
done
