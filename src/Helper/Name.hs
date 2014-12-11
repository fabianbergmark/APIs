module Helper.Name (snakeCase, camelCase) where

import Prelude

import Data.Char
import Data.List.Split

snakeCase :: FilePath -> String
snakeCase fp =
  foldr1 (\x a -> x ++ "_" ++ a) pieces
  where
    pieces = splitOn "." fp

camelCase :: FilePath -> String
camelCase fp =
  foldr (\x a -> upper x ++ a) [] pieces
  where
    pieces = splitOn "." fp
    upper (x:xs) = (toUpper x : xs)
    upper a = a
