module Paths_Parser (
    version,
    getBinDir, getLibDir, getDataDir, getLibexecDir,
    getDataFileName, getSysconfDir
  ) where

import qualified Control.Exception as Exception
import Data.Version (Version(..))
import System.Environment (getEnv)
import Prelude

catchIO :: IO a -> (Exception.IOException -> IO a) -> IO a
catchIO = Exception.catch

version :: Version
version = Version [0,1,0,0] []
bindir, libdir, datadir, libexecdir, sysconfdir :: FilePath

bindir     = "/home/vasiliy/.cabal/bin"
libdir     = "/home/vasiliy/.cabal/lib/x86_64-linux-ghc-8.0.2/Parser-0.1.0.0-6u8uPwW9Frj3vCBDyLdGbV"
datadir    = "/home/vasiliy/.cabal/share/x86_64-linux-ghc-8.0.2/Parser-0.1.0.0"
libexecdir = "/home/vasiliy/.cabal/libexec"
sysconfdir = "/home/vasiliy/.cabal/etc"

getBinDir, getLibDir, getDataDir, getLibexecDir, getSysconfDir :: IO FilePath
getBinDir = catchIO (getEnv "Parser_bindir") (\_ -> return bindir)
getLibDir = catchIO (getEnv "Parser_libdir") (\_ -> return libdir)
getDataDir = catchIO (getEnv "Parser_datadir") (\_ -> return datadir)
getLibexecDir = catchIO (getEnv "Parser_libexecdir") (\_ -> return libexecdir)
getSysconfDir = catchIO (getEnv "Parser_sysconfdir") (\_ -> return sysconfdir)

getDataFileName :: FilePath -> IO FilePath
getDataFileName name = do
  dir <- getDataDir
  return (dir ++ "/" ++ name)
