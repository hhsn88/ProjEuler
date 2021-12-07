def sum_digits(n):
   r = 0
   while n:
       r, n = r + n % 10, n // 10
   return r

for num in range(123456, 166666):
    if sum_digits(num) == sum_digits(2*num) and \
        sum_digits(num) == sum_digits(3*num) and \
        sum_digits(num) == sum_digits(3*num) and \
        sum_digits(num) == sum_digits(4*num) and \
        sum_digits(num) == sum_digits(5*num) and \
        sum_digits(num) == sum_digits(6*num):
        if sorted(str(num)) == sorted(str(2*num)) and \
            sorted(str(num)) == sorted(str(2*num)) and \
            sorted(str(num)) == sorted(str(3*num)) and \
            sorted(str(num)) == sorted(str(4*num)) and \
            sorted(str(num)) == sorted(str(5*num)) and \
            sorted(str(num)) == sorted(str(6*num)):
            print(num, 2*num, 3*num, 4*num, 5*num, 6*num)

