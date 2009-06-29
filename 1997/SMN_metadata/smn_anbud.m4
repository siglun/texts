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
för Svenska Miljönätet
.rcs
.NH 1
Om NWI, Desire och Nordiska metadataprojektet
.LP
Nordiskt Webindex är ett öppet samarbetsprojekt mellan några
nordiska forskningsbibliotek och andra intresserade organisationer.
Syftet är att bygga en allmän söktjänst,
som skall bygga på samma \(rqpublic service\(rq\-idé
som de allmänna biblioteken.
Nordiskt Webindex indexerar endast den nordiska delen av Worldwide Web,
står fri från kommersiella intressen och skall också
kunna utnyttja det bibliografiska arbete som vi försöker
förmå författare och webmasters att uträtta enligt
standardiserade metoder inom det Nordiska Metadata-projektet.\**
.FS
http://linnea.helsinki.fi/meta/index.html
.FE
.PP
NWI har varit fruktbart av flera olika anledningar:
Först och främst kan vi idag erbjuda databaser
som täcker WWW i fyra av de Nordiska länderna.
NWI har i skrivande stund tre servicepunkter.\**
.FS
http://nwi.dtv.dk/, http://nwi.funet.fi/ och
http://nwi.ub2.lu.se/
.FE
Vi har under projektets gång kunnat bygga upp en betydande kompetens inom
området,
och på grund av sin \(rqpublic service\(rq\-inrikting kan NWI
samarbeta med andra initiativ utan hemlighetsmakeri.
Hela maskineriet som NWI bygger på utnyttjar standardiserade
kommunikationsprotokoll och fri programvara.
Under det kommande året kommer vi att påbörja NWIprojektets andra fas.
Nordinfo har anslagit medel för detta ändamål,
och projektets inrikting framgår av ansökan.\**
.FS
http://www.ub2.lu.se/~siglun/APPLICATIOMS/nwi_II_proposal.shtml
.FE
.PP
NetLab försöker fungerar som koordinatör i NWI,
och arbetar även med liknande projekt på Europeisk nivå,
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
Det mesta av den teknologi som behövs för att driva Svenska Miljönätet
i hamn har vi redan tillgänglig,
och medel för dess utveckling behövs med andra ord inte.
I det följande kommer vi att gå genom Miljönätets kravspecifikation
punkt för punkt,
för att klargöra var NWIpaketet behöver expanderas för att uppfylla
kraven och vilken arbetstid som behöver avsättas för detta.
.NH 2
Metadataproduktion enligt miljödatanätets specifikation
.LP
Netlab kan hjälpa till åtminstone med två möjliga lösningar:
.IP \*[marker]
Den enklaste är en anpassning av Nordiska Metadataprojektets
CGI-baserade skript\**
.FS
http://www.ub2.lu.se/~traugott/DC_creator.html
.FE
som skapar en DC (Dublin Core) post för inbäddning
i ett HTML dokuments huvud, vilket i sin tur kan ske på två olika sätt:
Det enklaste är att dokumentförfattaren använder
\(rqklipp och klistra\(rq\-metoden
mellan sin WWW-klient och sin ordbehandlare.
Ett renare och snyggare sätt att åstadkomma samma sak är
att inkludera metadata i HTML-format med hjälp av
SSI (\(rqServer Side Include\(rq).
Vi tänker oss att skriptet förses med en liten robot som hämtar
dokumentet i fråga,
läser befintliga eventuella metadata och lägger in dem i formuläret
så att revisioner av posten skall kunna göras enkelt.
.IP \*[marker]
En variant av skriptet beskrivet ovan används för att skapa externa
metadataposter enligt ett överenskommet standardiserat format,
i SGML enligt ett liggande förslag till en standard eller i ett allmänt
spritt format som kallas SOIF.
Vår robot kan hämta sådana poster om den får anvisningar om
posternas URLer i de HTMLdokument som berörs.
.LP
Detta anbud gäller den första av de två lösningarna ovan.
Om intresse föreligger kan NetLab på begäran som ett tillägg
offerera lösning två och dessutom ett länkskafferi.
Sådan programvara kan användas av enskilda medlemmar i Miljönätet,
som själva vill dra nytta av sina poster för lokal sökning.
Vi kan även hjälpa till med programvara som åstadkommer
HTMLinbäddning av externa databasposter genom SSI eller andra metoder,
med den självklara begränsningen att vi inte har intuitiv kunskap om alla
upptänkliga databas- och operativsystem som kan tänkas komma till användning
för ändamålet.
.NH 2
Robotbaserad insamling av metadata och annan indexingsinformation
.LP
NWIs robot fungerar väl under SUN OS, Solaris och Linux.
NWI-roboten hämtar hem dokument med hjälp av HTTP 1.1,
och producerar efter ett par genomläsningar av ett dokument en post i
databas som passar för använding tillsammans
med en ANSI/NISO Z39.50 server.
.PP
Roboten distribueras gratis.
NWIs söktjänst använder idag GILS version 1.0,
men kommer under det av Nordinfo finansierade NWI II\-projektet
att uppgraderas till GILS version 2.0.
Stöd för andra profiler än GILS skulle kräva relativt stora ingrepp,
och detta anbud gäller produktion av en databas av denna typ.
Under den aktuella perioden kommer roboten att modifieras så
att den indexerar Dublin Core\-metadata.
NetLabs lösning innebär sålunda att DC-metadata kommer att
omvandlas till GILSformat av roboten enligt en
särskild \(rqomvandlingstabell\(rq .
Principen för omvandlingen är att
DC\-attributen omvandlas till US MARC\-attribut\**,
.FS
http://lcweb.loc.gov/marc/dccross.html
.FE
vilka i sin tur direkt kan omvandlas till GILS (vars attribut
definieras är i MARC\**).
.FS
http://www.usgs.gov/gils/prof_v2.html#annex_b
.FE
.NH 2
Katalogserver för Miljönätet
.LP
NWI har ingen och hade inte planerat någon katalogserver,
även om saken har varit uppe till diskussion.
Vi har emellertid producerat programvara som gör detta för
andra tjänster, EELS och Länkskafferiet\**,
.FS
http://www.ub2.lu.se/eel/ respektive
http://www.ub2.lu.se/skolverket/
.FE
där databaserna presenteras som hierarkiska bläddningsstrukturer
som genereras utifrån Engineering Index'
respektive Sveriges Allmänna Biblioteksförenings
klassifikationssystem (SAB).
.KS
.PS 5.0c 5.0c
copy "tree.pic"
.PE
.QP
.ps 10
.vs 12
Fig 1.
Skiss till hur ett bläddringsträd kan skapas utifrån en klassificeringar
hämtade ur en databas.
Efter en första genomläsning av samtliga poster skapar programvaran
ett preliminärt träd.
Efter en andra genomgång förfinas, eller ansas, bläddringsstrukturen
genom att poster som placerats ute på kvistar slås samman med närmast
högre liggande kategori.
.sp
.KE
.PP
Vi föreslår att Miljönätets medlemmar uppmuntras till att göra en
relativt finmaskig klassificering,
och att programvaran skrivs så att den arbetar i två faser (se Fig 1).
Under en första genomgång skapas en trädstruktur som innehåller alla
poster och placerar dem på de platser som motsvarar deras ursprungliga
klassning.
I en andra fas ansas trädet så att varje sida presenterar,
så långt klassifikationssystemet så tillåter,
ett användarsynpunkt optimalt antal poster.
.PP
En toppsida skapas för att hålla samtliga huvudkategorier,
under denna kan sidor innehålla både länkar till resurser i Miljönätet
och till bläddringssidor djupare ner i hierarkin.
.NH 2
Sökmaskin och databasens WWW-gränssnitt
.LP
Nordiskt Webindex använder i dag Z39.50\**
.FS
http://lcweb.loc.gov/z3950/agency/
.FE
som sökprotokoll.
NWI använder profilen GILS\**
.FS
http://www.usgs.gov/gils/intro.html
.FE
version 1.0, men kommer under 1997 att uppgradera till version 2.0
Sökprogramvaran är Zebraserver.\**
.FS
http://www.indexdata.dk/zebra.html
.FE
WWW-gränssnittet Europagate\**
.FS
http://europagate.dtv.dk/
.FE
gör det möjligt för en användare att söka i ett flertal
databaser parallellt.
Därför skulle det i princip vara möjligt för
Svenska Miljönätets användare att samtidigt söka i såväl den
Miljönätets databas och i andra liknande databaser,
vilka följer samma standard,
t ex G7-databaserna.\**
.FS
http://enrm.ceo.org/free/info.html
.FE
.PP
Zebrarserver och Europagate klarar som de är konfigurerade
i NWI av de boolska operationerna \fI\(rqoch\(rq\fP,
\fI\(rqeller\(rq\fP och \fI\(rqmen inte\(rq\fP.
Därutöver klarar kombinationen av trunkering med hjälp
av tecknet \(rq#\(rq.
Det är enkelt att ställa in gränssnittet för fältsökning.
.so tidsplan.m4
.NH 1
Tidsplan och grundval för kostnadsberäkning
.LP
Vi känner oss ganska säkra på att klara följande tidsplan.
De olika arbetsmomenten definieras i Tab 1\-2,
och deras läge i tiden visas i Fig 2\-3.
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
Tidsplanering för
arbetet med Miljönätets sökmaskin och katalogserver
i olika arbetsmoment (se Tab 1), med beräknad tidsåtgång för
version 1 av tjänsten.
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
men täckandet arbetetsmomenten inför version 2
av tjänsten
.KE
