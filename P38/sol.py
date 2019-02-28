import numpy as np

def findPandigital(candidateNums):
    for num in candidateNums:
        nums = np.array([], dtype=int)
        m = 1
        while len(nums) < 9:
            nums = np.append(nums, [int(i) for i in str(num * m)])
            if 0 in nums:
                break
            m += 1
        #print(nums)
        if 0 not in nums and len(np.unique(nums)) == len(nums):
            print(nums)

# try 99 - 91
#candidateNums = np.array(range(99, 90, -1))
#findPandigital(candidateNums)

# try 999 - 912
#candidateNums = np.array(range(999, 911, -1))
#findPandigital(candidateNums)

# try 9999 - 9123
candidateNums = np.array(range(9999, 9122, -1))
findPandigital(candidateNums)
