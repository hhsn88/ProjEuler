# The decimal number, 585 = 1001001001 (binary), is palindromic in both bases.
# Find the sum of all numbers, less than one million, which are palindromic in base 10 and base 2.
# (Please note that the palindromic number, in either base, may not include leading zeros.)
import numpy as np

def isDecimalPal(num):
    digits = np.array([int(d) for d in str(num)])
    #print(digits - digits[::-1], not np.any(digits - digits[::-1] != 0))
    return not np.any(digits - digits[::-1] != 0)

def isBinaryPal(binNum):
    digits = np.array([int(i) for i in bin(binNum)[2:]])
    return not np.any(digits - digits[::-1] != 0)

MAX = 1000000

decimalPals = [n for n in range(1, MAX) if isDecimalPal(n)]
binaryPals = [n for n in decimalPals if isBinaryPal(n)]

print(binaryPals)
print(sum(binaryPals))