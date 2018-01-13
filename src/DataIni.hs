{-# LANGUAGE OverloadedStrings#-}
{-# LANGUAGE QuasiQuotes #-}

module DataIni where

import Control.Applicative
import Data.ByteString (ByteString)
import Data.Char (isAlpha)
import Data.Map (Map)
import qualified Data.Map as M
import Data.Text (Text)
import qualified Data.Text.IO as TIO
import Test.Hspec
import Text.RawString.QQ
import Text.Trifecta

headerEx :: ByteString
headerEx = "[blah]"
-- "[blah]" -> Section "blah"

newtype Header = Header String deriving (Eq, Ord, Show)

parseBracketPair :: Parser a -> Parser a
parseBracketPair p = char '[' *> p <* char ']'

-- these operators mean the brackets will be
-- parsed and then discarded
-- but the p will remain as our result

parseHeader :: Parser Header
parseHeader = parseBracketPair (Header <$> some letter)

assingmentEx :: ByteString
assingmentEx = "woot=1"

type Name = String
type Value = String
type Assingments = Map Name Value

parseAssignment :: Parser (Name, Value)
parseAssignment = do
  name <- some letter
  _ <- char '='
  val <- some (noneOf "\n")
  skipEOL --important
  return (name, val)

-- | Skip end of line and whitespace beyond.
skipEOL :: Parser ()
skipEOL = skipMany (oneOf "\n")
