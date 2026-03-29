module CollatzConjecture (collatz) where

collatz :: Integer -> Maybe Integer
collatz n
  | n <= 0 = Nothing
  | otherwise = Just $ collatzIter n 0

collatzIter :: Integer -> Integer -> Integer
collatzIter n c
  | n == 1 = c
  | even n = collatzIter nextEven $ succ c
  | otherwise  = collatzIter nextOdd $ succ c
  where nextEven = n `div` 2
        nextOdd = 3 * n + 1