.RD
(A)
.DE
.PS 4.0 3.0
.ps 10
.vs 12
BIGBOX: box invis wid 3 ht 1.5
A: box invis wid 2.2 "Name-geographic" "(58)" with .e at BIGBOX.w
B: box invis wid 2.2 "history-origin-place" "(5022)" with .w at BIGBOX.ne
C: box invis wid 2.2 "history-provenance-place" "(5028)" with .w at BIGBOX.e
D: box invis wid 2.2 "history-acquisision-place" "(5042)" with .w at BIGBOX.se
arrow <- chop from A.e to B.w
arrow <- chop from A.e to C.w 
arrow <- chop from A.e to D.w
.PE
.LP
.RD
(B)
.DE
.PS 5.5 4.0
.ps 10
.vs 12
BOX1: box invis wid 3 ht 1
A1: box invis wid 2.2 "any (1016)" with .e at BOX1.w
B1: box invis wid 2.2 "contributions" "from other" "search attributes" \
	with .w at BOX1.ne
B2: box invis wid 2.2 "history (5019)" \
	with .w at BOX1.se
line <- from A1.e to B1.w chop
line <- from A1.e to B2.w chop
BOX2: box invis wid 3 ht 2 with .w at B2.se
C1: box invis wid 2.2 "history-origin" "(5019)" \
	with .w at BOX2.ne
C2: box invis wid 2.4 "  history-provenance" "(5026)" \
	with .w at BOX2.e
C3: box invis wid 2.4 "  history-acquisision" "(5040)" \
	with .w at BOX2.se
line <- from B2.e to C1.w chop
line <- from B2.e to C2.w chop
line <- from B2.e to C3.w chop
.PE
.LP
.RD
(C)
.DE
.PS 4.0 5.0
.ps 10
.vs 12
BOX1: box invis wid 3 ht 1.5
BOX2: box invis wid 3 ht 1.5 with .nw at BOX1.sw
A1: box invis wid 2.2 "history-origin" "(5019)" \
	with .e at BOX2.nw
B1: box invis wid 2.2 "history-origin-text" "(5021)" \
	with .w at BOX1.ne
B2: box invis wid 2.2 "history-origin-place" "(5022)" \
	with .w at BOX1.e
B3: box invis wid 2.2 "history-origin-person" "(5023)" \
	with .w at BOX1.se
B4: box invis wid 2.2 "history-origin-name" "(5024)" \
	with .w at BOX2.e
B5: box invis wid 2.2 "history-origin-date" "(5025)" \
	with .w at BOX2.se
line <- from A1.e to B1.w chop
line <- from A1.e to B2.w chop
line <- from A1.e to B3.w chop
line <- from A1.e to B4.w chop
line <- from A1.e to B5.w chop
.PE
