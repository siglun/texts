.SH
Appendix C: VVV  - Visuellt Vokabul�rsVerktyg f�r WWW
.LP
VVV har utvecklats som en del i Safariprojektet
d�r det anv�nds f�r att ge anv�ndare av s�v�l metadata- och
registringstj�nsten som s�ktj�nsten st�d i anv�ndningen av
kontrollerade vokabul�rer.
Det medf�ljer fyra "tree-filer"
.KF
.TS
allbox tab(;);
lb10 lb10
l10 l10 .
Vokabul�rsfil;Beskrivning
lucat.tree;T{
.na
Lucat inneh�ller institutionsnamn och
liknande f�r Lunds universitet
T}
cerif.tree;T{
.na
Cerif �r ett klassifikationssystem f�r
forskningsinformation utvecklat och
underh�llet av EU-kommisionen
T}
tgn.tree;T{
.na
TGN �r en tesaurus f�r geografiska namn*.
Denna version inneh�ller endast sj�lvst�ndiga
staters namn p� svenska och engelska, st�lls
till f�rfogande av Lunds universitet.
T}
resource_type.tree;T{
.na
En kontrollerad vokabul�r f�r resurstyper, vidarutvecklad
fr�n Roy Tennants f�rslag\(dg.
T}
.TE
.IP *
\s-1http://www.ahip.getty.edu/vocabulary/tgn.html
.IP \(dg
\s-1http://sunsite.berkeley.edu/Metadata/structuralist.html

.KE
.SH
Licensbest�mmelser f�r VVV
.LP
VVV �r inte public domain. Det �r emellertid fritt fram att anv�nda
och �ven vidardistribuera denna programvara, givet att f�ljande notis
f�ljer med i alla de delar d�r den f�r n�rvarande f�rekommer:
.BD
\f(CRCopyright (C) H�gskoleverket och Lunds universitetsbibliotek.

Denna version av klassifikationssytemet CERIF, och andra
vokabul�rer med tillh�rande programvara g�rs h�rmed
tillg�nglig f�r anv�ndning inom Safariprojektet, associerade
tj�nster inom forskningsinformationsomr�det och f�r skapande
av WWW-baserade metadatatj�nster i allm�nhet.  Varken
H�gskoleverket eller Lunds universitetsbibliotek l�mnar n�gon
garanti f�r distributionens komponenter eller funktioner och
f�rbinder sig inte heller att underh�lla dem.\fP
.DE
.SH
Installation av VVV
.LP
Verktyget kr�ver en WWW-server som st�djer CGI och �r skrivet i
programmeringsspr�ket perl.  Med undantag f�r perls standardbibliotek
�r alla n�dv�ndiga inkluderade.  Javascript och ett formul�r,
searchform.html som demostrar anv�ndningen medf�ljer. Paketet m�ste
ligga i ett directory som till�ter exekvering av CGI-skript, och
searchform.html utnyttjar dessutom server-side include. Paketet �r
testat under Linux, SunOS och Solaris med NCSA och Apache WWWservrar.
Det b�r inte vara sv�rt att portera till andra servrar och
operativsystem.
.PP
Denna version av vvv distribueras med ett grafikbibliotek gd, som �r
till f�r snabb produktion av gif-bilder, och ett CGI-program (skrivet
i C) f�r att g�ra texter i form av bilder.
Packa upp paketet gd.tar och bygg giftext.cgi.
Installera i katalogen images i vvv-katalogen.
En demo av denna funktion finns tillg�nglig p� n�tet\**.
.FS
http://safari.hsv.se/metadata/vvv/searchform.html
.FE
.SH
Syntax f�r Safariprojektets TREE-filer
.LP
Bakgrunden �r den att det beh�vdes ett s�tt att lagra CERIF som gjorde
det enkelt att underh�lla (utan utveckling av ny programvara),
samtidigt som det skulle vara enkelt att l�sa f�r programmet som g�r
det d�r lilla f�nstret.  Grammatiken f�r f�r filformatet �r (ungef�r)
som f�ljer (i det r�liga beskrivningsformatet BNF):
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
Se vocabulary.js f�r hur de anropas av showTerms.pl.
.SH
Den framtida utvecklingen av vvv och filformatet tree
.LP
Vi har med detta l�st ett par problem, men verktyget i sin nuvarande
skall inte anv�ndas f�r mera omfattande termlistor, tesauri eller
klassifikationssystem. D�remot �r tree-formatet enkelt att anv�nda som
utbytesformat �ven f�r stora vokabul�rer. En ny version av verktyget
finns idag som �r kopplad till ett databassystem.
