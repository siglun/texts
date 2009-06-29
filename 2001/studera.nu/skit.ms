
.TL
studera.se cascading style sheet

.LP
.RD
\s-1Sigfrid Lundberg
Senast ndrad: 1999-03-03
.DE



.LP
.LP
Följande style-sheet innehåller vad jag kan se som varandes nödvändigtför att formattera en sida med studie- eller kursinformation förSTUDERA.SE.  Jag har också gjort ett exempel påen sida\**
.FS
exempel.html
.FE
 formatterad med detta style-sheet. I övrigt skulle jagvilja poängtera följande:
Använd HTML-taggar i deras generiska mening.
Den programvara som skall användas för att formattera pappersversionen avstudiehandboken kan inte hantera "nested tables" (dvs tabeller i tabeller).

.ID
BODY {
background-color: white;
font-size:      12pt;
font-weight:    normal;
word-spacing:   normal;
letter-spacing: normal;
font-family:    Arial, Helvetica, sans-serif;
font-size-adjust:.48;
margin-left: 10%; 
margin-right: 5%;
}
P {	font-size: 12pt;
text-align: left;
}
P.abstract, P.caption {	font-size: 10pt;
text-align: left;
margin-left: +10%;
margin-right: +10%;
}
P.docinfo {
font-size: 12pt;
text-align: left;
margin-left: +60%;
margin-right: -5%;
} 
P.authors {
font-size: 12pt;
text-align: center;
} 
H1.title {
font-size: 18pt;
font-weight: bold;
text-align: center;
}
H1 {
font-size: 14pt;
font-weight: bold;
margin-left: -5%; 
}
H2, H3, H4 {
font-size: 14pt;
font-style: italic;
}
TABLE, TBODY, TR, TD, TH, CAPTION {
text-align: left;
background-color: "#FFFFEE";
font-size:      12pt;
word-spacing:   normal;
letter-spacing: normal;
font-family:    Arial, Helvetica, sans-serif;
font-size-adjust:.48;
}
TH, CAPTION {font-weight: bold;
}
TD.tocnum {
font-weight: bold;
font-size: 12pt;
text-align: right;
}
TD.tocitem {
font-size: 12pt;
text-align: left;
}
.DE

.LP
.RD
\s-1Detta är ett XML-dokumentValidera mot xhtml1-transitional DTD\**
.FS
http://validator.w3.org/check?uri=http://www.lub.lu.se/~siglun/studera.se/studera_css.html
.FE

.DE


