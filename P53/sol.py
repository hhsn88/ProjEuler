def ncr(n, k):
    if n < k:
        return 0
    u = [i for i in range(n, 1, -1)]
    d1 = [i for i in range(k, 1, -1)]
    d2 = [i for i in range(n - k, 1, -1)]
    x = []
    for num in d1:
        if num in u:
            x.append(num)
    for num in x:
        u.remove(num)
        d1.remove(num)
    x = []
    for num in d2:
        if num in u:
            x.append(num)
    for num in x:
        u.remove(num)
        d2.remove(num)
    down = 1
    for num in d1 + d2:
        down *= num
    up = 1
    for num in u:
        up *= num
        if up // down > 1000000:
            return 1
    return 0

c = 0
for n in  range(23, 101):
    for k in  range(1, n + 1):
        c += ncr(n,k)
print(c)