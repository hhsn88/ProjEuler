module Main where

import Debug.Trace

main = do
  let a = [2 .. 99]
  let b = [2 .. 99]
  let c :: [[Integer]] = toPowers b a
  print $ maximum (map (sumDigits 0) (flatten c))

debug = flip trace

toPowers :: [Integer] -> [Integer] -> [[Integer]]
toPowers [] y = []
toPowers (x : xs) y = map (^ x) y : toPowers xs y

flatten :: [[Integer]] -> [Integer]
flatten [] = []
flatten [[x]] = [x]
flatten (x : xs) = x ++ flatten xs

sumDigits :: Integer -> Integer -> Integer
sumDigits acc 0 = acc
sumDigits acc x = sumDigits (acc + (x `mod` 10)) (x `div` 10) -- `debug` show x
