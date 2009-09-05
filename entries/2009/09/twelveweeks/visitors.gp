#!/usr/bin/gnuplot -persist
#
# set terminal x11 
# set output
GNUTERM = "x11"

set terminal pos
set out "usage.ps"

set nokey
set xlab  "Time (weeks)"
set ylab  "Average time in site (seconds)"
set y2lab "Number of visitors per week"
set y2tics
set y2r [0:25]

set yr [0:1000]
plot 'graph_data.txt' using 1:3 with l ,\
     'graph_data.txt' using 1:(40*$2) w l lt 3





