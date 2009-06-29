#!/bin/sh
SCRIPTS/tei2roff.pl  laurentius.xml > laurentius.ms
/SERVICES/progs/bin/groff -Tdvi -stp -M ~/documents/tmac -mgs -mec \
    settings.ms \
    laurentius.ms  > \
	laurentius.dvi
dvips laurentius.dvi -o laurentius.ps

groff -T ps -stp -M ~/documents/tmac -mgs \
    settings.ms \
    laurentius.ms  > \
	laurentius2.ps


