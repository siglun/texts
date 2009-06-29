.KF
.LP
.vs 12
.ps 10
Tabell 1. Obligatorisk information i Safaridatabasen.
Notera att SAFARIroboten inte l�gger n�gon vikt vid
huruvuda man anv�nder versaler eller gemener.
.TS
allbox expand tab(;);
lb10 lb10
l10 l10 .
Typ av information;Motsvarande DC metadata
Resursens namn;DC.Title
Reursens typ;T{
DC.Type
.br
Kontrollerad vokabul�r anv�nds*
T}
Upphovsman;T{
.na
Minst en av f�ljande kr�vs
.br
DC.Creator
DC.Creator.PersonalName
DC.Creator.CorporateName
T}
Upphovsmannens adress;T{
.na
Minst en av f�ljande kr�vs
.br
DC.Creator.Address
DC.Creator.PersonalName.Address
DC.Creator.CorporateName.Address
T}
F�rl�ggare;T{
.na
Minst en av f�ljande kr�vs
.br
DC.Publisher
DC.Publisher.PersonalName
DC.Publisher.CorporateName
T}
Beskrivning av objekt;DC.Description
Klassning enligt CERIF;T{
DC.Subject med SCHEME=CERIF\(dg
T}
Identifierare/URL;DC.Identifier
M�lgrupp;T{
.na
SAFARI.TargetGroup
.br
F�ljande vokabul�r anv�nds:
.br
Public (allm�nheten/skola),
.br
Industry (f�retag/organisationer),
.br
Scientific (forskare) och 
.br
Students (h�gskolestuderande)
T}
Dokumentets spr�k;DC.Language (SCHEME=ISO639-1)
.TE
.IP *
\s-1http://sunsite.berkeley.edu/Metadata/structuralist.html
http://safari.hsv.se/metadata/vvv/resource_type.tree
.IP \(dg
\s-1http://safari.hsv.se/metadata/vvv/cerif.tree

.KE