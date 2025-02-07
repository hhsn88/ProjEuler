module Main where

import Data.Ratio

main = do
  let iter :: [Rational] = [1 .. 1000]
  --   let iter = [1 .. 1000]
  --   print $ (map ((+ 1) . approxSqrt2) iter)
  print $ compareNumDenomDigits (map ((+ 1) . approxSqrt2) iter)

digits :: Integer -> Int
digits = length . (show :: Integer -> String)

approxSqrt2 :: Rational -> Rational
approxSqrt2 0 = 0
approxSqrt2 i = 1 / (2 + approxSqrt2 (i - 1))

compareNumDenomDigits :: [Rational] -> Integer
compareNumDenomDigits xs = sum (map numeratorHasMoreDigits xs)

numeratorHasMoreDigits :: Rational -> Integer
numeratorHasMoreDigits x = if digits (numerator x) > digits (denominator x) then 1 else 0