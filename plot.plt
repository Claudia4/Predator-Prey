##### plot first parameter setting
do for [t=0:5] {
    set term png
    set out "parameter_setting_1_".t.".png"
    set xtics rotate
    set multiplot layout 1,2 title "a=2.".t.", b=-0.75, c=0.4, d=-0.4, e=-0.02, f=-0.03, g=0, h=0, x[0]=40, y[0]=10" rowsfirst downwards
    unset title

    # plot temporal development of the population sizes
    set title "Temporal development"
    set xlabel "Time step"
    set ylabel "Number of individuals"
    set xrange [19950:20000]
    set yrange [-5:150]
    plot 'data'.t.'.dat' using 1:2 title "Prey" with lines, 'data'.t.'.dat' using 1:3 title "Predator" with lines

    unset title
    unset xrange
    unset yrange
    unset xlabel
    unset ylabel

    # plot x (Prey) against y (Predator)
    set title "Phase plot"
    set xlabel "Number of Prey"
    set ylabel "Number of Predators"
    set xrange [60:150]
    set yrange [-5:60]
    plot 'data'.t.'.dat' using 2:3 title "" with lines

    unset title
    unset xrange
    unset yrange
    unset xlabel
    unset ylabel

    unset multiplot
    replot
}

# plot second parameter setting (= first setting with g,h != 0)
do for [t=0:5] {
    set term png
    set out "parameter_setting_2_".t.".png"
    set xtics rotate
    set multiplot layout 1,2 title "a=2.".t.", b=-0.75, c=0.4, d=-0.4, e=-0.02, f=-0.03, g=0.0002, h=-0.0002, x[0]=40, y[0]=10" rowsfirst downwards
    unset title

    # plot temporal development of the population sizes
    set title "Temporal development"
    set xlabel "Time step"
    set ylabel "Number of individuals"
    set xrange [19950:20000]
    set yrange [-5:150]
    plot 'data'.(t+6).'.dat' using 1:2 title "Prey" with lines, 'data'.t.'.dat' using 1:3 title "Predator" with lines
    unset title
    unset xrange
    unset yrange
    unset xlabel
    unset ylabel

    # plot x (Prey) against y (Predator)
    set title "Phase plot"
    set xlabel "Number of Prey"
    set ylabel "Number of Predators"
    set xrange [60:150]
    set yrange [-5:60]
    plot 'data'.(t+6).'.dat' using 2:3 title "" with lines

    unset title
    unset xrange
    unset yrange
    unset xlabel
    unset ylabel

    unset multiplot
    replot
}

##### plot third parameter setting with a = 0.49
set term png
set out "parameter_setting_3_0.png"
set xtics rotate
set multiplot layout 1,2 title "a=0.49, b=-0.4, c=0.73, d=-0.5, e=0.01, f=0.01, g=0, h=0, x[0]=10, y[0]=40" rowsfirst downwards
unset title

# plot temporal development of the population sizes
set title "Temporal development"
set xlabel "Time step"
set ylabel "Number of individuals"
set xrange [19900:20000]
set yrange [-20:20]
plot 'data12.dat' using 1:2 title "Prey" with lines, 'data12.dat' using 1:3 title "Predator" with lines
unset title
unset xrange
unset yrange
unset xlabel
unset ylabel

# plot x (Prey) against y (Predator)
set title "Phase plot"
set xlabel "Number of Prey"
set ylabel "Number of Predators"
set xrange [-20:20]
set yrange [-20:20]
plot 'data12.dat' using 2:3 title "" with lines

unset title
unset xrange
unset yrange
unset xlabel
unset ylabel

unset multiplot
replot


##### plot third parameter setting with a = 0.55
set term png
set out "parameter_setting_3_1.png"
set xtics rotate
set multiplot layout 1,2 title "a=0.55, b=-0.4, c=0.73, d=-0.5, e=0.01, f=0.01, g=0, h=0, x[0]=10, y[0]=40" rowsfirst downwards
unset title

# plot temporal development of the population sizes
set title "Temporal development"
set xlabel "Time step"
set ylabel "Number of individuals"
set xrange [19900:20000]
set yrange [-20:20]
plot 'data13.dat' using 1:2 title "Prey" with lines, 'data12.dat' using 1:3 title "Predator" with lines
unset title
unset xrange
unset yrange
unset xlabel
unset ylabel

# plot x (Prey) against y (Predator)
set title "Phase plot"
set xlabel "Number of Prey"
set ylabel "Number of Predators"
set xrange [-20:20]
set yrange [-20:20]
plot 'data13.dat' using 2:3 title "" with lines

unset title
unset xrange
unset yrange
unset xlabel
unset ylabel

unset multiplot
replot

set tics norotate

######################################################################

##### plot influence of a on means of x and y for setting one
set term png
set out "influence_a_setting1.png"
set xlabel "Average number of Prey in iterations 19900 through 20000"
set ylabel "Average number of Predators in iterations 19900 through 20000"
set title "Influence of a on the means of x and y\n during iterations 19900 through 20000 in parameter setting 1"
plot 'mean_setting1.dat' using 1:2 title "Prey" with lines, 'mean_setting1.dat' using 1:3 title "Predator" with lines

##### plot influence of a on the means of x and y for setting two
set term png
set out "influence_a_setting2.png"
set xlabel "Average number of Prey in iterations 19900 through 20000"
set ylabel "Average number of Predators in iterations 19900 through 20000"
set title "Influence of a on the means of x and y\n during iterations 19900 through 20000 in parameter setting 2"
plot 'mean_setting2.dat' using 1:2 title "Prey" with lines, 'mean_setting2.dat' using 1:3 title "Predator" with lines
