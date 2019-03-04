import numpy as np
import csv
import os

def calcTrinagNum(word):
    sum = 0
    for letter in word.strip('\''):
        sum += ord(letter) - ord('A') + 1
    return sum

triNums = np.array([int(0.5*i*(i+1)) for i in range(1, 25)])

words = np.array([], dtype=str)

script_dir = os.path.dirname(__file__)
abs_file_path = os.path.join(script_dir, "p042_words.txt")
with open(abs_file_path, newline='') as csvfile:
    wordsCsv = csv.reader(csvfile, delimiter=',', quotechar='\"')
    for line in wordsCsv:
        words = np.append(words, line)

c = 0
for word in words:
    print(word, calcTrinagNum(word))
    if calcTrinagNum(word) in triNums:
        c += 1

print(c)