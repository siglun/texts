#!/bin/sh
#SCRIPTS/tei2roff.pl  laurentius.xml > laurentius.ms
#groff -Tdvi -stp -M ~/documents/tmac -mgs -mec \
#    settings.ms \
#    laurentius.ms  > \
#	laurentius.dvi
#dvips laurentius.dvi -o laurentius.ps

#groff -T ps -stp -M ~/documents/tmac -mgs \
#    settings.ms \
#    laurentius.ms  > \
#	laurentius2.ps


#SCRIPTS/tei2roff.pl  digitaliserings_policy.xml > digitaliserings_policy.ms
groff -sp -M ~/documents/tmac -mgs  \
    settings.ms \
    digitaliserings_policy.ms  > \
	digitaliserings_policy.ps

