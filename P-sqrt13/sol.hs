module Main where

main = do
  print . sumDigits $ squareRoot (13 * 10 ^ 2000 :: Integer) - 3

sumDigits :: Integer -> Integer
sumDigits x
  | x < 10 = x
  | otherwise = x `mod` 10 + sumDigits (x `div` 10)

(^!) :: (Num a) => a -> Int -> a
(^!) x n = x ^ n

squareRoot :: Integer -> Integer
squareRoot 0 = 0
squareRoot 1 = 1
squareRoot n =
  let twopows = iterate (^! 2) 2
      (lowerRoot, lowerN) =
        last $ takeWhile ((n >=) . snd) $ zip (1 : twopows) twopows
      newtonStep x = div (x + div n x) 2
      iters = iterate newtonStep (squareRoot (div n lowerN) * lowerRoot)
      isRoot r = r ^! 2 <= n && n < (r + 1) ^! 2
   in head $ dropWhile (not . isRoot) iters