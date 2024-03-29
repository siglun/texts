#!/usr/bin/perl

print <<"ESHEET";
Content-type: text/css

BODY {
	background-color: white;
	font-size:      12pt;
        font-weight:    normal;
        word-spacing:   normal;
        letter-spacing: normal;
        font-family:    Arial, Helvetica, sans-serif;
        font-size-adjust:       .48;
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
	background-color: "#EEEEEE";
        font-size:      12pt;
        word-spacing:   normal;
        letter-spacing: normal;
        font-family:    Arial, Helvetica, sans-serif;
        font-size-adjust: .48;
}

TH, CAPTION {
	font-weight: bold;
	background-color: "#DDDDDD";
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

ESHEET




