import DataIni
import Test.Hspec
import Data.ByteString (ByteString)
import Text.Trifecta
import Data.Map (Map)
import qualified Data.Map as M

main :: IO ()
--main = putStrLn "Test suite not yet implemented"
main = hspec $ do

  describe "Assingment Parsing" $ --do
    it "can parse a simple assingment" $ do
      let m = parseByteString parseAssignment mempty assingmentEx
          r' = maybeSuccess m
      print m
      r' `shouldBe` Just("woot","1")

  describe "Header Parsing" $ --do
    it "can parse a simple header" $ do
      let m = parseByteString parseHeader mempty headerEx
          r' = maybeSuccess m
      print m
      r' `shouldBe` Just(Header "blah")

  describe "Comment Parsing" $ --do
    it "Can skip a comment before a header" $ do
      let p = skipComments >> parseHeader
          --i = "; woot\n[blah]"
          m = parseByteString p mempty skipComment
          r' = maybeSuccess m
      print m
      r' `shouldBe` Just(Header "blah")

  describe "Section Parsing" $
    it "Can parse simple section" $ do
      let m = parseByteString parseSection mempty sectionEx
          r' = maybeSuccess m
          states = M.fromList [("Chris","Texas")]
          expected' = Just (Section (Header "states") states)
      print m
      r' `shouldBe` expected'

  describe "INI parsing" $
    it "Can parse multiple sections" $ do
      let m = parseByteString parseIni mempty sectionEx''
          r' = maybeSuccess m
          sectionValues = M.fromList [("alias","claw"),("host","wikipedia.org")]
          whatIsItValues = M.fromList [("red","intoothandclaw")]
          expected' = Just (Config (M.fromList [(Header "section", sectionValues),(Header "whatisit", whatIsItValues)]))
      print m
      r' `shouldBe` expected'
