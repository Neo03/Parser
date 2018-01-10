module LearnParsers where
-- Здесь не всё правильно.
import Text.Trifecta
--import Text.ParserCombinators.HuttonMeijer

stop :: Parser a
stop = unexpected "stop"

--one :: Char
one = char '1' >> eof >> stop

one' :: Parser Char
one' = one >> stop

--oneTwo :: Char
oneTwo = char '1' >> char '2' >> eof >> stop

--oneTwo' :: Parser Char
oneTwo' = oneTwo >> stop

oneStr = string "1" >> stop

oneTwoStr = string "12" >> eof >> stop

oneTwoThreeStr  = string "123" >> stop

oneTwoThreeChar = char '1' >> char '2' >> char '3' >> stop

stringChar (x:xs) = char 'x' >> stringChar xs
stringChar [] = stop

oneTwoThreeChar' = stringChar "123"

testParse :: Parser Char -> IO ()
testParse p =  print $ parseString p mempty "123"

testParse' :: Parser String -> IO ()
testParse' p =  print $ parseString p mempty "123"

testParse'' :: Show a => Parser a -> IO ()
testParse'' p = print $ parseString p mempty "123"

pNL s = putStrLn ('\n' : s)

{--
main = do
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
  testParse'' oneTwoThreeStr
  pNL "oneTwoThreeChar:"
  testParse oneTwoThreeChar
  pNL "oneTwoThreeChar':"
  testParse oneTwoThreeChar'
--}
