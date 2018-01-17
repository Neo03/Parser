{-# LANGUAGE OverloadedStrings #-}
module Main where

--import Lib
--import  LearnParsers
--import TextFractions1
--import TextFractions
--import Text.Trifecta
--import AltParsing
--import Data.Attoparsec.Text(parseOnly)
import Data.String(IsString)
import BT
import qualified Data.Attoparsec.ByteString as A
import Data.ByteString (ByteString)
import Text.Trifecta hiding (parseTest)
import Text.Parsec (Parsec, parseTest)
import Data.Attoparsec.ByteString (parseOnly)


main :: IO ()
main = do
  -- trifecta
  trifP nobackParse "13"
  trifP tryParse "13"
  trifP tryAnnot "13"
  -- parsec
  parsecP nobackParse "13"
  parsecP tryParse "13"
  parsecP tryAnnot "13"
  -- attoparsec
  attoP nobackParse "13"
  attoP tryParse "13"
  attoP tryAnnot "13"

--main = someFunc
{--main = do
  pNL "stop:"
  testParse stop
  pNL "one:"
  testParse one
  pNL "one':"
  testParse one'
  pNL "oneTwo:"
  testParse oneTwo
  pNL "oneTwo':"
  testParse oneTwo'
  pNL "oneStr':"
  testParse' oneStr
  pNL "oneTwoStr':"
  testParse' oneTwoStr
  pNL "oneTwoThreeStr':"
  testParse' oneTwoThreeStr
  pNL "oneTwoThreeChar:"
  testParse oneTwoThreeChar
  pNL "oneTwoThreeChar':"
  testParse oneTwoThreeChar'


main = do
print $ parseString parseFraction mempty badFraction
print $ parseString parseFraction mempty shouldAlsoWork
print $ parseString parseFraction mempty alsoBad
print $ parseString parseFraction mempty shouldWork
--}
--main = do
  {--
  print $ parseString (some letter) mempty a
  print $ parseString integer mempty b
  print $ parseString parseNos mempty a
  print $ parseString parseNos mempty b
  print $ parseString (many parseNos) mempty c
  print $ parseString (some parseNos) mempty c
--}
{--
  print $ parseString parseNos mempty eitherOr
--}
{--
-- parseOnly is Attoparsec for Text.Fractions
  print $ parseOnly parseFraction badFraction
  print $ parseOnly parseFraction shouldWork
  print $ parseOnly parseFraction shouldAlsoWork
  print $ parseOnly parseFraction alsoBad
-- parseString is Trifecta
  print $ parseString parseFraction mempty badFraction
  print $ parseString parseFraction mempty shouldWork
  print $ parseString parseFraction mempty shouldAlsoWork
  print $ parseString parseFraction mempty alsoBad
--}
-- trifecta
