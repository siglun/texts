.SUFFIXES: .pic .ms .ps .m4 .x .text .html
.DEFAULT: .m4.ms .dvi.ps .ms.x .ms.text .ms.dvi .ms.html

VERSION=nwi_II_application_ver_1.0

default: nwi_II.ps $(VERSION).html

PAPER=nwi_II.m4

NAME=functional_specification
MACROS=-M../tmac -mgs
#DEFINES= -DPREPRINT=true
DEFINES=
M4 = gsoelim
SCRIPTS= ../scripts

.m4.ms:
	$(M4) $(DEFINES) $< | grefer  |	$(SCRIPTS)/xref.pl  > $*.ms

.dvi.ps:
	dvips -D 600 $< 

.ms.dvi:
	gpic $< | $(SCRIPTS)/firsta2em.pl | $(SCRIPTS)/skipN.pl | \
	$(SCRIPTS)/firsta2em.pl | \
	groff -dversion=$(VERSION) -et $(MACROS) -Tdvi > $*.dvi

.ms.x:
	gpic $< | $(SCRIPTS)/firsta2em.pl | $(SCRIPTS)/skipN.pl | \
	$(SCRIPTS)/firsta2em.pl | \
	groff -dversion=$(VERSION) -X $(MACROS) -Tps

.ms.text:
	cat $< | $(SCRIPTS)/firsta2em.pl | $(SCRIPTS)/skipN.pl | \
	$(SCRIPTS)/firsta2em.pl | \
	groff -dversion=$(VERSION) -et $(MACROS) -Tlatin1 -P-bdu > $*.text


$(VERSION).html: 	nwi_II.ms
	echo .ds version $(VERSION) > version.m4
	unroff -fhtml -ms document=$(VERSION) nwi_II.ms
	../desire2/extract_biblo.pl nwi_II.ms > biblio.html
	mv $(VERSION).html temp
	../desire2/htbiblo.pl < temp > $(VERSION).html

clean:
	rm -f *.text *.ms *~ *.ps *shar* *.dvi *.html \
	touch index.html

../biblo/bibliography_long.i:
	(cd ../biblo; gmake bibliography_long.i)
ci: 
	ci $(PAPER)

../biblo/bibliography_long.i: ../biblo/bib.chaos ../biblo/bib.epidemiology \
	../biblo/bib.general ../biblo/bib.life-history \
	../biblo/bib.manuscripts ../biblo/bib.migration \
	../biblo/bib.parent-offspring ../biblo/bib.plasmids \
	../biblo/bib.pollen ../biblo/bib.publications ../biblo/bib.tramsgen \
	../biblo/bib.search-engine

nwi_II.ps:	nwi_II.dvi
nwi_II.dvi:	nwi_II.ms
nwi_II.ms:	nwi_II.m4





