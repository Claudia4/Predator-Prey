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
x =  np.empty(T, dtype = float)
y = np.empty(T, dtype = float)
x[0] = 1.0
y[0] = 0.5

for t in range(T-1):
    x[t+1] = x[t] + a*x[t] + b*y[t] + e*x[t]*x[t] + g*x[t]*y[t]
    y[t+1] = y[t] + c*x[t] + d*y[t] + f*y[t]*y[t] + h*x[t]*y[t]

print(x)
print(y)

with open('x.dat', 'w') as f:
    for t in range(T):
        f.write(" ".join([str(t),str(x[t])])+"\n")
with open('y.dat', 'w') as f:
    for t in range(T):
        f.write(" ".join([str(t),str(y[t])])+"\n")
