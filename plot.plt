# todo: name x and y as predator/prey

# Plot the temporal development
set terminal qt 0
set title "Temporal development"
# set xrange [0:4]
# set yrange [0:600]
set xlabel "Timestep i"
set ylabel "Number of animals"
plot 'data.dat' using 1:2 title "x" with lines, 'data.dat' using 1:3 title "y" with lines

# Phase plot x against y
set terminal qt 1
set title "Phase plot"
set xlabel "Number of x"
set ylabel "Number of y"
plot 'data.dat' using 2:3 title "" with lines
