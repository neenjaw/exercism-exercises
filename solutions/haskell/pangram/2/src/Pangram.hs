module Pangram (isPangram) where

import qualified Data.Set as Set
import qualified Data.Char as Char

isPangram :: String -> Bool
isPangram text = alphaSet `Set.isSubsetOf` textSet
  where textSet = Set.map Char.toLower $ Set.fromList text
        alphaSet = Set.fromList ['a'..'z']