.SH
Appendix C: VVV  - Visuellt VokabulärsVerktyg för WWW
.LP
VVV har utvecklats som en del i Safariprojektet
där det används för att ge användare av såväl metadata- och
registringstjänsten som söktjänsten stöd i användningen av
kontrollerade vokabulärer.
Det medföljer fyra "tree-filer"
.KF
.TS
allbox tab(;);
lb10 lb10
l10 l10 .
Vokabulärsfil;Beskrivning
lucat.tree;T{
.na
Lucat innehåller institutionsnamn och
liknande för Lunds universitet
T}
cerif.tree;T{
.na
Cerif är ett klassifikationssystem för
forskningsinformation utvecklat och
underhållet av EU-kommisionen
T}
tgn.tree;T{
.na
TGN är en tesaurus för geografiska namn*.
Denna version innehåller endast självständiga
staters namn på svenska och engelska, ställs
till förfogande av Lunds universitet.
T}
resource_type.tree;T{
.na
En kontrollerad vokabulär fär resurstyper, vidarutvecklad
från Roy Tennants förslag\(dg.
T}
.TE
.IP *
\s-1http://www.ahip.getty.edu/vocabulary/tgn.html
.IP \(dg
\s-1http://sunsite.berkeley.edu/Metadata/structuralist.html

.KE
.SH
Licensbestämmelser för VVV
.LP
VVV är inte public domain. Det är emellertid fritt fram att använda
och även vidardistribuera denna programvara, givet att följande notis
följer med i alla de delar där den för närvarande förekommer:
.BD
\f(CRCopyright (C) Högskoleverket och Lunds universitetsbibliotek.

Denna version av klassifikationssytemet CERIF, och andra
vokabulärer med tillhörande programvara görs härmed
tillgänglig för användning inom Safariprojektet, associerade
tjänster inom forskningsinformationsområdet och för skapande
av WWW-baserade metadatatjänster i allmänhet.  Varken
Högskoleverket eller Lunds universitetsbibliotek lämnar någon
garanti för distributionens komponenter eller funktioner och
förbinder sig inte heller att underhålla dem.\fP
.DE
.SH
Installation av VVV
.LP
Verktyget kräver en WWW-server som stödjer CGI och är skrivet i
programmeringsspråket perl.  Med undantag för perls standardbibliotek
är alla nödvändiga inkluderade.  Javascript och ett formulär,
searchform.html som demostrar användningen medföljer. Paketet måste
ligga i ett directory som tillåter exekvering av CGI-skript, och
searchform.html utnyttjar dessutom server-side include. Paketet är
testat under Linux, SunOS och Solaris med NCSA och Apache WWWservrar.
Det bör inte vara svårt att portera till andra servrar och
operativsystem.
.PP
Denna version av vvv distribueras med ett grafikbibliotek gd, som är
till för snabb produktion av gif-bilder, och ett CGI-program (skrivet
i C) för att göra texter i form av bilder.
Packa upp paketet gd.tar och bygg giftext.cgi.
Installera i katalogen images i vvv-katalogen.
En demo av denna funktion finns tillgänglig på nätet\**.
.FS
http://safari.hsv.se/metadata/vvv/searchform.html
.FE
.SH
Syntax för Safariprojektets TREE-filer
.LP
Bakgrunden är den att det behövdes ett sätt att lagra CERIF som gjorde
det enkelt att underhålla (utan utveckling av ny programvara),
samtidigt som det skulle vara enkelt att läsa för programmet som gör
det där lilla fönstret.  Grammatiken för för filformatet är (ungefär)
som följer (i det räliga beskrivningsformatet BNF):
.ID
\f(CRtree-file::=*(linkage|name)
linkage::=lable";"relation"="lable eol
name::=lable";title=iso:nodename
iso::=<language code according to ISO639>
lable::="root"|[SCHEME"."]<Unique lable for node>
relation::="parent"|"sibling"|"broader"|"narrower"|"mapping"
;Only parent used currently in Safari
nodename::=<Description of node in the language at hand>
eol::=CRLF | LF\fP
.DE
Se vocabulary.js för hur de anropas av showTerms.pl.
.SH
Den framtida utvecklingen av vvv och filformatet tree
.LP
Vi har med detta löst ett par problem, men verktyget i sin nuvarande
skall inte användas för mera omfattande termlistor, tesauri eller
klassifikationssystem. Däremot är tree-formatet enkelt att använda som
utbytesformat även för stora vokabulärer. En ny version av verktyget
finns idag som är kopplad till ett databassystem.
