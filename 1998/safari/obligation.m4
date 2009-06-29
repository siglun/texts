.KF
.LP
.vs 12
.ps 10
Tabell 1. Obligatorisk information i Safaridatabasen.
Notera att SAFARIroboten inte lägger någon vikt vid
huruvuda man använder versaler eller gemener.
.TS
allbox expand tab(;);
lb10 lb10
l10 l10 .
Typ av information;Motsvarande DC metadata
Resursens namn;DC.Title
Reursens typ;T{
DC.Type
.br
Kontrollerad vokabulär används*
T}
Upphovsman;T{
.na
Minst en av följande krävs
.br
DC.Creator
DC.Creator.PersonalName
DC.Creator.CorporateName
T}
Upphovsmannens adress;T{
.na
Minst en av följande krävs
.br
DC.Creator.Address
DC.Creator.PersonalName.Address
DC.Creator.CorporateName.Address
T}
Förläggare;T{
.na
Minst en av följande krävs
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
Målgrupp;T{
.na
SAFARI.TargetGroup
.br
Följande vokabulär används:
.br
Public (allmänheten/skola),
.br
Industry (företag/organisationer),
.br
Scientific (forskare) och 
.br
Students (högskolestuderande)
T}
Dokumentets språk;DC.Language (SCHEME=ISO639-1)
.TE
.IP *
\s-1http://sunsite.berkeley.edu/Metadata/structuralist.html
http://safari.hsv.se/metadata/vvv/resource_type.tree
.IP \(dg
\s-1http://safari.hsv.se/metadata/vvv/cerif.tree

.KE