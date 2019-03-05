from ..myutils import numUtils
import numpy as np

primes = numUtils.primesLessThanM[3:]

lastIdx = 1
maxPrime = 0
sum = np.sum(primes[0:lastIdx])
while sum < 10**6:
    sum += primes[lastIdx]
    if sum in primes:
        maxPrime = sum
        print(maxPrime, primes[lastIdx], lastIdx)
    lastIdx += 1
