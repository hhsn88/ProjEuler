import numpy as np

smallPrimes = np.array([2,3,5,7,11,13,17,19,23,29,31,37,41,43,47,53,59,61,67,71,73,79,83,89,97])

def primeFactors(n):
    pIdx = 0
    primfac = []
    d = smallPrimes[pIdx]
    while d*d <= n:
        pow = 0
        while (n % d) == 0:
            pow += 1
            n //= d
        if pow > 0:
            primfac.append(d ** pow)
        if pIdx < len(smallPrimes)-1:
            pIdx += 1
            d = smallPrimes[pIdx]
        else:
            d += 1
    if n > 1:
       primfac.append(n)
    return primfac

for i in range(2, 1000000):
    factors1 = primeFactors(i)
    if len(factors1) != 4: continue

    factors2 = primeFactors(i+1)
    if len(factors2) != 4: continue

    factors3 = primeFactors(i+2)
    if len(factors3) != 4: continue

    factors4 = primeFactors(i+3)
    if len(factors4) != 4: continue

    if len(np.unique([factors1, factors2, factors3, factors4])) == 16:
        print(i, np.unique([factors1, factors2, factors3, factors4]))
        break
