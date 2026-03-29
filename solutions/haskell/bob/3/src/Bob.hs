{-# LANGUAGE OverloadedStrings #-}
module Bob (responseFor) where

import qualified Data.Char as C
import qualified Data.Text as T
import           Data.Text (Text)

responseFor :: Text -> Text
responseFor s
  | isSilent s                = "Fine. Be that way!"
  | isYelling s && isAsking s = "Calm down, I know what I'm doing!"
  | isYelling s               = "Whoa, chill out!"
  | isAsking s                = "Sure."
  | otherwise                 = "Whatever."

isSilent, isYelling, isAsking :: Text -> Bool
isSilent = T.all C.isSpace
isYelling t = T.any C.isUpper t &&  T.all (not . C.isLower) t
isAsking t = '?' == T.last ( T.stripEnd t)