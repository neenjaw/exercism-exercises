{-# LANGUAGE OverloadedStrings #-}

module Bob (responseFor) where

import qualified Data.Text as T
import           Data.Text (Text)

responseFor :: Text -> Text
responseFor t
  | isQuestion && isYelling = "Calm down, I know what I'm doing!"
  | isQuestion              = "Sure."
  | isYelling               = "Whoa, chill out!"
  | isBlank                 = "Fine. Be that way!"
  | otherwise               = "Whatever."
  where stripped   = T.strip t
        hasAlpha   = T.toLower stripped /= T.toUpper stripped
        isBlank    = "" == stripped
        isQuestion = "?" `T.isSuffixOf` stripped
        isYelling  = T.toUpper stripped == stripped && hasAlpha
