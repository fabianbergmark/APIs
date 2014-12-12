{-# LANGUAGE TemplateHaskell #-}

module TH.SWIG
       ( generateSWIG
       , generateSWIGs ) where

import Control.Applicative ((<$>))
import Control.Monad (forM, join)

import Data.List (intercalate)

import Language.Haskell.TH
import Language.Haskell.TH.Syntax

import Data.TH.API

generateSWIGs :: [API] -> Q ()
generateSWIGs apis = do
  arrayFuns <- sequence $ generateArrayFunctionss <$> apis
  templateExpansions <- sequence $ generateTemplateExpansions <$> apis

  runIO $ writeInstanceFile
    (join arrayFuns)
    (join templateExpansions)

generateSWIG :: API -> Q ()
generateSWIG api = do
  arrayFuns <- generateArrayFunctionss api
  templateExpansions <- generateTemplateExpansions api

  runIO $ writeInstanceFile arrayFuns templateExpansions

writeInstanceFile :: [String] -> [String] -> IO ()
writeInstanceFile arrayFuns templateExpansions = do
  let include = "%include carrays.i\n" ++
                "%include cpointer.i\n" ++
                "%module APIs\n" ++
                "%{\n" ++
                "#include <api.hpp>\n" ++
                "%}\n" ++
                "%include HsFFI.h\n" ++
                "%include cpp/lib/api.hpp\n" ++
                "%include cpp/lib/array.hpp\n" ++
                "%include cpp/lib/maybe.hpp\n" ++
                "%include cpp/lib/types.hpp\n" ++
                "%include cpp/lib/void.hpp\n" ++
                "%include cpp/lib/yql.hpp\n"
      interface = intercalate "\n" [ include
                                   , intercalate "\n" arrayFuns
                                   , intercalate "\n" templateExpansions ]
  writeFile "ffi/ffi.i" interface

generateTemplateExpansions :: API -> Q [String]
generateTemplateExpansions (API
                            fname
                            (APIInput _ _ _ iDecs)
                            (APIOutput _ _ _ oDecs)) = do
  iExpansions <- forM iDecs generateTemplateExpansion
  oExpansions <- forM oDecs generateTemplateExpansion

  let expansions = filter (not . null) $ iExpansions ++ oExpansions
  return expansions

generateTemplateExpansion :: Dec -> Q String
generateTemplateExpansion ((DataD _ (Name (OccName tName) _) _ _ _)) = do
  return $
    "%template(Maybe" ++ tName ++ ") Maybe <" ++ tName ++ ">;" ++
    "%template(" ++ tName ++ "Array) Array <" ++ tName ++ ">;"
generateTemplateExpansion _ = return ""

generateArrayFunctionss :: API -> Q [String]
generateArrayFunctionss (API
                         fname
                         (APIInput _ _ _ iDecs)
                         (APIOutput _ _ _ oDecs)) = do
  iStructs <- forM iDecs generateArrayFunctions
  oStructs <- forM oDecs generateArrayFunctions

  let arrays = filter (not . null) $ iStructs ++ oStructs
  return arrays

generateArrayFunctions :: Dec -> Q String
generateArrayFunctions ((DataD _ (Name (OccName tName) _) _ _ _)) = do
  return $ "%array_functions(" ++ tName ++ ", " ++ tName ++ "CArray);"
generateArrayFunctions _ = return ""
