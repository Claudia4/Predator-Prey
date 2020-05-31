do for [t=0:5] {
    set terminal qt t
    set multiplot layout 1,2 title "a=2.".t.", b=-0.75, c=0.4, d=-0.4, e=-0.02, f=-0.03, g=0, h=0" rowsfirst downwards
    unset title
    set title "Temporal development"
    set xlabel "Time step"
    set ylabel "Number of individuals"
    set xrange [19900:20000]
    set yrange [-5:150]
    plot 'data'.t.'.dat' using 1:2 title "x" with lines, 'data'.t.'.dat' using 1:3 title "y" with lines
    unset title
    unset xrange
    unset yrange
    unset xlabel
    unset ylabel

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
}

do for [t=0:5] {
    set terminal qt {t+6}
    set multiplot layout 1,2 title "a=2.".t.", b=-0.75, c=0.4, d=-0.4, e=-0.02, f=-0.03, g=0.0002, h=-0.0002" rowsfirst downwards
    unset title
    set title "Temporal development"
    set xlabel "Time step"
    set ylabel "Number of individuals"
    set xrange [19900:20000]
    set yrange [-5:150]
    plot 'data'.t.'.dat' using 1:2 title "x" with lines, 'data'.t.'.dat' using 1:3 title "y" with lines
    unset title
    unset xrange
    unset yrange
    unset xlabel
    unset ylabel

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
}

# TODO: add last two plots