module Data.TH.API (API(..), APIInput(..), APIOutput(..)) where

import Language.Haskell.TH

import Data.OpenTable
import Data.JSON.Schema

data API =
  API
  { apiName      :: String
  , apiInput     :: APIInput
  , apiOutput    :: APIOutput }

data APIInput =
  APIInput
  { apiInputName         :: Name
  , apiInputType         :: Type
  , apiInputOpenTable    :: (FilePath, OpenTable)
  , apiInputDeclarations :: [Dec] }


data APIOutput =
  APIOutput
  { apiOutputName         :: Name
  , apiOutputType         :: Type
  , apiOutputSchema       :: (FilePath, Schema)
  , apiOutputDeclarations :: [Dec] }
