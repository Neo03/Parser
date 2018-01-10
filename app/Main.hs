module Main where

--import Lib
--import  LearnParsers
import TextFractions
import Text.Trifecta
import AltParsing

main :: IO ()
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
main = do
  {--
  print $ parseString (some letter) mempty a
  print $ parseString integer mempty b
  print $ parseString parseNos mempty a
  print $ parseString parseNos mempty b
  print $ parseString (many parseNos) mempty c
  print $ parseString (some parseNos) mempty c
--}
  print $ parseString parseNos mempty eitherOr
