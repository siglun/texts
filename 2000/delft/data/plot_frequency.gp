set terminal pbm medium color
set output 'frequency.pbm'
set noclip points
set clip one
set noclip two
set border
set boxwidth
set dummy x,y
set format x "%g"
set format y "%g"
set format z "%g"
set nogrid
set key
set nolabel
set noarrow
set nologscale
set logscale x 10
set logscale y 10
set offsets 0, 0, 0, 0
set nopolar
set angles radians
set noparametric
set view 60, 30, 1, 1
set samples 100, 100
set isosamples 10, 10
set surface
set nocontour
set clabel
set nohidden3d
set cntrparam order 4
set cntrparam linear
set cntrparam levels auto 5
set cntrparam points 5
set size 1,1
set data style points
set function style lines
set xzeroaxis
set yzeroaxis
set tics in
set ticslevel 0.5
set xtics
set ytics
set ztics
set title "" 0,0
set notime
set rrange [-0 : 10]
set trange [-5 : 5]
set urange [-5 : 5]
set vrange [-5 : 5]
set xlabel "Rank" 0,0
set xrange [1 : 1223]
set ylabel "Frequency of use" 0,0
set yrange [4.10976e-06 : 1]
set zlabel "" 0,0
set zrange [-10 : 10]
set autoscale r
set autoscale t
set autoscale xy
set autoscale z
set zero 1e-08
plot "safari_data.text" with lines, "nwi_data.text" with lines
