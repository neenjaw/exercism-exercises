module DNA (toRNA) where

import qualified Data.Either as Either

toRNA :: String -> Either Char String
toRNA nucleotides
  | null err = Right rna
  | otherwise = Left $ head err
  where (err, rna) = Either.partitionEithers $ fmap translate nucleotides

translate :: Char -> Either Char Char
translate 'G' = Right 'C'
translate 'C' = Right 'G'
translate 'T' = Right 'A'
translate 'A' = Right 'U'
translate n = Left n