# The fraction 49/98 is a curious fraction, as an inexperienced mathematician in attempting to simplify it may incorrectly believe that 49/98 = 4/8, which is correct, is obtained by cancelling the 9s.
# We shall consider fractions like, 30/50 = 3/5, to be trivial examples.
# There are exactly four non-trivial examples of this type of fraction, less than one in value, and containing two digits in the numerator and denominator.
# If the product of these four fractions is given in its lowest common terms, find the value of the denominator.
import numpy as np
import math as math

def isNonZeroSimilarDigit(a, b):
    aDigits = np.array([int(i) for i in str(a)])
    bDigits = np.array([int(i) for i in str(b)])
    simDigits = np.array([i for i in aDigits if i in bDigits])
    for j in simDigits:
        if j != 0:
            return True, j
    return False, 0

def stripDigit(num, digit):
    if num % 10 == digit:
        return int(num/10)
    else:
        return int(num % 10)

A = np.arange(11, 100)
B = np.arange(12, 100)

curiousNumerators = np.array([])
curiousDenominators = np.array([])

for a in A:
    for b in [i for i in B if i > a]:
        isSimilar, digit = isNonZeroSimilarDigit(a, b)
        if isSimilar:
            a2 = stripDigit(a, digit)
            b2 = stripDigit(b, digit)
            #print(a, b, digit, a2, b2)
            if a2 * b2 == 0: continue
            if a/b == a2/b2:
                curiousNumerators = np.append(curiousNumerators, a)
                curiousDenominators = np.append(curiousDenominators, b)

print(curiousNumerators)
print(curiousDenominators)
#1/4 1/5 2/5 1/2 : 2/200 : 1/100