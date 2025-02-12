module Main where

import Data.Bits
import Data.Char
import Data.List
import Data.List.Split
import Data.Map hiding (filter, foldr, map, take)
import Data.Map.Strict qualified as Map
import Data.Ord
import System.IO ()

main = do
  content <- readFile "0059_cipher.txt"
  let encStr = splitOn "," . head . lines $ content
  let enc = map read encStr
  let encFreq = freq enc
  -- let dec = map (decript enc) [allPossiblePasswords !! 13254]
  let dec = map (map chr . decript enc) allPossiblePasswords
  -- print dec
  print $ sum $ map ord (firstValWith allLetters dec)

firstValWith :: ([Char] -> Bool) -> [[Char]] -> [Char]
firstValWith f [] = []
firstValWith f (l : ls)
  | f l = l
  | otherwise = firstValWith f ls

allLetters :: [Char] -> Bool
allLetters = foldr (\x -> (&&) (x `elem` ['a' .. 'z'] ++ ['A' .. 'Z'] ++ ['0' .. '9'] ++ "., \":';()!+[]/")) True

mostFrequent :: [Char] -> Bool
mostFrequent xs = take 3 (freq (map (ord . toLower) (filter (`elem` ['a' .. 'z'] ++ ['A' .. 'Z']) xs))) == map ord "tae"

decript :: [Int] -> String -> [Int]
decript [] pass = []
decript [x] pass = [x `xor` ord (head pass)]
decript [x, y] pass = [x `xor` ord (head pass), y `xor` ord (pass !! 1)]
decript (x : (y : (z : xs))) pass = (x `xor` ord (head pass)) : ((y `xor` ord (pass !! 1)) : ((z `xor` ord (pass !! 2)) : decript xs pass))

allPossiblePasswords :: [String]
allPossiblePasswords = concatMap (\c -> [c ++ [x] | x <- ['a' .. 'z']]) (concatMap (\c -> [[c, x] | x <- ['a' .. 'z']]) ['a' .. 'z'])

idxOf :: (Eq a) => a -> [a] -> Int
idxOf = go 0
  where
    go :: (Eq a) => Int -> a -> [a] -> Int
    go c n [] = c
    go c n (x : xs)
      | n == x = c
      | otherwise = go (c + 1) n xs

freq :: [Int] -> [Int]
freq xs =
  map
    fst
    ( sortBy
        (comparing (Data.Ord.Down . snd))
        (toList $ fromListWith (+) [(x, 1) | x <- xs])
    )

lettersFreqStr = "ETAOINSHRDLCUMWFGYPBVQKZJX"

lettersFreq :: [Char]
lettersFreq =
  map
    fst
    ( sortBy
        (comparing (Data.Ord.Down . snd))
        [ ('A', 820),
          ('B', 150),
          ('C', 280),
          ('D', 430),
          ('E', 1270),
          ('F', 220),
          ('G', 200),
          ('H', 610),
          ('I', 700),
          ('J', 015),
          ('K', 077),
          ('L', 400),
          ('M', 240),
          ('N', 670),
          ('O', 750),
          ('P', 190),
          ('Q', 0095),
          ('R', 600),
          ('S', 630),
          ('T', 910),
          ('U', 280),
          ('V', 098),
          ('W', 240),
          ('X', 015),
          ('Y', 200),
          ('Z', 0074)
        ]
    )