import numpy as np

interestingNums = np.array([])

divisors = [7, 11, 13, 17]

mini17 = np.array([i for i in range(100, 987) if np.remainder(i,17)==0])
mini13 = np.array([], dtype=int)
for num in mini17:
    for j in range(10):
        n = int(num/10)+100*j
        if np.remainder(n, 13) == 0 and n > 10:
            mini13 = np.append(mini13, n)

mini11 = np.array([], dtype=int)
for num in mini13:
    for j in range(10):
        n = int(num/10)+100*j
        if np.remainder(n, 11) == 0 and n > 10:
            mini11 = np.append(mini11, n)

mini7 = np.array([], dtype=int)
for num in mini11:
    for j in range(10):
        n = int(num/10)+100*j
        if np.remainder(n, 7) == 0 and n > 10:
            mini7 = np.append(mini7, n)

mini5 = np.array([], dtype=int)
for num in mini7:
    num2 = int(num/10)
    if (num2 % 10 == 0 or num2 % 10 == 5) and num2 > 10:
        mini5 = np.append(mini5, num2)

mini3 = np.array([], dtype=int)
for num in mini5:
    for j in range(10):
        n = int(num/10)+100*j
        if np.remainder(n, 3) == 0 and n > 10:
            mini3 = np.append(mini3, n)

mini2 = np.array([], dtype=int)
for num in mini3:
    num2 = int(num/10)
    if num2 % 2 == 0 and num2 > 10:
        mini2 = np.append(mini2, num2)

print(mini2)