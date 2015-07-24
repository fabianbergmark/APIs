module Helper.YQL
       ( yqlURI ) where

import Data.List.Split
import System.FilePath (takeFileName)

yqlURI :: FilePath -> String -> String
yqlURI base url = url ++ path
  where pieces = splitOneOf "." $ takeFileName base
        path = foldl (\a x -> a ++ x ++ "/") "/" $ pieces
