.PS 5.0 6.0
boxwid    = 1.5
circlerad = 1.0
#boxht  = 1.5

BIGBOX0: box invis wid 4.0 ht 3.0

TAG0: box "html" with .c at BIGBOX0.w
TAG1: box "head" with .c at BIGBOX0.ne
TAG2: box "body" with .c at BIGBOX0.se

arrow -> chop from TAG0 to TAG1
arrow -> chop from TAG0 to TAG2

BIGBOX1: box invis wid 4.0 ht 3.0 with .w at BIGBOX0.se

TAG3: box "img" with .c at BIGBOX1.ne
TAG4: box "h1"  with .c at BIGBOX1.e
TAG5: box "p"   with .c at BIGBOX1.se

arrow -> chop from TAG0 to TAG1
arrow -> chop from TAG0 to TAG2

arrow -> chop from TAG2 to TAG3
arrow -> chop from TAG2 to TAG4
arrow -> chop from TAG2 to TAG5

BIGBOX2: box invis wid 4.0 ht 3.0 with .w at BIGBOX1.se

TAG6: box "\"text\"" with .c at BIGBOX2.ne
TAG7: box "a"        with .c at BIGBOX2.e
TAG8: box "\"text\"" with .c at BIGBOX2.se

arrow -> chop from TAG5 to TAG6
arrow -> chop from TAG5 to TAG7
arrow -> chop from TAG5 to TAG8


.PE