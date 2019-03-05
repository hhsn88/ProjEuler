import numpy as np

pentas = np.array([int(n*(3*n-1)/2) for n in range(1,10001)])

D = 0
pIdx = 0
while True:
    for i in range(pIdx+1, len(pentas)-1):
        if ((pentas[i] + pentas[pIdx]) in pentas) and \
           ((pentas[i] - pentas[pIdx]) in pentas): 
            D = pentas[i] - pentas[pIdx]
            break
    if D > 0:
        print(D, pentas[i], pentas[pIdx])            
        break
    pIdx += 1
    if pIdx == len(pentas)-1:
        break
