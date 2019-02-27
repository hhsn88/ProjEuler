# 145 is a curious number, as 1! + 4! + 5! = 1 + 24 + 120 = 145.
# Find the sum of all numbers which are equal to the sum of the factorial of their digits.
# Note: as 1! = 1 and 2! = 2 are not sums they are not included.
# FACTORIALS:
# 0 1
# 1 1
# 2 2
# 3 6
# 4 24
# 5 120
# 6 720
# 7 5040
# 8 40320
# 9 362880
import numpy as np

nums = np.array([])
for n in range(12, 100000):
    digits = np.array([int(i) for i in str(n)])
    fDigits = np.array([np.math.factorial(i) for i in digits])
    #print(n, fDigits, np.sum(fDigits) - n)
    if np.sum(fDigits) == n:
        nums = np.append(nums, n)
print(np.sum(nums))