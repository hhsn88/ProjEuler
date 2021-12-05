import math
import numpy as np

ones = [10,100,1000,10000,100000,1000000,10000000]
last_d = [1,3,7,9]

def primes(n, min):
    """ Returns  a list of primes < n """
    sieve = [True] * n
    for i in range(3,int(n**0.5)+1,2):
        if sieve[i]:
            sieve[i*i::2*i]=[False]*((n-i*i-1)//(2*i)+1)
    if min > 2:
        return np.array([i for i in range(3,n,2) if sieve[i] and i > min])
    else:
        return np.array([2] + [i for i in range(3,n,2) if sieve[i] and i > min])

def makeBase(num, one):
    return num - one * ((num // one) % 10)

def isJackpot(base, pattern):
    p = sum(pattern)
    m = np.array([x * p for x in range(10)])
    nums = np.array([base + x for x in m if base + x > min and base + x in primes_to_check])
    # print(len(nums))
    return len(nums) == 8

checked = set()
def checkBasePrime(p, num_digits):
    for one in ones[:num_digits-1]:
        for two in [x for x in ones[:num_digits-1] if x != one]:
            # for three in [x for x in ones[:num_digits-1] if x != one and x != two]:
            pattern = [one,two]
            base = makeBase(makeBase(p, one), two)
            # base = makeBase(base, three)
            t = (base, sum(pattern))
            if (t not in checked):
                checked.add(t)
                if (isJackpot(base, pattern)):
                    print(p, base, pattern)
                    return

num_digits = 8
# min = 10**(num_digits - 1)
min = 10113479
primes_to_check = primes(10**num_digits, min)
last = 0
for p in primes_to_check:
    checkBasePrime(p, num_digits)
