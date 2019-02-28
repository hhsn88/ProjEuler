import numpy as np
import heapq

max, pMax = 0, 0
for p in range(10, 1000):
    print(p)
    triplets = np.array([], np.int32)
    for a in range(1, int(p / 2)):
        for b in range(1, int(p / 2)):
            c = p - a - b
            triplet = heapq.nlargest(3, [a,b,c])
            if triplet[0] not in triplets and triplet[1]**2 + triplet[2]**2 == triplet[0]**2:
                triplets = np.append(triplets, triplet[0])
    if len(triplets) > max:
        max, pMax = len(triplets), p
        print(max, p)

print(pMax)