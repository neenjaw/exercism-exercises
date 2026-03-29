{-# LANGUAGE TupleSections #-}

module DNA (nucleotideCounts, Nucleotide(..), newHistogram) where

import qualified Data.Map as M
import           Data.Map (Map)
import           Control.Monad (foldM)

data Nucleotide = A | C | G | T deriving (Eq, Ord, Show)

type Histogram = Map Nucleotide Int

newHistogram :: Histogram
newHistogram = M.fromList $ map (, 0) [A, C, G, T]

nucleotideCounts :: String -> Either String Histogram
nucleotideCounts xs =
  case foldM updateCount h xs of
    Just result -> Right result
    Nothing -> Left xs
  where
    h = newHistogram

updateCount :: Histogram -> Char -> Maybe Histogram
updateCount h 'A' = Just $ doUpdateCount h A
updateCount h 'C' = Just $ doUpdateCount h C
updateCount h 'T' = Just $ doUpdateCount h T
updateCount h 'G' = Just $ doUpdateCount h G
updateCount _ _ = Nothing

doUpdateCount :: Histogram -> Nucleotide -> Histogram
doUpdateCount h n = M.adjust succ n h
