#!/bin/sh

if [ digital_humanities.xml -nt digital_humanities.ms ]; then
xsltproc teip5toms.xsl digital_humanities.xml |\
    sed 's/^\ *//' | \
    grep -v '^\ *$' > digital_humanities.ms
fi

groff -U -Tps -kt -Kutf8 -M/home/sigge/documents/tmac \
    -ma4 -P-pa4 -mgs -mpdfmark parameters.ms \
    digital_humanities.ms > digital_humanities.ps 

ps2pdf  digital_humanities.ps 
