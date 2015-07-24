{-# LANGUAGE RecordWildCards,
             TemplateHaskell #-}

module TH.API.Output where

import Control.Applicative ((<$>),(<*>), pure)
import Control.Monad

import Data.Aeson ((.:), (.:?), (.=), FromJSON, parseJSON, ToJSON, toJSON)
import qualified Data.Aeson as Aeson (object, Value(..))
import Data.Char
import Data.Data
import Data.Maybe

import Language.Haskell.TH
import Language.Haskell.TH.Syntax

import System.FilePath (takeBaseName)

import Data.TH.API
import Data.JSON.Void
import Data.JSON.Schema

import Helper.Name

generateOutput :: FilePath -> Schema -> Q APIOutput
generateOutput json schema@(SchemaObject _ _) = do
  let base = camelCase . takeBaseName $ json
      name = "Output" ++ base
  (t, ds) <- generateDataType name schema
  return $ APIOutput (mkName name) t (json, schema) ds

generateOutput json schema@(SchemaArray _) = do
  let base = camelCase . takeBaseName $ json
      name = "Output" ++ base

  (t, ds) <- generateDataType name schema
  return $ APIOutput (mkName name) t (json, schema) ds

generateOutput _ _ =
  error "The JSON standard only allows objects or arrays at top-level"

generateDataType :: String -> Schema -> Q (Type, [Dec])
generateDataType _ SchemaString  = return (ConT ''String, [])
generateDataType _ SchemaNumber  = return (ConT ''Double, [])
generateDataType _ SchemaInt     = return (ConT ''Int,    [])
generateDataType _ SchemaBool    = return (ConT ''Bool,   [])
generateDataType _ SchemaNull    = return (ConT ''Void,   [])

generateDataType base (SchemaArray item) = do
  (t, ds) <- generateDataType base item
  return $ (AppT ListT t, ds)

generateDataType base (SchemaObject props@(Properties keyval) required) = do
  let name = mkName base
      fieldBase = (toLower . head $ base):(tail base)

  (fields, dss) <- unzip <$> (forM keyval $ \(fname, schema) -> do
    let fieldTail = ((toUpper . head $ fname):(tail fname))
    (t, ds) <- generateDataType (base ++ fieldTail) schema
    let isRequired  = (elem fname) $ required

        fieldName   = mkName (fieldBase ++ fieldTail)
        fieldType   = if isRequired
                      then t
                      else AppT (ConT ''Maybe) t
        fieldStrict = NotStrict
    return ((fieldName, fieldStrict, fieldType), ds))

  toJSONID   <- generateToJSONInstance name fields props required
  fromJSONID <- generateFromJSONInstance name fields props required

  let dec = DataD [] name [] [RecC name fields] [''Data, ''Eq, ''Read, ''Show, ''Typeable]
      ds  = join dss
  return $ (ConT name, dec:toJSONID:fromJSONID:ds)

generateFromJSONInstance :: Name -> [VarStrictType] -> Properties -> [String] -> Q Dec
generateFromJSONInstance name fields object required = do
  let insName = ''FromJSON
      insType = ConT insName
      varType = ConT name
      decType = AppT insType varType
      ctx     = []
  parseJSOND <- generateParseJSONFunction name fields object required
  let decs = [parseJSOND]
  return $ InstanceD ctx decType decs

generateParseJSONFunction :: Name -> [VarStrictType] -> Properties -> [String] -> Q Dec
generateParseJSONFunction name _ props@(Properties keyval) required = do
  let construct  = VarE '(.:)
      mConstruct = VarE '(.:?)
      star       = VarE '(<*>)
      mz         = VarE 'mzero

  let fname = 'parseJSON
      v = mkName "v"
      mzp = AppE (VarE 'fail) (AppE (VarE 'show) (VarE v))
      con = AppE (VarE 'pure) (ConE name)
      pat = VarP v
      var = VarE v
      stars = star:stars
      ops = stars
      objectP = ConP 'Aeson.Object [pat]
      app a ((jname, _), op) =
          AppE (AppE op a)
          (if elem jname required
           then (AppE (AppE construct var) (LitE $ StringL jname))
           else (AppE (AppE mConstruct var) (LitE $ StringL jname)))
      body = foldl app con $ zip keyval ops
      bodyC = Clause [objectP] (NormalB body) []
      failC  = Clause [VarP v] (NormalB mzp) []
  return $ FunD fname [bodyC, failC]

generateToJSONInstance :: Name -> [VarStrictType] -> Properties -> [String] -> Q Dec
generateToJSONInstance name fields props required = do
  let insName = ''ToJSON
      insType = ConT insName
      varType = ConT name
      decType = AppT insType varType
      ctx = []
  toJSOND <- generateToJSONFunction name fields props required
  let decs = [toJSOND]
  return $ InstanceD ctx decType decs

generateToJSONFunction :: Name -> [VarStrictType] -> Properties -> [String] -> Q Dec
generateToJSONFunction _ fields props@(Properties keyval) required = do

  let pair = VarE '(.=)

  let fname = 'toJSON
      arg = mkName "x"
      var = VarE arg
      pat = VarP arg
      list = map
             (\((fieldName, _, _), (jname, _)) -> do
                 let isRequired = elem jname required
                 if isRequired
                   then
                   AppE
                    (ConE 'Just)
                    (AppE
                     (AppE pair (LitE . StringL $ jname))
                     (AppE (VarE fieldName) var))
                   else
                     AppE
                     (AppE
                      (VarE 'fmap)
                      (AppE pair (LitE . StringL $ jname)))
                      (AppE (VarE fieldName) var))
             $ zip fields keyval

  return $ FunD fname [Clause [pat]
           (NormalB $ AppE
                      (VarE 'Aeson.object)
                      (AppE
                       (VarE 'catMaybes)
                       $ ListE list)) []]
