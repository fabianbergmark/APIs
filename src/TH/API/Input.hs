{-# LANGUAGE RecordWildCards,
             TemplateHaskell #-}

module TH.API.Input
       ( generateInput ) where

import Data.Aeson ((.:), (.:?), (.=), FromJSON, parseJSON, ToJSON, toJSON)
import qualified Data.Aeson as Aeson (object, Value(..))
import Data.Char
import Data.Data
import qualified Data.Map as Map (fromList)
import Data.Maybe (catMaybes)
import Data.Time.Calendar (Day)

import Control.Monad
import Control.Applicative((<*>), (<|>), empty, pure)

import Language.Haskell.TH

import System.FilePath (takeBaseName)

import Helper.Name

import Data.OpenDataTable

import Data.TH.API
import Data.TH.Convert
import Data.TH.Object

import Language.JavaScript.Interpret (Primitive)

generateInput :: FilePath -> OpenDataTable -> Q APIInput
generateInput xml opentable = do
  let base = camelCase . takeBaseName $ xml
      name = "Input" ++ base
      tName = mkName name
      selects = [s | (SelectBinding s) <- openDataTableBindings opentable]

  cons <- forM selects $ generateConstructor name
  let dec = DataD [] tName [] cons [''Data, ''Eq, ''Read, ''Show, ''Typeable]

  ins <- generateInstances dec opentable
  return $ APIInput tName (ConT tName) (xml, opentable) (dec:ins)

generateConstructor :: String -> Select -> Q Con
generateConstructor name select = do
  let infos = [info | (InputKey info) <- selectInputs select]

  fields <- forM infos $ \info -> do
    let fieldBase = (toLower . head $ name):(tail name)
        fieldHsName = toName $ inputInfoId info
        fieldTail = (toUpper . head $ fieldHsName):(tail fieldHsName)
        fieldName = fieldBase ++ fieldTail
        fieldStrict = NotStrict
        fieldType = haskellType info
    return (mkName fieldName, fieldStrict, fieldType)
  return $ RecC (mkName name) fields
  where
    toName = map replace
    replace '-' = '_'
    replace a = a

generateInstances :: Dec -> OpenDataTable -> Q [Dec]
generateInstances dec opentable = do
  toJSONI <- generateToJSONInstance dec opentable
  fromJSONI <- generateFromJSONInstance dec opentable
  objectI <- generateObjectInstance dec opentable
  return [toJSONI, fromJSONI, objectI]

generateFromJSONInstance :: Dec -> OpenDataTable -> Q Dec
generateFromJSONInstance dec opentable = do
  let DataD _ name _ _ _ = dec
      insName = ''FromJSON
      insType = ConT insName
      varType = ConT name
      decType = AppT insType varType
      ctx     = []
  parseJSOND <- generateParseJSONFunction dec opentable
  let decs = [parseJSOND]

  return $ InstanceD ctx decType decs

generateParseJSONFunction :: Dec -> OpenDataTable -> Q Dec
generateParseJSONFunction dec opentable = do
  let DataD _ _ _ cons _ = dec

  let selects = [s | (SelectBinding s) <- openDataTableBindings opentable]

  let v = mkName "v"

  alt <- [| (<|>) |]
  alts <- mapM (uncurry $ generateParseJSONAlternative v) $ zip cons selects

  let parse = foldr (\a b -> AppE (AppE alt a) b) (VarE 'empty) alts
      parseC = Clause [ConP 'Aeson.Object [VarP v]] (NormalB parse) []
  let failC  = Clause [WildP] (NormalB (VarE 'mzero)) []

  return $ FunD 'parseJSON [parseC, failC]

generateParseJSONAlternative :: Name -> Con -> Select -> Q Exp
generateParseJSONAlternative v (RecC name _) select = do
  let infos = [i | (InputKey i) <- selectInputs select]

  construct  <- [| (.:)  |]
  mconstruct <- [| (.:?) |]
  star       <- [| (<*>) |]

  let con = AppE (VarE 'pure) (ConE name)
      var = VarE v
      stars = star:stars
      ops = stars
      app a (InputInfo {..}, op) =
          AppE (AppE op a) (AppE (AppE (if inputInfoRequired then construct else mconstruct) var) (LitE $ StringL inputInfoId))
      body = foldl app con $ zip infos ops

  return body
generateParseJSONAlternative _ _ _ = error "Invalid constructor"

generateToJSONInstance :: Dec -> OpenDataTable -> Q Dec
generateToJSONInstance dec opentable = do
  let DataD _ name _ _ _ = dec
      insName = ''ToJSON
      insType = ConT insName
      varType = ConT name
      decType = AppT insType varType
      ctx     = []
  toJSOND <- generateToJSONFunction dec opentable
  let decs = [toJSOND]

  return $ InstanceD ctx decType decs

generateToJSONFunction :: Dec -> OpenDataTable -> Q Dec
generateToJSONFunction dec opentable = do
  let DataD _ _ _ cons _ = dec

  let selects = [s | (SelectBinding s) <- openDataTableBindings opentable]

  clauses <- mapM (uncurry generateToJSONClause) $ zip cons selects

  return $ FunD 'toJSON clauses

generateToJSONClause :: Con -> Select -> Q Clause
generateToJSONClause con select = do
  let infos = [i | (InputKey i) <- selectInputs select]
      RecC conName fields = con

  pair <- [| (.=) |]

  let arg  = mkName "x"
      var  = VarE arg
      pat  = AsP arg (RecP conName [])
      list = map
             (\((fieldName, _, _), info) -> do
                 let isRequired = inputInfoRequired info
                 if isRequired
                   then
                   AppE
                    (ConE 'Just)
                    (AppE
                     (AppE pair (LitE . StringL $ inputInfoId info))
                     (AppE (VarE fieldName) var))
                   else
                     AppE
                     (AppE
                      (VarE 'fmap)
                      (AppE pair (LitE . StringL $ inputInfoId info)))
                      (AppE (VarE fieldName) var))
             $ zip fields infos

  return $ Clause [pat]
           (NormalB $ AppE
                      (VarE 'Aeson.object)
                      (AppE
                       (VarE 'catMaybes)
                       $ ListE list)) []

generateObjectInstance :: Dec -> OpenDataTable -> Q Dec
generateObjectInstance dec opentable = do
  let DataD _ name _ _ _ = dec
      insName = ''Object
      insType = ConT insName
      varType = ConT name
      decType = AppT (AppT (AppT insType varType) (ConT ''String)) (ConT ''Primitive)
      ctx     = []
  toObjectD <- generateToObjectFunction dec opentable
  let decs = [toObjectD]

  return $ InstanceD ctx decType decs

generateToObjectFunction :: Dec -> OpenDataTable -> Q Dec
generateToObjectFunction dec opentable = do
  let DataD _ _ _ cons _ = dec

  let selects = [s | (SelectBinding s) <- openDataTableBindings opentable]

  clauses <- mapM (uncurry generateToObjectClause) $ zip cons selects

  return $ FunD 'toObject clauses

generateToObjectClause :: Con -> Select -> Q Clause
generateToObjectClause con select = do
  let infos = [i | (InputKey i) <- selectInputs select]
      RecC conName fields = con

  pair <- [| \k v -> (k, convert v) |]

  let arg  = mkName "x"
      var  = VarE arg
      pat  = AsP arg (RecP conName [])
      list = map
             (\((fieldName, _, _), info) -> do
                 let isRequired = inputInfoRequired info
                 if isRequired
                   then
                   AppE
                    (ConE 'Just)
                    (AppE
                     (AppE pair (LitE . StringL $ inputInfoId info))
                     (AppE (VarE fieldName) var))
                   else
                     AppE
                     (AppE
                      (VarE 'fmap)
                      (AppE pair (LitE . StringL $ inputInfoId info)))
                      (AppE (VarE fieldName) var))
             $ zip fields infos

  return $ Clause [pat]
           (NormalB $ AppE
                      (VarE 'Map.fromList)
                      (AppE
                       (VarE 'catMaybes)
                       $ ListE list)) []

haskellType :: InputInfo -> Type
haskellType info = contextType dataType
  where
  dataType =
    case (inputInfoType info) of
      InputTypeBool   -> ConT ''Bool
      InputTypeDate   -> ConT ''Day
      InputTypeDouble -> ConT ''Double
      InputTypeFloat  -> ConT ''Float
      InputTypeInt    -> ConT ''Int
      InputTypeString -> ConT ''String
  contextType t =
    case (inputInfoRequired info) of
      True  -> t
      False -> AppT (ConT ''Maybe) t
