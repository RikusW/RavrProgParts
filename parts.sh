#!/bin/bash
#supply/xml/parts/path/*

for f in $@; do
	echo "$f"
xsltproc parts.xsl $f | sed -e 's/0x/$/g' -e "/uc[RWEF]/s/[$,]//g" -e "/ControlStack/s/[ $]//g" -e "s/=,/=/" > ${f%xml}rcf
done
