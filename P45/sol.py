import numpy as np

Ts = np.array([int(n*(n+1)/2) for n in range (256, 100000)])
Ps = np.array([int(n*(3*n-1)/2) for n in range (166, 100000)])
Hs = np.array([int(n*(2*n-1)) for n in range (144, 100000)])

for t in Ts:
    if t in Ps and t in Hs:
        print(t)
        break
