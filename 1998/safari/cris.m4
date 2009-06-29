.nr LL 15c
.nr HM 2.5c
.nr FM 2.5c
.nr PL 29.7c
.nr PO 3.0c
.po 3.0c
.nr PS 12
.nr VS 14
.nr FI 0c
.nr FL 15c
.nr PI 1.0c
.ds marker "\s+2\(sq\s-2
.ds EG E\s-3UROPA\s+3G\s-3ATE\s+3
.ds ABSTRACT SAMMANFATTNING
.hpf hyphen.se
.\"mso tmac.dvipspic
.ds RCSID "$Id$
.de BT
.ie \\n[PN]==1 \{\
.	if d RCSID \{\
.		tl '''\\s-2\\*[RCSID]\\s+2'
.	\}
.\}
.el \{\
.	ie o .tl \\*[pg*OF]
.	el .tl  \\*[pg*OF]
.\}
..
.OH "'\\fIS. Lundberg\\fP''%'
.EH "'%''\\fIEn arkitektur f�r forskningsinformation\\fP'
.R1
abbreviate "A"
reverse "A"
move-punctuation
accumulate
bracket-label " [" "]" ","
database /home/siglun/documents/biblo/bibliography_long
.R2
.TL
.hy 0
En arkitektur f�r ett distribuerat system f�r
spridning av forskningsinformation\**
.hy 14
.FS
Arbete best�llt av H�gskoleverket februari 1998 att ing� i en st�rre rapport.
.FE
.AU
Sigfrid Lundberg (sigfrid.lundberg@lub.lu.se)
.AI
Lunds universitetsbibliotek, Netlab
BOX 3, 221 00 Lund
.AB
.vs 12
.ps 10
Arkitekturen f�r ett n�tverk av tj�nster f�r spridning av
forskningsinformation beskrivs. N�tverket till�ter distribuerat
underh�ll av s�v�l data som metadata. Till n�tverket kan anslutas
s�v�l bibliografiska databaser som helt WWWbaserade metadataberikade
tj�nster.
Metadataproduktionen f�ljer standarden Dublin Core.
De f�rra typerna av tj�nster inkorporeras i n�tverket genom interoperabilitet
p� s�kprotokollsniv�,
medan metadata och fulltext fr�n de senare g�res s�kbara genom en
WWWrobot.
Kommunikation inom n�tverket utnyttjar standardiserade Internet protokoll
som HTTP,
och f�r informations�tervinning Z39.50.
.AE
.NH 1
Vision, Mission och Funktion
.LP
Den som vitt och brett orerar om att vi befinner sig i
en tid d� folkets attityder
till informationss�kning �r stadd i snabb f�rvandling riskerar att
f�rfalla till plattityder.
Emellertid,
fr�n att ha utnyttjat tryckta k�llor, f�rv�ntar sig en allt st�rre
del av befolkningen att allt som �r v�rt att veta finns tillg�ngligt i
elektronisk form. N�rmare best�mt via Worldwide Web.
�ven om de som hyser s�dana f�rv�ntningar, g�r det mot b�ttre vetande
(och kommer att g�ra s� �tskilliga �r fram�ver) s� �r de elektroniska
f�rv�ntningarna med all sannolikhet starka nog f�r att p�verka
marknaden f�r information.
.PP
N�tpublicering av popul�rvetenskap och andra former av
forskningsinformation blir vanligare. Detta oaktat projekt som Safari,
som dock f�rst�rker tendenser som man redan tidigare kunnat avl�sa.
Internets m�jligheter f�r direkt interaktion mellan enskilda
forskare och allm�nheten ger ett starkare incitament f�r
produktion av forskningsinformation.
.KF
.PSPIC functions.eps
.QP
.ps 10
.vs 12
Figur 1. Arkitekturen f�r ett hypotetiskt distribuerat system f�r
forskningsinformation. Systemet har flera ing�ngar f�r
slutanv�ndare. Varje \(rqGateway\(rq �r en potentiell s�dan
startpunkt. Startpunkterna kan ha olika inriktning f�r att
tillgodose olika anv�ndargruppers behov eller lokala krav.
Systemet till�ter ocks� m�nga s�tt att lokalt hantera metainformation.
Nod \fBB\fP spelar en central roll i n�tverket som f�rmedlare av
information. \fBB\fP producerar inte sj�lv information i st�rre
utstr�ckning.
\fBA\fP \fBC\fP och \fBD\fP �r publicister i vid mening.  \fBA\fP och
\fBD\fP �r relativt sm� noder och har ingen egen s�kmotor.  Det f�rra
systemet har dock egna verktyg f�r produktion och underh�ll av
metainformation, medan det senare utnyttjar verktyg som tillhandah�lls
av nod \fBB\fP.
Se texten f�r en utf�rligare diskussion.
.sp
.KE
.PP
Redan i dag kan man notera att n�rvaro p� n�tet leder till att
f�rhoppningsfulla studenter h�r av sig direkt till forskningsinstitutioner
vid universiteten i st�llet f�r att g� (vad de ser som en omv�g) via
studiev�gledare.
Likas� leder s�dan n�rvaro till att man l�ttare blir hittad av
presumptiva internationella samarbetspartners\**.
.FS
Talar av egen erfarenhet som Webmaster vid en
naturvetenskaplig forskningsinstitution.
.FE
Gott tillfl�de av studenter �r en akademisk diciplins livsnerv.
Utan den stryps p� sikt tillfl�det av s�v�l sekiner som vardande kompetens.
.PP
Krafterna p� informationsmarknaden kommer allts� att �ndra forskarnas
attityder. Men f�r�ndringarna kommer inte att sluta d�rvid.
De hinder som i dag f�religger f�r elektronisk publicering kommer att l�sas:
.IP \*[marker]
Kvalitetskontroll och lekt�rssystem kommer att utvecklas och g�ra
elektronisk publicering lika meriterande som traditionell
pappersburen.
.IP \*[marker]
Former f�r s�ker redundant arkivering kopplad till
autenticitetskontroll f�r n�tburna publikationer kommer utvecklas.
.IP \*[marker]
Ett fungerande system som g�r det m�jligt att ge best�ndiga
referenser till elektroniska dokument.\**
.FS
IETFs arbetsgrupp Uniform Resource Names (URN) informerar om sig sj�lva p�
http://www.ietf.org/html.charters/urn-charter.html
.FE
.IP \*[marker]
Tillf�rlitliga inb�ddade s�v�l som externa metadata\** \(em kanske
f�rsedd med elektronisk signatur \(em g�r det m�jligt att klarg�ra
intellektuell �gander�tt till n�tburna objekt och som d�rut�ver
f�renklar byggandet av olika s�kverktyg.
.FS
Information om n�tburen metadata finns bl a p� 
http://purl.oclc.org/metadata/dublin_core/ och
http://www.w3.org/Metadata/Activity.html
.FE
.LP
Det finns m�nga akt�rer med intresse av att sprida och tillg�ngligg�ra
information om forskning: Bland dessa m�rks f�rutom forskarna sj�lva
institutioner, universitet och h�gskolor, finansi�rer och l�rda
samfund.\**
.FS
Fysikerna �r de mest avancerade kategorin akademiker n�r det g�ller
att ta i bruk informationsteknologi
(http://www.physics.mcgill.ca/~karttune/crisp97/Welcome.html), och
genom att studera deras verksamhet p� omr�det kan vi g�ra
f�ruts�gelser om vart andra kategorier �r p� v�g. Vetenskaplig
kommunikation i allm�nhet sker i relativt h�g grad i de l�rda
samfundens regi. Vad g�ller fysik �r det intressant att studera
American Physical Society's (http://www.aps.org/eprint/) IT-anv�ndning
och deras f�rlagsverksamhet som �r integrerat med ett eprint-system
(http://publish.aps.org/eprint/).
.FE
Dessa producentgrupperna �r b�de partners och konkurrenter i olika
sammanhang har bara delvis samma m�lgrupper f�r sin information
M�lgrupperna �r i sin tur �n mer heterogena �n producenterna.
.PP
Syftet med Safarisystemets arkitektur �r att genom att definiera n�gra
minimala krav vad g�ller anv�ndning av metadata och protokoll f�r
informationss�kning g�ra det m�jligt f�r alla producentgrupper att
samsas i ett distribuerat initiativ d�r olika tj�nster
kan dra nytta av varandra och l�ttare uppn� kritisk massa.
Safari blir en informationstj�nst p� n�tet, men safarikonceptet
till�ter flera tj�nster och m�nga akt�rer i samma n�t.
S�rskilda Gateways\**
.FS
Jag har allvarligt f�rs�kt att hitta (p�) ett bra och klatschigt
svensk begrepp f�r detta. Men misslyckats.
.FE
kan s�ttas upp f�r grupper med s�rskilda behov,
som t ex barn och ungdom.
Samtidigt �r det m�jligt att med samma teknologier g�ra ett eprint-arkiv
s�kbart f�r anv�ndare inom FoU.
.NH 1
Metadataverktyg, Robotar och informationsservrar som spindlar i n�tet
.LP
Dokumentet �r atomen i varje informationssystem (Figur 1). Ett
dokument i ett n�tverk av safarimedvetna informationsserverar m�ste ha
egenskapen att man skall kunna utl�sa en del data om
det. Data om dokumentet sj�lvt \(em metadata. Det �r
ingen m�rkv�rdig metainformation som kr�vs, utan ungef�r den
information som ryms p� ett kort i en gammaldags analog bibliotekskatalog:
Dokumentets \fIf�rfattare\fP och \fItitel\fP, \fIpubliceringsdatum\fP,
\fI�mnesord\fP och en \fIkort sammanfattning\fP.
F�r dessa �ndam�l anv�nds Dublin Core metadata\**.
.FS
http://purl.oclc.org/metadata/dublin_core/
.FE
Allt material ges dessutom en \fIklassningskod\fP enligt
klassifikationssystemet CERIF\**.
Safariprojektet upplever en hel del problem med detta system:
.IP \*[marker]
Att det inte t�cker alla forskningsdicipliner vid rikets universitet,
och rent allm�nt �r f�r grunt.
.IP \*[marker]
Att det helt saknas ing�ngar f�r vissa verksamheter som t. ex. konstn�rligt
utvecklingsarbete.
.IP \*[marker]
Att anv�ndare trots systemets litenhet inte utnyttjar det fullt ut och
chablonm�ssigt klassificerar dokument direkt under n�gon av de sex
huvudkategorierna.
.FS
�mnesf�rteckningen CERIF underh�lls och utvecklas av EU-kommissionen
under DG XIII. Format i sig �r under diskussion. Under hela 1998 p�g�r
ett arbete som heter CERIF Revision Work och som syftar till att ge
Kommissionen ett f�rslag till framtida hantering av
forskningsinformation (Martin Sparr, pers. komm.).
CERIF, s�som det avnv�nds i SAFARIprojektet finns tillg�ngligt i
maskinl�sbar form p� http://safari.hsv.se/metadata/vvv/cerif.tree
.FE
.PP
Varf�r skall d� informationen finnas \fIi\fP varje dokument? Svaret �r
uppenbart: Det �r bara d�r den g�r riktig nytta.
Det �r bara d�r som \fIalla\fP WWW robotar kan ta del av metainformationen.
I dag �r det bara en mindre andel av s�ktj�nsterna som drar riktig nytta av
den. F�rutom Safariroboten
s� �r det i skrivande stund i Sverige Nordiskt Webindex\**
.FS
http://nwi.lub.lu.se
.FE
och Svenska Milj�n�tet\** som klarar av Dublin Core metadata.
.FS
http://smn.environ.se
.FE
Den nuvarande Safaritj�nsten\**
.FS
http://safari.hsv.se
.FE
motsvarar nod \fBB\fP i Figur 1.
En motsvarande lokal tj�nst, Forskningsinformation i Lund (FiL),
f�r Lunds universitet t�ckande dom�nerna
\f(CRlth.se\fP och \f(CRlu.se\fP finns idag.\**
.FS
http://www.lu.se/lu/forskn/fil/
.FE
En s�kning i Safari g�r automatiskt till b�da databaserna parallellt.
.NH 2
Metadatahantering i Safari
.LP
Safariprojektet har utvecklat ett verktyg som hj�lper
dokumentf�rfattare och andra att f�rse dokument med metainformation.
(Finns i nod \fBB\fP i Figur 1), men inget hindrar att organisationer
och enskilda utvecklar egna verktyg eller metoder f�r detta.
I Figur 1 finns en nod \fBD\fP som utnyttjar verktyget i nod \fBB\fP.
Verktyget\**
.FS
Verktyget �r anpassat fr�n Nordisk Metadatas'
(http://linnea.helsinki.fi/meta/)
verktyg
(http://www.lub.lu.se/cgi-bin/nmdc.pl)
.FE
�r konstruerat s� att det kan anv�ndas varhelst ett objekt
finns p� Internet.
I geng�ld fordrar verktyget vissa �tg�rder, ut�ver sj�lva ifyllandet,
fr�n anv�ndaren.
Anv�ndaren m�ste sj�lv kunna klistra ett antal rader HTML i sitt dokument,
alternativt se till metadata kommer p� plats p� annat vis.
Metadataverktygen\**
.FS
Tv� metadataverktyg �r direkt knutna till SAFARItj�nsten. Ett finns vid
H�gskoleverket (http://safari.hsv.se/metadata/safari.pl) och ytterligare ett
vid Lunds universitet (http://gungner.lub.lu.se/safari/metadata/safari.pl).
De tv� metadataverktygen kommunicerar korsvis,
s� att registreringar av material vid enheter vid dom�nerna lth.se och lu.se
som g�rs vid HSV leder till att den registrerade sidan
indexeras av SAFARI i Lund (SiL) och visa versa.
.FE
kontaktar vid registrering automatiskt SAFARIroboten,
s� att denna tar det registrerade objekt f�r indexering.
Detta sker normalt inom tv� timmar efter registrering.
Efter fyra timmar g�rs ytterligare ett f�rs�k,
och vid midnatt varje natt g�rs en uppsamlingsk�rning d� ytterligare
f�rs�k att h�mta resursen g�rs.
Det normala �r att indexering lyckas vid f�rsta f�rs�ket.
.KF
.PSPIC production.eps
.QP
.ps 10
.vs 12
Figur 2. Schematisk skiss av produktionsg�ngen vid en central
nod. Allt inom den gr� ytan symboliserar komponenter vid en nod som
den betecknad \fBB\fP i Figur 1.
.sp
.KE
.so obligation.m4
.PP
Tillhandah�llare av information kan v�lja att l�sa inmatningen av metadata p�
olika s�tt.
Man kan f�rutse att den metod som symboliseras av nod \fBA\fP i Figur 1 kommer
att bli mycket anv�nd.
H�r arbetar f�rfattare och andra med ett verktyg mot en lokal databas
som med automatik l�gger metadata p� plats.
Funktioner av detta slag kan enkelt implementeras p� servrar med olika
former av SSI (server side include, kallas ibland server-side scripting
active server pages mm).
N�gon standard f�r \fIhur\fP detta skall g� till varken finns och
beh�vs egentligen inte.
Det �r resultatet som r�knas.
I skrivande stund har en Access-databas vid Stockholms universitet
framg�ngsrikt testats inom Safariprojektet.
F�r att underl�tta implementationen av s�dana verktyg,
tillhandah�ller SAFARI projektet �ven de anv�nda kontrollerade vokabul�rerna
i maskinl�sbar form (see Appendix C).
.PP
F�r att underl�tta indexering av material r�rande milj�forskning,
som ju �r av intresse f�r s�v�l Svenska Milj�n�tet (SMN)\**,
.FS
http://smn.environ.se
.FE
som SAFARI, finns i dag en koppling mellan de b�da tj�nsternas metadataverktyg.
Det fungerar s�, att ett s�rskilt verktyg placerat vid milj�n�tet skall
anv�ndas f�r dubbel registrering i b�da tj�nsterna.
Eftersom vissa av de kontrollerade vokabul�rerer �r specifika f�r de b�da
tj�nsterna, s� kr�vs mer information vid dubbel registrering \(em men den g�r
att producera vid en session vid ett metadataverktyg.
.PP
En WWW-sida m�ste inneh�lla ett visst minimum av metadata f�r att bli
indexerad,
varf�r roboten har gjorts selektiv och sparar endast poster som uppfyller
vissa minimikrav vad g�ller metadata.
Dessa krav sammanfattas i Tabell 1.
Den som utnyttjar SAFARIprojektets verktyg skall normalt vara f�rs�krad
om att metadata skall fungera,
de som utvecklar egna verktyg b�r dels studera Tabell 1,
dels generera metadata med projektets verktyg.
Verktyget skall ses som en del av dokumentation f�r hur metadata skall kodas.
Ett delvis p�hittat exempel p� en giltig metadatapost finns i Appendix A.
.PP
Utvecklingen p� metadata omr�det �r f�r n�rvarnade mycket snabb, och
nya metoder f�r kodning och leverans av metadata bli aktuella och mer
avancerad kodning �r under utveckling. Den viktigaste �r RDF\**
.FS
http://www.w3.org/TR/WD-rdf-syntax/
.FE
som �r baserat p� XML\**
.FS
http://www.w3.org/TR/1998/NOTE-XML-data-0105/
.FE
Det nu befintliga systemet, liksom framtida mer avancerade former
kr�ver att metadata �verf�rs till den centrala nodens databaser med hj�lp av
automatiska metoder, t ex med WWW-robot som i figurens nod \fBB\fP.
Detta �r emellertid inte n�dv�ndigt f�r att delta i samarbetet.
Nod \fBC\fP i Figur 1 har valt att inte leverera metadata direkt,
utan deltar i st�llet i samarbetet p� en h�gre niv� genom att
erbjuda databaser med ett s�kgr�nssnitt\** som uppfyller Safaris krav.
Man kan d�rf�r fr�n den centrala noden \fB\fP s�ka i databasen i \fBC\fP,
som dessutom erbjuder en alternativ startpunkt med en egen s�king�ng.
.FS
Gr�nssnittet utg�rs i dag av IR-protokollet Z39.50
(http://lcweb.loc.gov/z3950/agency/)
och anv�nder profilen GILS.
Se Tabell 2.
.FE
.KF
.LP
.vs 12
.ps 10
Tabell 2. De i Safaridatabasen anv�nda metadataf�lten s� som de indexeras
av Safaris robot,
och hur de kan s�kas med Z39.50.
F�r andra f�lt som skapas av roboten sj�lv, se Tabell 3.
S�kmaskinen klarar SUTRS, US Marc och GRS-1 record syntax.
Databasen heter \f(CRsweden\fP och ligger p� \f(CRsafari.hsv.se:2121\fP.
Ytterligare en databas som f�ljer samma standarder finns vid Lunds universitet
och heter \f(CRok\fP och ligger i skrivande stund p�
\f(CRgungner.lub.lu.se:2100\fP.
Om ej annat anges, g�rs all s�kning g�rs med rankning (attribut 2=102).
Tj�nsten anv�nder Z39.50 profilen GILS\**
.FS
http://www.usgs.gov/gils/prof_v2.html
.FE
.TS
allbox expand tab(;);
lb10 lb10 lb10
l10 l10 l10 .
DC Element;Z39.50/GILS;Z39.50 s�kattribut
DC.Creator.Address;authorNetworkAddress;author 1=1003 (BIB1)
DC.Creator;authorName;author 1=1003 (BIB1)
DC.Creator.CorporateName.Address;authorNetworkAddress;author 1=1003 (BIB1)
DC.Creator.CorporateName;authorName;author 1=1003 (BIB1)
DC.Creator.PersonalName.Address;authorNetworkAddress;author 1=1003 (BIB1)
DC.Creator.PersonalName;authorName;author 1=1003 (BIB1)
DC.Subject (SCHEME=CERIF);subjectTermsControlled;T{
.na
controlled-subject-index
1=2057 (GILS)
T}
DC.Subject;subjectTermsUncontrolled;uncontrolled-term 1=2058 (GILS)
DC.Description;abstract; Abstract 1=62 (BIB1)
DC.Publisher.Address;distributorNetworkAddress;T{
.na
distributor-Network-Address
1=2012 (GILS)
T}
DC.Publisher;distributorName;distributor-Name 1=2001 (GILS)
DC.Title;title;title 1=4 (BIB1)
DC.Language;languageOfResource;Code-language 1=54 (BIB1)
DC.Indentifier;availableLinkage;Available-Linkage 1=2069 (GILS)
SAFARI.TargetGroup;purpose;Purpose  1=2003 (GILS)
DC.Coverage.PlaceName;placeKeyword;place-keyword  1=2042 (GILS)
.TE
.KE
.KF
.LP
.vs 12
.ps 10
Tabell 3. De viktigaste f�lten i Safaridatabasen som Safariroboten,
h�mtar direkt ur HTMLdokument. och hur de kan s�kas med Z39.50.
F�r �vriga f�lt se Tabell 2.
.TS
allbox expand tab(;);
lb10 lb10 lb10
l10 l10 l10 .
HTML kod;Z39.50/GILS;Z39.50 s�kattribut
<A HREF="l�nk"> ... </A>;crossReferenceLinkage;T{
.na
crossReferenceLinkage 1=2047 (GILS)
T}
<A HREF="...">ankartext</A>;crossReferenceTitle;T{
.na
crossReferenceTitle 1=2046 (GILS)
T}
T{
.na
Other textual information
except HTML comments
and HTML tags
T};bodyOfText;Body-of-text 1=1010 (BIB1)
.TE
.KE
.NH 2
Robot och s�kfunktioner vid Safaritj�nsten
.LP
Metadata, fulltext och en del annan information samlas in med
hj�lp av roboten Combine\**.
.FS
http://www.lub.lu.se/combine/
.FE
Robot och metadataverktyg har f�rm�gan att samarbeta, s� till vida
att verktyget kan spara metainformation i en extern databas (Se Figur 2).
Roboten har access till denna externa databas,
och kan sl� upp information som ett komplement till
informationen direkt extraherad ur dokument.
Detta m�jligg�r indexering av mediaformat som inte �r s� v�l �gnade
f�r maskinell l�sning av en WWWrobot, t ex olika ljud- och bildformat.
En (avsiktlig men ej uppmuntrad) biprodukt �r att metadataverktyget
�ven kan an�ndas f�r ren registrering av internetresurser.
Ett problem med detta tillv�gag�ngss�tt uppkommer n�r
det existerar giltiga metadata i b�de databas och sida,
vilket fall den senare versionen ges f�retr�de.
.PP
URLer som registrerats av verktyget skickas till roboten f�r indexering.
Roboten i sig underh�ller Safaridatabasen,
vilken best�r av textfiler i ett enkelt SGML-format.
Ett exempel p� s�dan post kan av nyfikna besk�das i Appendix B.
Filerna lagras i ett filsystem.
Filerna l�ses och g�res s�kbara med hj�lp av Z39.50programvaran
Zebra server\**.
.FS
http://www.indexdata.dk/zebra/
.FE
Den synliga delen av tj�nsten �r en WWW-gateway som kan ges olika
utformning.
F�r �ndam�let utnyttjas \*[EG]\**,
.FS
http://europagate.dtv.dk/ 
.FE
som klarar distribuerad s�kning.
.PP
Information om vilka s�kattribut som anv�nds finns i Tabell 2\-3.
Det framg�r ocks� i de tv� tabellerna vilka DC metadata som ligger till
grund f�r s�kf�lten.
.PP
Roboten f�r en del l�nkar via registrering och metadataverktyg.
Det stora flertalet kommer in i systemet via extraktion av URLar ur
indexerade dokument.
.IP 1
Roboten vittjar registringarna p� URLar en g�ng varannan timme.
.IP 2
Roboten testar servrars dom�ner mot en lista av godk�nda dom�ner
(DOM�NTEST)
.\" -- se listan mot slutet.
.IP 3
URLar som kommer in i roboten �r av tv� slag:
.ID
a: Registrerade l�nkar som passerat testet i punkt 2.
b: L�nkar som roboten hittat sj�lv.
.sp 0.5c
L�nkar av typ a g�r rakt in. Typ b-l�nkar testas om huruvida
de finns i n�rheten av en typ a-l�nk (N�RHETSTEST).
.DE
.IP 4
Roboten f�ljer l�nkar i s�dana dokument som inneh�ller giltiga
metadata enligt Tabell 1, f�r s�dana dokument skapas ocks� en post i
databasen.
.NH 2
Safaritj�nstens bl�ddringssystem
.LP
Ut�ver den rena s�ktj�nsten, erbjuder Safari ett tv�spr�kigt
bl�ddringssystem\**
.FS
http://safari.hsv.se/browse/structure/root.html.sv
.FE
som till sin funktion �r inspirerad av den popul�ra s�ktj�nsten Yahoo\**
.FS
http://www.yahoo.com/
.FE
Denna struktur best�r av statiska sidor som genereras varje natt
genom s�kning i alla anslutna databaser som st�djer CERIF och Z39.50.
F�r n�rvarande s�ker SAFARI vid H�gskoleverket i tv� separata databaser
f�r att generera sin bl�ddringsstruktur, som �ven inneh�ller samtliga poster
fr�n SAFARI i Lund.
.PP
Generering av sidorna g�rs i tv� steg: F�rst s�ker programvaran
rekursivt genom samtliga signum i CERIF-tr�det och sparar tr�ffarna
samt noterar deras antal. I n�sta steg genereras sidor och menyer som
ocks� inneh�ller information om antal poster i underliggande
noder. D�rigenom kan anv�ndare direkt var i bl�ddringssystemet det
finns information att h�mta.
.bp
.so exempel.m4
.so treefiles.m4
