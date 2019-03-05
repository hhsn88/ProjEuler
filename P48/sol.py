import numpy as np

result = 0
for i in range(1,1001):
    result += np.remainder(i**i, 10**10)

print(result%(10**10))