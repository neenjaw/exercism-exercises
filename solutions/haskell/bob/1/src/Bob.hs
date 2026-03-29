module Bob (responseFor) where

import qualified Data.Text as T
import           Data.Text (Text)

responseFor :: Text -> Text
responseFor t
  | isQuestion && isYelling = T.pack "Calm down, I know what I'm doing!"
  | isQuestion              = T.pack "Sure."
  | isYelling               = T.pack "Whoa, chill out!"
  | isBlank                 = T.pack "Fine. Be that way!"
  | otherwise               = T.pack "Whatever."
  where stripped   = T.strip t
        hasAlpha   = T.toLower stripped /= T.toUpper stripped
        isBlank    = T.pack "" == stripped
        isQuestion = T.pack "?" `T.isSuffixOf` stripped
        isYelling  = T.toUpper stripped == stripped && hasAlpha
