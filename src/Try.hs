{--# OverloadedStrings #--}

module Try where

import Data.Ratio((%), Ratio(..))
import Control.Applicative
import Text.Trifecta

badFraction = "1/0"
alsoBad = "10"
shouldWork = "1/2"
shouldAlsoWork = "2/1"

virtuousFraction :: Parser Rational
virtuousFraction = do
  numerator <- decimal
  char '/'
  denominator <- decimal
  case denominator of
    0 -> fail "denominator cannot be zero"
    _ -> return (numerator % denominator)

type NumberOrFractions = Either Integer (Ratio Integer)

--decimal :: Integral a => Parser a
-- char :: Char -> Parser Char
parseNR  :: Parser NumberOrFractions
parseNR = (Right <$> try virtuousFraction ) <|> (Left <$> try integer)

{--
main :: IO ()
main = do
  print $ parseString parseNR mempty badFraction
  print $ parseString parseNR mempty alsoBad
  print $ parseString parseNR mempty shouldWork
  print $ parseString parseNR mempty shouldAlsoWork
--}
