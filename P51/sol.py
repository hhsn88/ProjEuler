import numpy as np
from ..myutils.numUtils import primesLessThanM
import itertools 

lastdigits = [1, 3, 7, 9]
for numdigits in range(4, 4+1):
    primes = np.array([p for p in primesLessThanM if len(str(p)) == numdigits])
    checkedConsts = []
    for pIdx in range(0, len(primes)-8):
        for r in range(1, len(primes[pIdx]-2)):
            for comb in itertools.combinations(range(len(primes[pIdx])), r):
                digits = [int(i) for i in str(primes[pIdx])]
                const = digits.remove(comb)