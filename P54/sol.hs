import Control.Monad
import Data.Char (digitToInt)
import Data.List
import Data.Ord (Down (Down), comparing)
import System.IO

main = do
  content <- readFile "poker.txt"
  let pokerLines = lines content
  let p1Wins = sum (map ((\val -> if val < 0 then 1 else 0) . eval . toHandPair) pokerLines)
  print p1Wins

data Suit = Heart | Diamond | Club | Spade deriving (Show, Eq)

type Rank = Int

data Card = Card {suit :: Suit, rank :: Rank} deriving (Show, Eq)

-- newtype Card = Card (Suit, Rank) deriving (Show, Eq)

type Hand = [Card]

-- Input is a string with 2 hands, e.g.: "8C TS KC 9H 4S 7D 2S 5D 3S AC"
toHandPair :: String -> (Hand, Hand)
toHandPair x = (toHand (take (5 * 2 + 4) x), toHand (drop (5 * 2 + 5) x))

-- Input is a string with hand, e.g.: "8C TS KC 9H 4S"
toHand :: String -> Hand
toHand s
  | length s == 2 = [toCard s]
  | otherwise = toCard (take 2 s) : toHand (drop 3 s)

-- Input is a 2 letter string, e.g.: "8C"
toCard :: String -> Card
toCard s = Card {suit, rank}
  where
    rawSuit = last s
    suit
      | rawSuit == 'H' = Heart
      | rawSuit == 'D' = Diamond
      | rawSuit == 'C' = Club
      | rawSuit == 'S' = Spade
    rawRank = head s
    rank
      | rawRank == 'T' = 10
      | rawRank == 'J' = 11
      | rawRank == 'Q' = 12
      | rawRank == 'K' = 13
      | rawRank == 'A' = 14
      | otherwise = digitToInt rawRank

eval :: (Hand, Hand) -> Int
eval (h1, h2) = compareHands (evalHand h1) (evalHand h2)

data HandRank = HighCard | Pair | TwoPair | Tripple | Straight | Flush | FullHouse | FourOAK | StraightFlush deriving (Eq, Ord)

evalHand :: Hand -> (HandRank, [Int])
evalHand h
  | isFlush h && isStraight h = (StraightFlush, [highestStraightCard h])
  | isFourOA h = (FourOAK, [fourCardRank h])
  | isFullHouse h = (FullHouse, cardRanks h)
  | isFlush h = (Flush, cardRanks h)
  | isStraight h = (Straight, [highestStraightCard h])
  | isTripple h = (Tripple, trippleRanks h)
  | isTwoPair h = (TwoPair, twoPairRanks h)
  | isPair h = (Pair, pairRanks h)
  | otherwise = (HighCard, [highestCard h])

compareHands :: (HandRank, [Int]) -> (HandRank, [Int]) -> Int
compareHands (hr1, cr1) (hr2, cr2)
  | hr1 > hr2 = -1
  | hr1 < hr2 = 1
  | cr1 > cr2 = -1
  | otherwise = 1

highestCard :: Hand -> Int
highestCard h = maximum (map rank h)

cardRanks :: Hand -> [Int]
cardRanks h = sortBy (comparing Data.Ord.Down) (map rank h)

count :: (Eq a) => a -> [a] -> Int
count x = length . filter (== x)

-- Flush
isFlush :: Hand -> Bool
isFlush h = allTheSame (map suit h)

allTheSame :: (Eq a) => [a] -> Bool
allTheSame xs = all (== head xs) (tail xs)

-- Straight
isStraight :: Hand -> Bool
isStraight h = isConsicutive (map rank h)

isConsicutive :: [Int] -> Bool
isConsicutive [] = True
isConsicutive [x] = True
isConsicutive [x, y] = y - x == 1
isConsicutive xs =
  sorted !! 1 - head sorted == 1
    && ( isConsicutive (tail sorted)
           || (isConsicutive (tail . init $ sorted) && last sorted == 14 && (last (init sorted) == 5))
       )
  where
    sorted = sort xs

highestStraightCard :: Hand -> Int
highestStraightCard h
  | 14 `elem` ranks = if 13 `elem` ranks then 14 else 5
  | otherwise = highestCard h
  where
    ranks = map rank h

-- Four of a kind
isFourOA :: Hand -> Bool
isFourOA h =
  length (nub (map rank h)) == 2
    && (count (head ranks) ranks == 4 || count (head (tail ranks)) ranks == 4)
  where
    ranks = map rank h

fourCardRank :: Hand -> Int
fourCardRank h
  | head cardRanks == head (tail cardRanks) = head cardRanks
  | head cardRanks == last cardRanks = head cardRanks
  | otherwise = last cardRanks
  where
    cardRanks = map rank h

-- Full House
isFullHouse :: Hand -> Bool
isFullHouse h =
  length (nub (map rank h)) == 2
    && elem (count (head ranks) ranks) [2, 3]
  where
    ranks = map rank h

-- Three of a kind
isTripple :: Hand -> Bool
isTripple h =
  length (nub ranks) == 3
    && elem 3 (map (`count` ranks) ranks)
  where
    ranks = map rank h

trippleRanks :: Hand -> [Int]
trippleRanks h = trippleCardRank : sortBy (comparing Down) (filter (/= trippleCardRank) ranks)
  where
    ranks = map rank h; trippleCardRank = maximumBy (comparing (`count` ranks)) ranks :: Rank

-- Two pairs
isTwoPair :: Hand -> Bool
isTwoPair h =
  length (nub ranks) == 3
    && elem 2 (map (`count` ranks) ranks)
  where
    ranks = map rank h

twoPairRanks :: Hand -> [Int]
twoPairRanks h = twoPairRanks ++ [last sortedByRank]
  where
    ranks = map rank h
    sortedByRank = sortBy (comparing (Down . (`count` ranks))) ranks
    twoPairRanks = sortBy (comparing Down) [head sortedByRank, sortedByRank !! 2]

-- Pair
isPair :: Hand -> Bool
isPair h =
  length (nub ranks) == 4
  where
    ranks = map rank h

pairRanks :: Hand -> [Int]
pairRanks h = pairCardRank : sortBy (comparing Down) (filter (/= pairCardRank) ranks)
  where
    ranks = map rank h; pairCardRank = maximumBy (comparing (`count` ranks)) ranks
