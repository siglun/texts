.nr LL 14c
.nr HM 2.5c
.nr FM 2.5c
.nr PL 29.7c
.nr PO 3.5c
.nr PS 13
.nr VS 15.6
.nr FI 0.5c
.nr FL 13.5c
.hpf ../tmac/hyphen.se
.ds marker \s+2\(sq\s-2
.mso ../tmac/tmac.rcs
.ds RCSID $Id$
.R1
abbreviate "A"
reverse "A"
move-punctuation
accumulate
bracket-label " [" "]" ","
database ../biblo/bibliography_long
.R2
.EQ
delim $$
.EN
.TL
Teknisk specifikation och tidsplanering
f�r Svenska Milj�n�tet
.rcs
.NH 1
Om NWI, Desire och Nordiska metadataprojektet
.LP
Nordiskt Webindex �r ett �ppet samarbetsprojekt mellan n�gra
nordiska forskningsbibliotek och andra intresserade organisationer.
Syftet �r att bygga en allm�n s�ktj�nst,
som skall bygga p� samma \(rqpublic service\(rq\-id�
som de allm�nna biblioteken.
Nordiskt Webindex indexerar endast den nordiska delen av Worldwide Web,
st�r fri fr�n kommersiella intressen och skall ocks�
kunna utnyttja det bibliografiska arbete som vi f�rs�ker
f�rm� f�rfattare och webmasters att utr�tta enligt
standardiserade metoder inom det Nordiska Metadata-projektet.\**
.FS
http://linnea.helsinki.fi/meta/index.html
.FE
.PP
NWI har varit fruktbart av flera olika anledningar:
F�rst och fr�mst kan vi idag erbjuda databaser
som t�cker WWW i fyra av de Nordiska l�nderna.
NWI har i skrivande stund tre servicepunkter.\**
.FS
http://nwi.dtv.dk/, http://nwi.funet.fi/ och
http://nwi.ub2.lu.se/
.FE
Vi har under projektets g�ng kunnat bygga upp en betydande kompetens inom
omr�det,
och p� grund av sin \(rqpublic service\(rq\-inrikting kan NWI
samarbeta med andra initiativ utan hemlighetsmakeri.
Hela maskineriet som NWI bygger p� utnyttjar standardiserade
kommunikationsprotokoll och fri programvara.
Under det kommande �ret kommer vi att p�b�rja NWIprojektets andra fas.
Nordinfo har anslagit medel f�r detta �ndam�l,
och projektets inrikting framg�r av ans�kan.\**
.FS
http://www.ub2.lu.se/~siglun/APPLICATIOMS/nwi_II_proposal.shtml
.FE
.PP
NetLab f�rs�ker fungerar som koordinat�r i NWI,
och arbetar �ven med liknande projekt p� Europeisk niv�,
inom Desire\-projektet\**
.FS
http://www.nic.surfnet.nl/surfnet/projects/desire/
.FE
och Terena\**
.FS
http://www.terena.nl/task-forces/tf-chic/
.FE
.NH 1
Applicerbar teknologi
.LP
Det mesta av den teknologi som beh�vs f�r att driva Svenska Milj�n�tet
i hamn har vi redan tillg�nglig,
och medel f�r dess utveckling beh�vs med andra ord inte.
I det f�ljande kommer vi att g� genom Milj�n�tets kravspecifikation
punkt f�r punkt,
f�r att klarg�ra var NWIpaketet beh�ver expanderas f�r att uppfylla
kraven och vilken arbetstid som beh�ver avs�ttas f�r detta.
.NH 2
Metadataproduktion enligt milj�datan�tets specifikation
.LP
Netlab kan hj�lpa till �tminstone med tv� m�jliga l�sningar:
.IP \*[marker]
Den enklaste �r en anpassning av Nordiska Metadataprojektets
CGI-baserade skript\**
.FS
http://www.ub2.lu.se/~traugott/DC_creator.html
.FE
som skapar en DC (Dublin Core) post f�r inb�ddning
i ett HTML dokuments huvud, vilket i sin tur kan ske p� tv� olika s�tt:
Det enklaste �r att dokumentf�rfattaren anv�nder
\(rqklipp och klistra\(rq\-metoden
mellan sin WWW-klient och sin ordbehandlare.
Ett renare och snyggare s�tt att �stadkomma samma sak �r
att inkludera metadata i HTML-format med hj�lp av
SSI (\(rqServer Side Include\(rq).
Vi t�nker oss att skriptet f�rses med en liten robot som h�mtar
dokumentet i fr�ga,
l�ser befintliga eventuella metadata och l�gger in dem i formul�ret
s� att revisioner av posten skall kunna g�ras enkelt.
.IP \*[marker]
En variant av skriptet beskrivet ovan anv�nds f�r att skapa externa
metadataposter enligt ett �verenskommet standardiserat format,
i SGML enligt ett liggande f�rslag till en standard eller i ett allm�nt
spritt format som kallas SOIF.
V�r robot kan h�mta s�dana poster om den f�r anvisningar om
posternas URLer i de HTMLdokument som ber�rs.
.LP
Detta anbud g�ller den f�rsta av de tv� l�sningarna ovan.
Om intresse f�religger kan NetLab p� beg�ran som ett till�gg
offerera l�sning tv� och dessutom ett l�nkskafferi.
S�dan programvara kan anv�ndas av enskilda medlemmar i Milj�n�tet,
som sj�lva vill dra nytta av sina poster f�r lokal s�kning.
Vi kan �ven hj�lpa till med programvara som �stadkommer
HTMLinb�ddning av externa databasposter genom SSI eller andra metoder,
med den sj�lvklara begr�nsningen att vi inte har intuitiv kunskap om alla
uppt�nkliga databas- och operativsystem som kan t�nkas komma till anv�ndning
f�r �ndam�let.
.NH 2
Robotbaserad insamling av metadata och annan indexingsinformation
.LP
NWIs robot fungerar v�l under SUN OS, Solaris och Linux.
NWI-roboten h�mtar hem dokument med hj�lp av HTTP 1.1,
och producerar efter ett par genoml�sningar av ett dokument en post i
databas som passar f�r anv�nding tillsammans
med en ANSI/NISO Z39.50 server.
.PP
Roboten distribueras gratis.
NWIs s�ktj�nst anv�nder idag GILS version 1.0,
men kommer under det av Nordinfo finansierade NWI II\-projektet
att uppgraderas till GILS version 2.0.
St�d f�r andra profiler �n GILS skulle kr�va relativt stora ingrepp,
och detta anbud g�ller produktion av en databas av denna typ.
Under den aktuella perioden kommer roboten att modifieras s�
att den indexerar Dublin Core\-metadata.
NetLabs l�sning inneb�r s�lunda att DC-metadata kommer att
omvandlas till GILSformat av roboten enligt en
s�rskild \(rqomvandlingstabell\(rq .
Principen f�r omvandlingen �r att
DC\-attributen omvandlas till US MARC\-attribut\**,
.FS
http://lcweb.loc.gov/marc/dccross.html
.FE
vilka i sin tur direkt kan omvandlas till GILS (vars attribut
definieras �r i MARC\**).
.FS
http://www.usgs.gov/gils/prof_v2.html#annex_b
.FE
.NH 2
Katalogserver f�r Milj�n�tet
.LP
NWI har ingen och hade inte planerat n�gon katalogserver,
�ven om saken har varit uppe till diskussion.
Vi har emellertid producerat programvara som g�r detta f�r
andra tj�nster, EELS och L�nkskafferiet\**,
.FS
http://www.ub2.lu.se/eel/ respektive
http://www.ub2.lu.se/skolverket/
.FE
d�r databaserna presenteras som hierarkiska bl�ddningsstrukturer
som genereras utifr�n Engineering Index'
respektive Sveriges Allm�nna Biblioteksf�renings
klassifikationssystem (SAB).
.KS
.PS 5.0c 5.0c
copy "tree.pic"
.PE
.QP
.ps 10
.vs 12
Fig 1.
Skiss till hur ett bl�ddringstr�d kan skapas utifr�n en klassificeringar
h�mtade ur en databas.
Efter en f�rsta genoml�sning av samtliga poster skapar programvaran
ett prelimin�rt tr�d.
Efter en andra genomg�ng f�rfinas, eller ansas, bl�ddringsstrukturen
genom att poster som placerats ute p� kvistar sl�s samman med n�rmast
h�gre liggande kategori.
.sp
.KE
.PP
Vi f�resl�r att Milj�n�tets medlemmar uppmuntras till att g�ra en
relativt finmaskig klassificering,
och att programvaran skrivs s� att den arbetar i tv� faser (se Fig 1).
Under en f�rsta genomg�ng skapas en tr�dstruktur som inneh�ller alla
poster och placerar dem p� de platser som motsvarar deras ursprungliga
klassning.
I en andra fas ansas tr�det s� att varje sida presenterar,
s� l�ngt klassifikationssystemet s� till�ter,
ett anv�ndarsynpunkt optimalt antal poster.
.PP
En toppsida skapas f�r att h�lla samtliga huvudkategorier,
under denna kan sidor inneh�lla b�de l�nkar till resurser i Milj�n�tet
och till bl�ddringssidor djupare ner i hierarkin.
.NH 2
S�kmaskin och databasens WWW-gr�nssnitt
.LP
Nordiskt Webindex anv�nder i dag Z39.50\**
.FS
http://lcweb.loc.gov/z3950/agency/
.FE
som s�kprotokoll.
NWI anv�nder profilen GILS\**
.FS
http://www.usgs.gov/gils/intro.html
.FE
version 1.0, men kommer under 1997 att uppgradera till version 2.0
S�kprogramvaran �r Zebraserver.\**
.FS
http://www.indexdata.dk/zebra.html
.FE
WWW-gr�nssnittet Europagate\**
.FS
http://europagate.dtv.dk/
.FE
g�r det m�jligt f�r en anv�ndare att s�ka i ett flertal
databaser parallellt.
D�rf�r skulle det i princip vara m�jligt f�r
Svenska Milj�n�tets anv�ndare att samtidigt s�ka i s�v�l den
Milj�n�tets databas och i andra liknande databaser,
vilka f�ljer samma standard,
t ex G7-databaserna.\**
.FS
http://enrm.ceo.org/free/info.html
.FE
.PP
Zebrarserver och Europagate klarar som de �r konfigurerade
i NWI av de boolska operationerna \fI\(rqoch\(rq\fP,
\fI\(rqeller\(rq\fP och \fI\(rqmen inte\(rq\fP.
D�rut�ver klarar kombinationen av trunkering med hj�lp
av tecknet \(rq#\(rq.
Det �r enkelt att st�lla in gr�nssnittet f�r f�lts�kning.
.so tidsplan.m4
.NH 1
Tidsplan och grundval f�r kostnadsber�kning
.LP
Vi k�nner oss ganska s�kra p� att klara f�ljande tidsplan.
De olika arbetsmomenten definieras i Tab 1\-2,
och deras l�ge i tiden visas i Fig 2\-3.
.KS
.PLAN 5.0 4.0
970401	970411	2 veckor	Paket 1
970401	970430	2 veckor	Paket 2
970501	970531	4 veckor 	Paket 3
970601	970630	2 veckor 	Paket 4
970615	970630	1 vecka 	Paket 5
970801	970815	1 vecka 	Paket 6
970801	970831	4 veckor 	Paket 7
.EPLAN
.LP
.ps 10
.vs 12
Fig 2.
Tidsplanering f�r
arbetet med Milj�n�tets s�kmaskin och katalogserver
i olika arbetsmoment (se Tab 1), med ber�knad tids�tg�ng f�r
version 1 av tj�nsten.
.KE
.KS
.PLAN 5.0 1.71
970901	971115	4 veckor 	Paket 8
970915	971115	2 veckor 	Paket 9
971115	971231	3 veckor 	Paket 10
.EPLAN
.LP
.ps 10
.vs 12
Fig 3.
Som Fig 2,
men t�ckandet arbetetsmomenten inf�r version 2
av tj�nsten
.KE
