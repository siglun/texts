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
.EH "'%''\\fIEn arkitektur för forskningsinformation\\fP'
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
En arkitektur för ett distribuerat system för
spridning av forskningsinformation\**
.hy 14
.FS
Arbete beställt av Högskoleverket februari 1998 att ingå i en större rapport.
.FE
.AU
Sigfrid Lundberg (sigfrid.lundberg@lub.lu.se)
.AI
Lunds universitetsbibliotek, Netlab
BOX 3, 221 00 Lund
.AB
.vs 12
.ps 10
Arkitekturen för ett nätverk av tjänster för spridning av
forskningsinformation beskrivs. Nätverket tillåter distribuerat
underhåll av såväl data som metadata. Till nätverket kan anslutas
såväl bibliografiska databaser som helt WWWbaserade metadataberikade
tjänster.
Metadataproduktionen följer standarden Dublin Core.
De förra typerna av tjänster inkorporeras i nätverket genom interoperabilitet
på sökprotokollsnivå,
medan metadata och fulltext från de senare göres sökbara genom en
WWWrobot.
Kommunikation inom nätverket utnyttjar standardiserade Internet protokoll
som HTTP,
och för informationsåtervinning Z39.50.
.AE
.NH 1
Vision, Mission och Funktion
.LP
Den som vitt och brett orerar om att vi befinner sig i
en tid då folkets attityder
till informationssökning är stadd i snabb förvandling riskerar att
förfalla till plattityder.
Emellertid,
från att ha utnyttjat tryckta källor, förväntar sig en allt större
del av befolkningen att allt som är värt att veta finns tillgängligt i
elektronisk form. Närmare bestämt via Worldwide Web.
Även om de som hyser sådana förväntningar, gör det mot bättre vetande
(och kommer att göra så åtskilliga år framöver) så är de elektroniska
förväntningarna med all sannolikhet starka nog för att påverka
marknaden för information.
.PP
Nätpublicering av populärvetenskap och andra former av
forskningsinformation blir vanligare. Detta oaktat projekt som Safari,
som dock förstärker tendenser som man redan tidigare kunnat avläsa.
Internets möjligheter för direkt interaktion mellan enskilda
forskare och allmänheten ger ett starkare incitament för
produktion av forskningsinformation.
.KF
.PSPIC functions.eps
.QP
.ps 10
.vs 12
Figur 1. Arkitekturen för ett hypotetiskt distribuerat system för
forskningsinformation. Systemet har flera ingångar för
slutanvändare. Varje \(rqGateway\(rq är en potentiell sådan
startpunkt. Startpunkterna kan ha olika inriktning för att
tillgodose olika användargruppers behov eller lokala krav.
Systemet tillåter också många sätt att lokalt hantera metainformation.
Nod \fBB\fP spelar en central roll i nätverket som förmedlare av
information. \fBB\fP producerar inte själv information i större
utsträckning.
\fBA\fP \fBC\fP och \fBD\fP är publicister i vid mening.  \fBA\fP och
\fBD\fP är relativt små noder och har ingen egen sökmotor.  Det förra
systemet har dock egna verktyg för produktion och underhåll av
metainformation, medan det senare utnyttjar verktyg som tillhandahålls
av nod \fBB\fP.
Se texten för en utförligare diskussion.
.sp
.KE
.PP
Redan i dag kan man notera att närvaro på nätet leder till att
förhoppningsfulla studenter hör av sig direkt till forskningsinstitutioner
vid universiteten i stället för att gå (vad de ser som en omväg) via
studievägledare.
Likaså leder sådan närvaro till att man lättare blir hittad av
presumptiva internationella samarbetspartners\**.
.FS
Talar av egen erfarenhet som Webmaster vid en
naturvetenskaplig forskningsinstitution.
.FE
Gott tillflöde av studenter är en akademisk diciplins livsnerv.
Utan den stryps på sikt tillflödet av såväl sekiner som vardande kompetens.
.PP
Krafterna på informationsmarknaden kommer alltså att ändra forskarnas
attityder. Men förändringarna kommer inte att sluta därvid.
De hinder som i dag föreligger för elektronisk publicering kommer att lösas:
.IP \*[marker]
Kvalitetskontroll och lektörssystem kommer att utvecklas och göra
elektronisk publicering lika meriterande som traditionell
pappersburen.
.IP \*[marker]
Former för säker redundant arkivering kopplad till
autenticitetskontroll för nätburna publikationer kommer utvecklas.
.IP \*[marker]
Ett fungerande system som gör det möjligt att ge beständiga
referenser till elektroniska dokument.\**
.FS
IETFs arbetsgrupp Uniform Resource Names (URN) informerar om sig själva på
http://www.ietf.org/html.charters/urn-charter.html
.FE
.IP \*[marker]
Tillförlitliga inbäddade såväl som externa metadata\** \(em kanske
försedd med elektronisk signatur \(em gör det möjligt att klargöra
intellektuell äganderätt till nätburna objekt och som därutöver
förenklar byggandet av olika sökverktyg.
.FS
Information om nätburen metadata finns bl a på 
http://purl.oclc.org/metadata/dublin_core/ och
http://www.w3.org/Metadata/Activity.html
.FE
.LP
Det finns många aktörer med intresse av att sprida och tillgängliggöra
information om forskning: Bland dessa märks förutom forskarna själva
institutioner, universitet och högskolor, finansiärer och lärda
samfund.\**
.FS
Fysikerna är de mest avancerade kategorin akademiker när det gäller
att ta i bruk informationsteknologi
(http://www.physics.mcgill.ca/~karttune/crisp97/Welcome.html), och
genom att studera deras verksamhet på området kan vi göra
förutsägelser om vart andra kategorier är på väg. Vetenskaplig
kommunikation i allmänhet sker i relativt hög grad i de lärda
samfundens regi. Vad gäller fysik är det intressant att studera
American Physical Society's (http://www.aps.org/eprint/) IT-användning
och deras förlagsverksamhet som är integrerat med ett eprint-system
(http://publish.aps.org/eprint/).
.FE
Dessa producentgrupperna är både partners och konkurrenter i olika
sammanhang har bara delvis samma målgrupper för sin information
Målgrupperna är i sin tur än mer heterogena än producenterna.
.PP
Syftet med Safarisystemets arkitektur är att genom att definiera några
minimala krav vad gäller användning av metadata och protokoll för
informationssökning göra det möjligt för alla producentgrupper att
samsas i ett distribuerat initiativ där olika tjänster
kan dra nytta av varandra och lättare uppnå kritisk massa.
Safari blir en informationstjänst på nätet, men safarikonceptet
tillåter flera tjänster och många aktörer i samma nät.
Särskilda Gateways\**
.FS
Jag har allvarligt försökt att hitta (på) ett bra och klatschigt
svensk begrepp för detta. Men misslyckats.
.FE
kan sättas upp för grupper med särskilda behov,
som t ex barn och ungdom.
Samtidigt är det möjligt att med samma teknologier göra ett eprint-arkiv
sökbart för användare inom FoU.
.NH 1
Metadataverktyg, Robotar och informationsservrar som spindlar i nätet
.LP
Dokumentet är atomen i varje informationssystem (Figur 1). Ett
dokument i ett nätverk av safarimedvetna informationsserverar måste ha
egenskapen att man skall kunna utläsa en del data om
det. Data om dokumentet självt \(em metadata. Det är
ingen märkvärdig metainformation som krävs, utan ungefär den
information som ryms på ett kort i en gammaldags analog bibliotekskatalog:
Dokumentets \fIförfattare\fP och \fItitel\fP, \fIpubliceringsdatum\fP,
\fIämnesord\fP och en \fIkort sammanfattning\fP.
För dessa ändamål används Dublin Core metadata\**.
.FS
http://purl.oclc.org/metadata/dublin_core/
.FE
Allt material ges dessutom en \fIklassningskod\fP enligt
klassifikationssystemet CERIF\**.
Safariprojektet upplever en hel del problem med detta system:
.IP \*[marker]
Att det inte täcker alla forskningsdicipliner vid rikets universitet,
och rent allmänt är för grunt.
.IP \*[marker]
Att det helt saknas ingångar för vissa verksamheter som t. ex. konstnärligt
utvecklingsarbete.
.IP \*[marker]
Att användare trots systemets litenhet inte utnyttjar det fullt ut och
chablonmässigt klassificerar dokument direkt under någon av de sex
huvudkategorierna.
.FS
Ämnesförteckningen CERIF underhålls och utvecklas av EU-kommissionen
under DG XIII. Format i sig är under diskussion. Under hela 1998 pågår
ett arbete som heter CERIF Revision Work och som syftar till att ge
Kommissionen ett förslag till framtida hantering av
forskningsinformation (Martin Sparr, pers. komm.).
CERIF, såsom det avnvänds i SAFARIprojektet finns tillgängligt i
maskinläsbar form på http://safari.hsv.se/metadata/vvv/cerif.tree
.FE
.PP
Varför skall då informationen finnas \fIi\fP varje dokument? Svaret är
uppenbart: Det är bara där den gör riktig nytta.
Det är bara där som \fIalla\fP WWW robotar kan ta del av metainformationen.
I dag är det bara en mindre andel av söktjänsterna som drar riktig nytta av
den. Förutom Safariroboten
så är det i skrivande stund i Sverige Nordiskt Webindex\**
.FS
http://nwi.lub.lu.se
.FE
och Svenska Miljönätet\** som klarar av Dublin Core metadata.
.FS
http://smn.environ.se
.FE
Den nuvarande Safaritjänsten\**
.FS
http://safari.hsv.se
.FE
motsvarar nod \fBB\fP i Figur 1.
En motsvarande lokal tjänst, Forskningsinformation i Lund (FiL),
för Lunds universitet täckande domänerna
\f(CRlth.se\fP och \f(CRlu.se\fP finns idag.\**
.FS
http://www.lu.se/lu/forskn/fil/
.FE
En sökning i Safari går automatiskt till båda databaserna parallellt.
.NH 2
Metadatahantering i Safari
.LP
Safariprojektet har utvecklat ett verktyg som hjälper
dokumentförfattare och andra att förse dokument med metainformation.
(Finns i nod \fBB\fP i Figur 1), men inget hindrar att organisationer
och enskilda utvecklar egna verktyg eller metoder för detta.
I Figur 1 finns en nod \fBD\fP som utnyttjar verktyget i nod \fBB\fP.
Verktyget\**
.FS
Verktyget är anpassat från Nordisk Metadatas'
(http://linnea.helsinki.fi/meta/)
verktyg
(http://www.lub.lu.se/cgi-bin/nmdc.pl)
.FE
är konstruerat så att det kan användas varhelst ett objekt
finns på Internet.
I gengäld fordrar verktyget vissa åtgärder, utöver själva ifyllandet,
från användaren.
Användaren måste själv kunna klistra ett antal rader HTML i sitt dokument,
alternativt se till metadata kommer på plats på annat vis.
Metadataverktygen\**
.FS
Två metadataverktyg är direkt knutna till SAFARItjänsten. Ett finns vid
Högskoleverket (http://safari.hsv.se/metadata/safari.pl) och ytterligare ett
vid Lunds universitet (http://gungner.lub.lu.se/safari/metadata/safari.pl).
De två metadataverktygen kommunicerar korsvis,
så att registreringar av material vid enheter vid domänerna lth.se och lu.se
som görs vid HSV leder till att den registrerade sidan
indexeras av SAFARI i Lund (SiL) och visa versa.
.FE
kontaktar vid registrering automatiskt SAFARIroboten,
så att denna tar det registrerade objekt för indexering.
Detta sker normalt inom två timmar efter registrering.
Efter fyra timmar görs ytterligare ett försök,
och vid midnatt varje natt görs en uppsamlingskörning då ytterligare
försök att hämta resursen görs.
Det normala är att indexering lyckas vid första försöket.
.KF
.PSPIC production.eps
.QP
.ps 10
.vs 12
Figur 2. Schematisk skiss av produktionsgången vid en central
nod. Allt inom den grå ytan symboliserar komponenter vid en nod som
den betecknad \fBB\fP i Figur 1.
.sp
.KE
.so obligation.m4
.PP
Tillhandahållare av information kan välja att lösa inmatningen av metadata på
olika sätt.
Man kan förutse att den metod som symboliseras av nod \fBA\fP i Figur 1 kommer
att bli mycket använd.
Här arbetar författare och andra med ett verktyg mot en lokal databas
som med automatik lägger metadata på plats.
Funktioner av detta slag kan enkelt implementeras på servrar med olika
former av SSI (server side include, kallas ibland server-side scripting
active server pages mm).
Någon standard för \fIhur\fP detta skall gå till varken finns och
behövs egentligen inte.
Det är resultatet som räknas.
I skrivande stund har en Access-databas vid Stockholms universitet
framgångsrikt testats inom Safariprojektet.
För att underlätta implementationen av sådana verktyg,
tillhandahåller SAFARI projektet även de använda kontrollerade vokabulärerna
i maskinläsbar form (see Appendix C).
.PP
För att underlätta indexering av material rörande miljöforskning,
som ju är av intresse för såväl Svenska Miljönätet (SMN)\**,
.FS
http://smn.environ.se
.FE
som SAFARI, finns i dag en koppling mellan de båda tjänsternas metadataverktyg.
Det fungerar så, att ett särskilt verktyg placerat vid miljönätet skall
användas för dubbel registrering i båda tjänsterna.
Eftersom vissa av de kontrollerade vokabulärerer är specifika för de båda
tjänsterna, så krävs mer information vid dubbel registrering \(em men den går
att producera vid en session vid ett metadataverktyg.
.PP
En WWW-sida måste innehålla ett visst minimum av metadata för att bli
indexerad,
varför roboten har gjorts selektiv och sparar endast poster som uppfyller
vissa minimikrav vad gäller metadata.
Dessa krav sammanfattas i Tabell 1.
Den som utnyttjar SAFARIprojektets verktyg skall normalt vara försäkrad
om att metadata skall fungera,
de som utvecklar egna verktyg bör dels studera Tabell 1,
dels generera metadata med projektets verktyg.
Verktyget skall ses som en del av dokumentation för hur metadata skall kodas.
Ett delvis påhittat exempel på en giltig metadatapost finns i Appendix A.
.PP
Utvecklingen på metadata området är för närvarnade mycket snabb, och
nya metoder för kodning och leverans av metadata bli aktuella och mer
avancerad kodning är under utveckling. Den viktigaste är RDF\**
.FS
http://www.w3.org/TR/WD-rdf-syntax/
.FE
som är baserat på XML\**
.FS
http://www.w3.org/TR/1998/NOTE-XML-data-0105/
.FE
Det nu befintliga systemet, liksom framtida mer avancerade former
kräver att metadata överförs till den centrala nodens databaser med hjälp av
automatiska metoder, t ex med WWW-robot som i figurens nod \fBB\fP.
Detta är emellertid inte nödvändigt för att delta i samarbetet.
Nod \fBC\fP i Figur 1 har valt att inte leverera metadata direkt,
utan deltar i stället i samarbetet på en högre nivå genom att
erbjuda databaser med ett sökgränssnitt\** som uppfyller Safaris krav.
Man kan därför från den centrala noden \fB\fP söka i databasen i \fBC\fP,
som dessutom erbjuder en alternativ startpunkt med en egen sökingång.
.FS
Gränssnittet utgörs i dag av IR-protokollet Z39.50
(http://lcweb.loc.gov/z3950/agency/)
och använder profilen GILS.
Se Tabell 2.
.FE
.KF
.LP
.vs 12
.ps 10
Tabell 2. De i Safaridatabasen använda metadatafälten så som de indexeras
av Safaris robot,
och hur de kan sökas med Z39.50.
För andra fält som skapas av roboten själv, se Tabell 3.
Sökmaskinen klarar SUTRS, US Marc och GRS-1 record syntax.
Databasen heter \f(CRsweden\fP och ligger på \f(CRsafari.hsv.se:2121\fP.
Ytterligare en databas som följer samma standarder finns vid Lunds universitet
och heter \f(CRok\fP och ligger i skrivande stund på
\f(CRgungner.lub.lu.se:2100\fP.
Om ej annat anges, görs all sökning görs med rankning (attribut 2=102).
Tjänsten använder Z39.50 profilen GILS\**
.FS
http://www.usgs.gov/gils/prof_v2.html
.FE
.TS
allbox expand tab(;);
lb10 lb10 lb10
l10 l10 l10 .
DC Element;Z39.50/GILS;Z39.50 sökattribut
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
Tabell 3. De viktigaste fälten i Safaridatabasen som Safariroboten,
hämtar direkt ur HTMLdokument. och hur de kan sökas med Z39.50.
För övriga fält se Tabell 2.
.TS
allbox expand tab(;);
lb10 lb10 lb10
l10 l10 l10 .
HTML kod;Z39.50/GILS;Z39.50 sökattribut
<A HREF="länk"> ... </A>;crossReferenceLinkage;T{
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
Robot och sökfunktioner vid Safaritjänsten
.LP
Metadata, fulltext och en del annan information samlas in med
hjälp av roboten Combine\**.
.FS
http://www.lub.lu.se/combine/
.FE
Robot och metadataverktyg har förmågan att samarbeta, så till vida
att verktyget kan spara metainformation i en extern databas (Se Figur 2).
Roboten har access till denna externa databas,
och kan slå upp information som ett komplement till
informationen direkt extraherad ur dokument.
Detta möjliggör indexering av mediaformat som inte är så väl ägnade
för maskinell läsning av en WWWrobot, t ex olika ljud- och bildformat.
En (avsiktlig men ej uppmuntrad) biprodukt är att metadataverktyget
även kan anändas för ren registrering av internetresurser.
Ett problem med detta tillvägagångssätt uppkommer när
det existerar giltiga metadata i både databas och sida,
vilket fall den senare versionen ges företräde.
.PP
URLer som registrerats av verktyget skickas till roboten för indexering.
Roboten i sig underhåller Safaridatabasen,
vilken består av textfiler i ett enkelt SGML-format.
Ett exempel på sådan post kan av nyfikna beskådas i Appendix B.
Filerna lagras i ett filsystem.
Filerna läses och göres sökbara med hjälp av Z39.50programvaran
Zebra server\**.
.FS
http://www.indexdata.dk/zebra/
.FE
Den synliga delen av tjänsten är en WWW-gateway som kan ges olika
utformning.
För ändamålet utnyttjas \*[EG]\**,
.FS
http://europagate.dtv.dk/ 
.FE
som klarar distribuerad sökning.
.PP
Information om vilka sökattribut som används finns i Tabell 2\-3.
Det framgår också i de två tabellerna vilka DC metadata som ligger till
grund för sökfälten.
.PP
Roboten får en del länkar via registrering och metadataverktyg.
Det stora flertalet kommer in i systemet via extraktion av URLar ur
indexerade dokument.
.IP 1
Roboten vittjar registringarna på URLar en gång varannan timme.
.IP 2
Roboten testar servrars domäner mot en lista av godkända domäner
(DOMÄNTEST)
.\" -- se listan mot slutet.
.IP 3
URLar som kommer in i roboten är av två slag:
.ID
a: Registrerade länkar som passerat testet i punkt 2.
b: Länkar som roboten hittat själv.
.sp 0.5c
Länkar av typ a går rakt in. Typ b-länkar testas om huruvida
de finns i närheten av en typ a-länk (NÄRHETSTEST).
.DE
.IP 4
Roboten följer länkar i sådana dokument som innehåller giltiga
metadata enligt Tabell 1, för sådana dokument skapas också en post i
databasen.
.NH 2
Safaritjänstens bläddringssystem
.LP
Utöver den rena söktjänsten, erbjuder Safari ett tvåspråkigt
bläddringssystem\**
.FS
http://safari.hsv.se/browse/structure/root.html.sv
.FE
som till sin funktion är inspirerad av den populära söktjänsten Yahoo\**
.FS
http://www.yahoo.com/
.FE
Denna struktur består av statiska sidor som genereras varje natt
genom sökning i alla anslutna databaser som stödjer CERIF och Z39.50.
För närvarande söker SAFARI vid Högskoleverket i två separata databaser
för att generera sin bläddringsstruktur, som även innehåller samtliga poster
från SAFARI i Lund.
.PP
Generering av sidorna görs i två steg: Först söker programvaran
rekursivt genom samtliga signum i CERIF-trädet och sparar träffarna
samt noterar deras antal. I nästa steg genereras sidor och menyer som
också innehåller information om antal poster i underliggande
noder. Därigenom kan användare direkt var i bläddringssystemet det
finns information att hämta.
.bp
.so exempel.m4
.so treefiles.m4
