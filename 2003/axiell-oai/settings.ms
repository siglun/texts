.mso a4.tmac
.nr FF 0
.nr FL 14.3c
.nr PO 3.0c
.nr PI 0.7c
.de normal
.nr VS 14
.nr PS 12
.nr LL 15c
..
.de fine-print
.nr VS 12
.nr PS 10
.nr LL 14.3c
..
.de small
.vs 12
.ps 10
..
.normal
.de BT
.ie \\n[PN]==1 \{\
.       if d RCSID \{\
.               tl '''\\s-4\\*[RCSID]\\s+4'
.       \}
.\}
.el \{\
.       ie o .tl \\*[pg*OF]
.       el .tl  \\*[pg*OF]
.\}
..
.de smallcaps
.nr .sc.ps (\\n[.s]*75/100)
.nr .cap.PS \\n[.s]
.char a \\s[\\n[.sc.ps]]A\\s[\\n[.cap.PS]]
.char b \\s[\\n[.sc.ps]]B\\s[\\n[.cap.PS]]
.char c \\s[\\n[.sc.ps]]C\\s[\\n[.cap.PS]]
.char d \\s[\\n[.sc.ps]]D\\s[\\n[.cap.PS]]
.char e \\s[\\n[.sc.ps]]E\\s[\\n[.cap.PS]]
.char f \\s[\\n[.sc.ps]]F\\s[\\n[.cap.PS]]
.char g \\s[\\n[.sc.ps]]G\\s[\\n[.cap.PS]]
.char h \\s[\\n[.sc.ps]]H\\s[\\n[.cap.PS]]
.char i \\s[\\n[.sc.ps]]I\\s[\\n[.cap.PS]]
.char j \\s[\\n[.sc.ps]]J\\s[\\n[.cap.PS]]
.char k \\s[\\n[.sc.ps]]K\\s[\\n[.cap.PS]]
.char l \\s[\\n[.sc.ps]]L\\s[\\n[.cap.PS]]
.char m \\s[\\n[.sc.ps]]M\\s[\\n[.cap.PS]]
.char n \\s[\\n[.sc.ps]]N\\s[\\n[.cap.PS]]
.char o \\s[\\n[.sc.ps]]O\\s[\\n[.cap.PS]]
.char p \\s[\\n[.sc.ps]]P\\s[\\n[.cap.PS]]
.char q \\s[\\n[.sc.ps]]Q\\s[\\n[.cap.PS]]
.char r \\s[\\n[.sc.ps]]R\\s[\\n[.cap.PS]]
.char s \\s[\\n[.sc.ps]]S\\s[\\n[.cap.PS]]
.char t \\s[\\n[.sc.ps]]T\\s[\\n[.cap.PS]]
.char u \\s[\\n[.sc.ps]]U\\s[\\n[.cap.PS]]
.char v \\s[\\n[.sc.ps]]V\\s[\\n[.cap.PS]]
.char w \\s[\\n[.sc.ps]]W\\s[\\n[.cap.PS]]
.char x \\s[\\n[.sc.ps]]X\\s[\\n[.cap.PS]]
.char y \\s[\\n[.sc.ps]]Y\\s[\\n[.cap.PS]]
.char z \\s[\\n[.sc.ps]]Z\\s[\\n[.cap.PS]]
.char å \\s[\\n[.sc.ps]]Å\\s[\\n[.cap.PS]]
.char ä \\s[\\n[.sc.ps]]Ä\\s[\\n[.cap.PS]]
.char ö \\s[\\n[.sc.ps]]Ö\\s[\\n[.cap.PS]]
.char ü \\s[\\n[.sc.ps]]Ü\\s[\\n[.cap.PS]]
..
.de /smallcaps
.rchar a b c d e f g h i j k l m n o p q r s t u v w x y z å ä ö ü
..
