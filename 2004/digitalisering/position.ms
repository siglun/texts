.nr PO 4.0c
.po 4.0c
.fam BA
.hla se
.hpf hyphen.se
.nr HM 3c
.nr FM 3c
.nr PL 29.7c
.nr PO 4.0c
.nr LL 13.0c
.nr PS 12
.nr VS 14
.ds bula \\s+2\\(sq\\s-2
.de bullet
.IP \\*[bula]
..
.TL
Vad en bra samling av digital text b�r kunna
.AU
Sigfrid Lundberg
Biblioteksdirektionen
Lunds universitet
.SH
Inledande tankar
.LP
Sverige har \(em tyv�rr \(em l�nge varit en efterbliven nation
n�r det g�ller bevarande och tillg�ngligg�rande av sitt skrivna kulturarv i digital form.
Det �r allas v�r f�rhoppning att det kommer till en �ndring av detta till en f�ljd av de utredningar och utv�rderingar som gjorts,
bland annat av Kungl. Bibliotekets verksamhet.
.PP
Innan jag kommer till det titeln p� detta lilla papper antyder att det skall handla om,
skulle jag vilja peka p� ett par triviala punkter:
.bullet
Det �r viktiga skillnader mellan bilder p� (i) text,
(ii) bilder p� f�rem�l och (iii) bilder av bilder.
En bild av en text \fI�r\fR en text,
om �n i ett ol�mpligt format \(em f�r m�nga, men inte alla �ndam�l.
.bullet
En bild av en text kan inte effektivt �tervinnas om den beskrivs med metadatastandard anpassad f�r bilder p� stolar,
eller f�r bilder av bilder p� stolar.
.bullet
En bok �r dels ett intellektuellt inneh�ll,
dels ett objekt.
Varje bild av en bok �r (i) bild av en unik individ,
forskningen \fIkan\fP vara betj�nt av att f� en uppfattning av och kunna beskriva variationen mellan individerna.
(ii) Varje del av boken har en relation till helheten och till varje annan del;
samlingen av bilder �r surrogat f�r boken och relationerna mellan bilderna har samma relationer till varandra som det de avbildar.
.bullet
Varje l�ngre text �r strukturerad hierarkiskt.
Den �r uppdelad i avsnitt eller kapitel,
varje kapitel i stycken, vilka i sin tur best�r av meningar, huvudsats, bisats, och slutligen ord.
Denna struktur �r till sin natur beroende av det intellektuella inneh�llet.
�r det en tryckt text finns ytterligare en annan hierarki:
Sida, rad, tecken.
.bullet
Digitala texter �r f�r de flesta sv�ra och obekv�ma att l�sa,
�tminstone sv�ra att l�sa p� en datorsk�rm.
.LP
Text har m�nga andra karakt�ristika,
men dessa �r vad jag kommer att t�nka p� i skrivande stund.
.SH
Vad kan vi f�rv�nta oss att anv�ndarna vill ha?
.LP
En applikation b�r kunna det dess anv�ndare vill ha.
Vad de vill ha beror p� hur de kan t�nkas vilja anv�nda en elektronisk text,
till skillnad fr�n hur de anv�nder en tryckt.
Anv�ndningsomr�dena f�r ett textarkiv g�r inte att f�rutse i detalj,
och f�r att f� svar p� fr�gan m�ste man fr�ga.
Vi kan dock utg� ifr�n att de \fIinte\fP kommer att anv�nda de elektroniska texterna i h�ngmattan under semestern.
Vad vi kan t�nka oss f�r n�rvarande �r minst det f�ljande:
.bullet
Anv�ndarna vill ha en s� trevlig digital milj� som bara m�jligt f�r att helt enkelt l�sa texterna.
.bullet
Men det r�cker inte. Det beh�vs utskriftsv�nliga format.
M�jlighet att \(rqshoppa\(rq godtyckliga sidor och fr�n dem skall det g� att f� en snygg utskrift.
.bullet
Kopplingar till print\-on\-demand-tryckeri
.bullet
M�jlighet att \fIs�ka\fP efter ord och fraser.
\(rqKeyword in Context\(rq.
Scanlistor �ver namn p� f�reteelser, personer, platser, karakt�rer och dylikt.
Allt detta skall kunna g�ras inom en given bok,
och globalt f�r hela samlingen och s�dana s�kningar skall kunna filtreras med metadata.
.bullet
M�jlighet att \fIl�nka\fP till godtyckliga positioner i en text;
det �r en f�rdel om l�nkad text blir markerad.
.bullet
M�jlighet till \fIutg�ende l�nkning\fP:
Texter med not-apparat b�r kunna f�rpassa noterna till separat f�nster.
Textkritiska noter b�r ha s�rskilt anv�ndargr�nssnitt.
St�d f�r att koppla referenslistor till l�nkserver (SFX/Metalib-liknande tj�nster).
.bullet
Personliga bokm�rken och m�jlighet till personlig annotation av texterna f�r inloggade anv�ndare.
.bullet
Anv�ndarforum f�r diskussion av digitaliserade texter
.bullet
M�jlighet till att publicera artiklar och annat vetenskapligt material relaterat till texterna,
som d� b�r kunna dra nytta av dem och ing� i en hypertextuell symbios med materialet i arkivet.
.LP
D�rut�ver kommer s�kert en massa andra funktioner som jag inte kan komma p�.
.SH
Hur n�r man fram till detta?
.LP
Det �r ett sorgligt faktum att vi f�rmodligen inte kan producera digitaliserad text som blir s� anv�ndbar som man skulle vilja;
den kodning som det skulle kr�va skulle st�lla sig dyrbar och tidskr�vande.
I sj�lva verket f�rest�ller jag mig att en digitaliseringsverksamhet d�r texter �verf�rs till digital form i flera steg. Det inneb�r att dokument i olika stadier kommer att kunna beh�va samexistera �ver relativt l�ng tid.
Jag t�nker mig f�ljande stadier:
.IP 1.
Texter som best�r av en samling bilder, vars inb�rdes relationer �r fastst�llda.
Dessa verk kan �tervinnas vid metadatas�kning, navigering inom systemet eller via Libris/OPAC.
.IP 2.
Texter som best�r av en samling bilder som f�r kategori 1,
d�rtill kommer att texterna i denna kategori har genomg�tt OCR-behandling och finns s�kbara.
L�nkar fr�n ett s�kresultat g�r endast till bilderna.
.IP
Vid OCR-behandlingen sparas information om typografi (t ex kursiv och fet stil,  styck- rad- och sidbrytningar etc).
.IP 3.
Korrekturl�st text.
Med hj�lp av sparad typografisk information �stadkoms halvautomatiskt en grund textmarkering,
vilket g�r att vissa hyperttextfunktioner kan implementeras.
Full s�kbarhet uppn�s f�r ord och fraser.
Likas� �r full ing�ende l�nkning m�jlig.
F�r inloggade anv�ndare: Utg�ende l�nkning till personliga annotationer och diskussionsforum.
D�remot finns inga markeringar f�r andra s�rskilda egenskaper hos texten.
Notapparater existerar bara typografiskt, inte funktionellt.
.IP 4.
Som punkt 3., men nu med djup markering.
Texter i detta stadium �r dessutom m�jliga att f�rse med noter, textkritiska s�v�l som ursprungliga,
och andra utg�ende l�nkar, bibliografiska referenser pekas till andra databaser.
.SH
Hur implementerar man detta?
.LP
Systemen som skall driva allt detta m�ste implementeras stegvis.
Visioner m�ste vara h�gt st�llda,
och inget som implementeras i dag f�r vara s�dant att det utesluter eller f�rsv�rar att man bygger vidare i framtiden.