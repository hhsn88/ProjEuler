module Main where

import System.IO

main = do
  let nums :: [Integer] = [0 .. 9999]
--   let nums :: [Int] = [1 .. 10000 - 1]
--   let s = sum $ map isLychrel nums
--   print s
  let x = map isLychrel nums
  print (sum x)

isLychrel :: Integer -> Int
isLychrel x = isLychrel2 x 0

isLychrel2 :: Integer -> Int -> Int
isLychrel2 x iterCount
  | iterCount > 0 && isPalindrom x = 0
  | iterCount == 60 = 1
  | otherwise = isLychrel2 (x + mirror x) (iterCount + 1)

mirror :: Integer -> Integer
mirror x = read . reverse . show $ x :: Integer

isPalindrom :: Integer -> Bool
isPalindrom x = x == mirror x