#!/usr/bin/gnuplot
# 
# Plots all the graphs in this entry
# Author Sigfrid Lundberg (siggelundberg@gmail.com)
# $Id$

set fit noerrorvariables
set term png

#
# Searches for a kassa a kasse
#
set xlabel "Time (weeks)"
set ylabel "Search interest"
set out "kassa_series.png"
plot 'kassa.txt' using 2 w l t "a kassa (sv)",'kassa.txt' using 3 w l t "a kasse (da)"

set ylabel "Search interest"
set xlabel "Search interest"
set out "kassa.png"
plot 'kassa.txt' using 2:3 with p t "a kasse (da) against a kassa (sv)",\
     0.132001*x+21.08246 w l

#
# Searches for a kasse skilsmisse
#
set xlabel "Time (weeks)"
set ylabel "Search interest"
set out "divorce-da-series.png"
plot 'divorce-da.txt' using 2 w l t "a kasse",\
     'divorce-da.txt' using 3 w l t "skilsmisse"

set ylabel "Search interest"
set xlabel "Search interest"
set out "divorce-da.png"
plot 'divorce-da.txt' using 2:3 with p t "a kasse against skilsmisse",\
     0.34236*x+14.19345 w l

#
# Searches for a kassa skilsmässa
#
set xlabel "Time (weeks)"
set ylabel "Search interest"
set out "divorce-sv-series.png"
plot 'divorce-sv.txt' using 2 w l t "a kassa",\
     'divorce-sv.txt' using 3 w l t "skilsmässa"

set ylabel "Search interest"
set xlabel "Search interest"
set out "divorce-sv.png"
plot 'divorce-sv.txt'    using 2:3 with p t "a kassa against skilsmässa",\
     -0.040542*x+10.403176 w l

#
#    EOF
