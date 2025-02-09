module Main where

import Data.Function

main = do
  print $ iter 1 0

-- https://stackoverflow.com/a/14759541
primes = 2 : filter isPrime [3 ..]
isPrime n = n > 1 && and [rem n t /= 0 | t <- takeWhile ((<= n) . (^ 2)) primes]

toPrime :: Integer -> Integer
toPrime x = if isPrime x then 1 else 0

iter :: Integer -> Integer -> Integer
iter prevLen prevPrimes
  | ratio < 0.1 = len
  | otherwise = iter len primes
  where
    len = prevLen + 2
    jumpToCorner = len - 1
    primes =
      prevPrimes
        + toPrime (prevLen ^ 2 + jumpToCorner)
        + toPrime (prevLen ^ 2 + 2 * jumpToCorner)
        + toPrime (prevLen ^ 2 + 3 * jumpToCorner)
    ratio = fromInteger primes / fromInteger (len * 2 - 1)
