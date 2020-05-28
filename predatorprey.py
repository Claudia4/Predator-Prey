import numpy as np


a = 1.0
b = 1.0
c = 1.0
d = 1.0
e = 1.0
f = 1.0
g = 0.0
h = 0.0

T = 10
osclen = 20
x =  np.empty(T, dtype = float)
y = np.empty(T, dtype = float)
x[0] = 1.0
y[0] = 0.5

for t in range(T-1):
    x[t+1] = x[t] + a*x[t] + b*y[t] + e*x[t]*x[t] + g*x[t]*y[t]
    y[t+1] = y[t] + c*x[t] + d*y[t] + f*y[t]*y[t] + h*x[t]*y[t]

print(x)
print(y)

"Print the means of the last osclen entries of x and y, respectively."
def print_means(osclen):
    print("Mean of x: " + str(np.mean(x[(T-osclen):T])))
    print("Mean of y: " + str(np.mean(y[(T-osclen):T])))

"Write the data of x and y into separate files for plotting."
def plot_separate():
    with open('x.dat', 'w') as f:
        for t in range(T):
            f.write(" ".join([str(t),str(x[t])])+"\n")
    with open('y.dat', 'w') as f:
        for t in range(T):
            f.write(" ".join([str(t),str(y[t])])+"\n")

"Write the data of x and y into a joint file for plotting."
def plot_together():
    with open('data.dat', 'w') as f:
        for t in range(T):
            f.write(" ".join([str(t),str(x[t]),str(y[t])])+"\n")

plot_together()
print_means(osclen)
