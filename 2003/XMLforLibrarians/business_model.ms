.PS 4.0 3.0
arrowhead = 7
boxwid = 1.5
BIGBOX: box invis wid 4.0 ht 3.0
A: box wid 1.2 "People" with .e at BIGBOX.w
B: box wid 1.2 "Stuff"  with .w at BIGBOX.e
C: box wid 1.2 "Deals"  with .n at BIGBOX.s

arrow -> chop from 1/3 of the way between A.ne and A.se to 1/3 of the way between B.nw and B.sw

box "Make" invis with .s at last arrow .c

arrow <- chop from 2/3 of the way between A.ne and A.se to 2/3 of the way between B.nw and B.sw

box invis "Is used by" with .n at last arrow .c

arrow -> chop "Do" ljust above from A.s to C.n 
arrow -> chop "About" rjust above from C.n to B.s
.PE
