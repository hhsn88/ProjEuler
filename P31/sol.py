import numpy as np

def numOfWays(coins, numCoins, sum):
    if sum == 0:
        return 1
    if sum < 0:
        return 0
    if numCoins <= 0:
        return 0
    return numOfWays(coins, numCoins - 1, sum) + numOfWays(coins, numCoins, sum-coins[numCoins-1])

sum = 200
coins = np.array([1, 2, 5, 10, 20, 50, 100, 200])
#total = 10
#coins = np.array([10, 5, 2, 1])
x = numOfWays(coins, len(coins), sum)
print(x)