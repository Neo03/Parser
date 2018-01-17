{-# LANGUAGE OverloadedStrings #-}

module TextFractions where

import Data.Ratio((%), Ratio(..))
import Control.Applicative
import Text.Trifecta


badFraction = "1/0"
alsoBad = "10"
shouldWork = "1/2"
shouldAlsoWork = "2/1"

parseFraction :: Parser Rational
parseFraction = do
  numerator <- decimal
  char '/'
  denominator <- decimal
  case denominator of
    0 -> fail "denominator cannot be zero"
    _ -> return (numerator % denominator)

--decimal :: Integral a => Parser a
-- char :: Char -> Parser Char
parseReturnNumber :: Parser Integer
parseReturnNumber = do
  number <- decimal
  eof
  return number
