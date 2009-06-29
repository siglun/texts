#!/bin/sh
SCRIPTS/tei2roff.pl  laurentius.xml > laurentius.ms
groff -Tdvi -stp -M ~/documents/tmac -mgs -mec \
    settings.ms \
    laurentius.ms  > \
	laurentius.dvi
dvips laurentius.dvi -o laurentius.ps



