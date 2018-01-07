module LearnParsers where

import Text.Trifecta
--import Text.ParserCombinators.HuttonMeijer

stop :: Parser a
stop = unexpected "stop"

one :: Char
one = char '1'

one' :: Parser Char
one' = one >> stop

oneTwo :: Char
oneTwo = char '1' >> char '2'

oneTwo' :: Parser Char
oneTwo' = oneTwo >> stop

testParse :: Parser Char -> IO ()
testParse p =  print $ parseString p mempty "123"
