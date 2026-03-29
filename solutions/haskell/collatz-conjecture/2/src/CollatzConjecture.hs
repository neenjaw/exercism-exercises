module CollatzConjecture (collatz) where

collatz :: Integer -> Maybe Integer
collatz n
  | n <= 0 = Nothing
  | otherwise = Just $ collatzIter n 0

collatzIter :: Integer -> Integer -> Integer
collatzIter 1 c = c
collatzIter n c
  | even n = collatzIter nextIfEven $ succ c
  | otherwise  = collatzIter nextIfOdd $ succ c
  where nextIfEven = n `quot` 2
        nextIfOdd = 3 * n + 1