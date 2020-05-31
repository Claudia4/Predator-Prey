import numpy as np

# number of different parameter settings
num = 14

# allocate arrays to store the values of the parameters
a = np.empty(num, dtype=float)
b = np.empty(num, dtype=float)
c = np.empty(num, dtype=float)
d = np.empty(num, dtype=float)
e = np.empty(num, dtype=float)
f = np.empty(num, dtype=float)
g = np.empty(num, dtype=float)
h = np.empty(num, dtype=float)

# first setting with a = 2.0
# with this parameters, the population sizes will eventually end up in a fix point
a[0], b[:], c[:], d[:], e[:], f[:], g[:], h[:] = 2.0, -0.75, 0.4, -0.4, -0.02, -0.03, 0, 0

# by increasing parameter 'a' a bit, we will get oscillating patterns:
# first setting with a = 2.1
a[1] = 2.1

# first setting with a = 2.2
a[2] = 2.2

# first setting with a = 2.3
a[3] = 2.3

# first setting with a = 2.4
a[4] = 2.4

# first setting with a = 2.5
a[5] = 2.5


# we can use our setting from above and set the paramaters g and h to small constants and it will still
# yield oscillating population sizes

# with this parameters, the population sizes will eventually end up in a fix point
a[6], g[6:], h[6:] = 2.0, 0.0002, -0.0002

# by increasing parameter 'a' a bit, we will get oscillating patterns:
# first setting with a = 2.1
a[7] = 2.1

# first setting with a = 2.2
a[8] = 2.2

# first setting with a = 2.3
a[9] = 2.3

# first setting with a = 2.4
a[10] = 2.4

# first setting with a = 2.5
a[11] = 2.5

# if we do not restrict to positive population sizes (in other settings we might not think about populations
# of living entities), we get even nicer plots

a[12], b[12:], c[12:], d[12:], e[12:], f[12:], g[12:], h[12:] = 0.49, -0.4, 0.73, -0.5, 0.01, 0.01, 0, 0

# set a = 0.55
a[13] = 0.55


T = 20000
osc_len = 100

# allocate arrays to store the population sizes of prey (x) and predators (y) in every time step
x = np.empty((num, T), dtype=float)
y = np.empty((num, T), dtype=float)
# initialize population sizes
x[:, 0] = 40
y[:, 0] = 10

# in the last setting, we want to swap the roles of x and y:
x[12:, 0] = 10
y[12:, 0] = 40


# generate sequences
for t in range(T-1):
    x[:, t+1] = x[:, t] + a*x[:, t] + b*y[:, t] + e*x[:, t]*x[:, t] + g*x[:, t]*y[:, t]
    y[:, t+1] = y[:, t] + c*x[:, t] + d*y[:, t] + f*y[:, t]*y[:, t] + h*x[:, t]*y[:, t]


def print_means(osc_len, k):
    """
    Print the means of the last osc_len entries of x and y, respectively.
    :param osc_len: length of the interval that is used to compute the mean (integer)
    :param k: number of the setting (integer)
    """
    print("Mean of x: " + str(np.mean(x[0, (T-osc_len):T])))
    print("Mean of y: " + str(np.mean(y[0, (T-osc_len):T])))



"Write the data of x and y into separate files for plotting."
def plot_separate():
    with open('x.dat', 'w') as f:
        for t in range(T):
            f.write(" ".join([str(t),str(x[0, t])])+"\n")
    with open('y.dat', 'w') as f:
        for t in range(T):
            f.write(" ".join([str(t),str(y[0, t])])+"\n")


def plot_together(k):
    """
    Write the data of x and y into a joint file for plotting.
    :param k: number of the setting (integer)
    """
    with open('data{}.dat'.format(str(k)), 'w') as file:
        for t in range(T-osc_len, T):
            file.write(" ".join([str(t),str(x[k, t]),str(y[k, t])])+"\n")


for i in range(6):
    plot_together(i)
    print("Setting 1_" + str(i))
    print_means(osc_len, i)

for i in range(6, 12):
    plot_together(i)
    print("Setting 2_" + str(i))
    print_means(osc_len, i)

for i in range(12, 14):
    plot_together(i)
    print("Setting 3_" + str(i))
    print_means(osc_len, i)


# print the means of x and y of the last osc_len to .dat files
# for parameter setting 1:
with open('mean_setting1.dat', 'w') as f:
    for k in range(6):
        x_mean = np.mean(x[k, (T - osc_len):T])
        y_mean = np.mean(y[k, (T - osc_len):T])
        f.write(" ".join([str(a[k]), str(x_mean), str(y_mean)])+"\n")

# Increasing the value of a will cause the mean population of the prey to grow at a rate of roughly of 40
# with respect to a. The population size of the predators remains nearly static, it decreases slightly.


# for parameter setting 2:
with open('mean_setting2.dat', 'w') as f:
    for k in range(6, 12):
        x_mean = np.mean(x[k, (T - osc_len):T])
        y_mean = np.mean(y[k, (T - osc_len):T])
        f.write(" ".join([str(a[k]), str(x_mean), str(y_mean)])+"\n")

# increasing the value of a will cause a similar effect as for parameter setting 1. Compared to the first plot, the
# the curves are slightly flattened.
