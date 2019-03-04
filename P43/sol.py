import numpy as np

interestingNums = np.array([])

divisors = [7, 11, 13, 17]


mini17 = np.array([i for i in range(100, 987) if np.remainder(i,17)==0])

idx = 0
toRemove = np.array([])
mini13 = np.array([], dtype=int)
for num in mini17:
    c = 0
    for j in range(10):
        n = int(num/10)+100*j
        if np.remainder(n, 13) == 0 and n > 10:
            c += 1
            mini13 = np.append(mini13, n)
    if c == 0:
        toRemove = np.append(toRemove, idx)
    idx += 1
mini13 = np.delete(mini13, toRemove)

idx = 0
toRemove = np.array([])
mini11 = np.array([], dtype=int)
for num in mini13:
    c = 0
    for j in range(10):
        n = int(num/10)+100*j
        if np.remainder(n, 11) == 0 and n > 10:
            mini11 = np.append(mini11, n)
    if c == 0:
        toRemove = np.append(toRemove, idx)
    idx += 1
mini11 = np.delete(mini11, toRemove)

idx = 0
toRemove = np.array([])
mini7 = np.array([], dtype=int)
for num in mini11:
    c = 0
    for j in range(10):
        n = int(num/10)+100*j
        if np.remainder(n, 7) == 0 and n > 10:
            mini7 = np.append(mini7, n)
    if c == 0:
        toRemove = np.append(toRemove, idx)
    idx += 1
mini7 = np.delete(mini7, toRemove)

idx = 0
toRemove = np.array([])
mini5 = np.array([], dtype=int)
for num in mini7:
    c = 0
    num2 = int(num/10)
    if (num2 % 10 == 0 or num2 % 10 == 5) and num2 > 10:
        mini5 = np.append(mini5, num2)
    if c == 0:
        toRemove = np.append(toRemove, idx)
    idx += 1
mini5 = np.delete(mini5, toRemove)

idx = 0
toRemove = np.array([])
mini3 = np.array([], dtype=int)
for num in mini5:
    c = 0
    for j in range(10):
        n = int(num/10)+100*j
        if np.remainder(n, 3) == 0 and n > 10:
            mini3 = np.append(mini3, n)
    if c == 0:
        toRemove = np.append(toRemove, idx)
    idx += 1
mini3 = np.delete(mini3, toRemove)

idx = 0
toRemove = np.array([])
mini2 = np.array([], dtype=int)
for num in mini3:
    c = 0
    num2 = int(num/10)
    if num2 % 2 == 0 and num2 > 10:
        mini2 = np.append(mini2, num2)
    if c == 0:
        toRemove = np.append(toRemove, idx)
    idx += 1
mini2 = np.delete(mini2, toRemove)

interestingPandigitals = np.array([])
for d1 in range(1, 9):
    for n17 in mini17:
        for n7 in mini7:
            for n2 in mini2:
                num = d1 * 10000000 + n2 * 1000000 + n7 * 1000 + n17
                digits = [int(i) for i in str(num)]
                if len(np.unique(digits) == len(digits)):
                    interestingPandigitals = np.append(interestingPandigitals, num)

print(sum(interestingPandigitals))