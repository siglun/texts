#!/bin/sh

../XMLforLibrarians/scripts/tei2roff.pl oai-opac.xml > paper.ms

groff -T ps -U -stp \
    -M ~/documents/tmac -mgs lub-settings.ms paper.ms > paper.ps

ps2pdf paper.ps

mv paper.ps  oai-opac.ps
mv paper.pdf  oai-opac.pdf

