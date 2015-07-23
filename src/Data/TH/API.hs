module Data.TH.API (API(..), APIInput(..), APIOutput(..)) where

import Language.Haskell.TH

import Data.OpenDataTableNoTH
import Data.JSON.SchemaNoTH

data API =
  API
  { apiName      :: String
  , apiInput     :: APIInput
  , apiOutput    :: APIOutput }

data APIInput =
  APIInput
  { apiInputName         :: Name
  , apiInputType         :: Type
  , apiInputOpenDataTable    :: (FilePath, OpenDataTable)
  , apiInputDeclarations :: [Dec] }


data APIOutput =
  APIOutput
  { apiOutputName         :: Name
  , apiOutputType         :: Type
  , apiOutputSchema       :: (FilePath, Schema)
  , apiOutputDeclarations :: [Dec] }
