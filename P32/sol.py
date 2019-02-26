# We shall say that an n-digit number is pandigital if it makes use of all the digits 1 to n exactly once; for example, the 5-digit number, 15234, is 1 through 5 pandigital.
# The product 7254 is unusual, as the identity, 39 × 186 = 7254, containing multiplicand, multiplier, and product is 1 through 9 pandigital.
# Find the sum of all products whose multiplicand/multiplier/product identity can be written as a 1 through 9 pandigital.
# HINT: Some products can be obtained in more than one way so be sure to only include it once in your sum. 
import numpy as np

def sanityCheck(n):
    #contains zero
    digits = np.array([int(i) for i in str(n)])
    if 0 in digits:
        return False
    if len(digits) > len (np.unique(digits)):
        return False
    return True

def isPandigitalProd(num, s, e):
    for a in range(s, e):
        if num % a == 0:
            A = np.array([int(i) for i in str(a)])
            B = np.array([int(i) for i in str(int(num / a))])
            N = np.array([int(i) for i in str(num)])
            allDigits = np.concatenate([A, B, N])
            uniqueAllDigits = np.unique(allDigits)
            if len(allDigits) == 9 and len(uniqueAllDigits) == 9:
                print(num, a, int(num/a))
                return True
    return False

def findpanDigProds(minPossibleNum, maxPossibleNum, minProd, maxProd):
    num = minPossibleNum - 1
    panDigProdNums = np.array([])

    while num <= maxPossibleNum:
        num += 1
        #print(num)
        if not sanityCheck(num):
            continue
        if isPandigitalProd(num, minProd, maxProd):
            panDigProdNums = np.append(panDigProdNums, num)
    
    return panDigProdNums

# 2-3-4 and 1-4-4
x = findpanDigProds(1234, 9876, 1, 99)
print(x)
print(sum(x))