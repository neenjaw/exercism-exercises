module Pangram (isPangram) where

import qualified Data.Set as Set
import qualified Data.Char as Char

isPangram :: String -> Bool
isPangram text = Set.size textSet == 26
  where textSet = Set.fromList [ l | c <- text, let l = Char.toLower c, l `elem` ['a'..'z']]
