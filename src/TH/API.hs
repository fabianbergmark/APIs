module TH.API (generateAPIs) where

import Prelude

import Control.Monad (mzero, join, forM)
import Control.Applicative ((<$>))

import Language.Haskell.TH.Syntax (Q, qRunIO)

import System.FilePath (takeBaseName)

import Helper.File

import Data.TH.API

import TH.API.Input
import TH.API.Output

generateAPIs :: FilePath -> Q [API]
generateAPIs folder = do
  files <- qRunIO $ findAPIs folder
  join <$> (forM (take 1000 files) $ \file@(xml, json) -> do
               let fname = takeBaseName xml
               mAPI <- qRunIO $ loadAPI file
               case mAPI of
                 Just (opentable, schema) -> do
                   input <- generateInput xml opentable
                   output <- generateOutput json schema
                   let api = API fname input output
                   return [api]
                 _ -> do
                   qRunIO . print $ "Can't load " ++ fname
                   return mzero)
