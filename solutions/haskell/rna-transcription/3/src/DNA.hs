module DNA (toRNA, translate) where

toRNA :: String -> Either Char String
toRNA = mapM translate
-- toRNA nucleotides = sequence $ fmap translate nucleotides

translate :: Char -> Either Char Char
translate 'G' = Right 'C'
translate 'C' = Right 'G'
translate 'T' = Right 'A'
translate 'A' = Right 'U'
translate n = Left n