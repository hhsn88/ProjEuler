import sys, os
import numpy as np

sys.path.append(os.path.join(os.path.dirname(__file__), '..', 'myutils'))
from numUtils import *

primes = primesLessThanM[3:]

lastIdx = 1
maxPrime = 0
sum = np.sum(primes[0:lastIdx])
while sum < 10**6:
    sum += primes[lastIdx]
    if sum in primes:
        maxPrime = sum
        print(maxPrime, primes[lastIdx], lastIdx)
    lastIdx += 1
