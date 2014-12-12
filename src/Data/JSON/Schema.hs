{-# LANGUAGE FlexibleInstances,
             OverloadedStrings,
             ScopedTypeVariables,
             TemplateHaskell #-}

module Data.JSON.Schema
       ( Const(..)
       , ConstSchema
       , HasSchema(..)
       , Properties(..)
       , Schema(..)
       , jsonSchema ) where

import Control.Monad (mzero)

import Data.Aeson (FromJSON(..), ToJSON(..), Value(..),
                   (.:), (.=), object)
import Data.HashMap.Strict (toList)
import Data.Text (Text, pack, unpack)
import qualified Data.Traversable as T

import Language.Haskell.TH.Lift (deriveLift)

data Schema
  = SchemaObject Properties [String]
  | SchemaArray Schema
  | SchemaString
  | SchemaBool
  | SchemaNumber
  | SchemaInt
  | SchemaNull
  deriving (Read, Show, Eq)

newtype Properties =
  Properties [(String, Schema)]
  deriving (Eq, Read, Show)

instance FromJSON Properties where
  parseJSON (Object json) = do
    t <- (flip T.mapM) json $ \v -> parseJSON v
    return . Properties $ map (\(k, v) -> (unpack k, v)) (toList t)
  parseJSON _ = fail "Can't parse JSON object"

instance ToJSON Properties where
  toJSON (Properties props) =
    object $ map (\(k, v) -> (pack k, toJSON v)) props

instance FromJSON Schema where
  parseJSON (Object json) = do
    t :: Text <- json .: "type"
    case t of
      "object" -> do
        p <- json .: "properties"
        p' <- parseJSON p
        r <- json .: "required"
        r' <- parseJSON r
        return $ SchemaObject p' r'
      "array" -> do
        i <- json .: "items"
        a <- parseJSON i
        return $ SchemaArray a
      "string"  -> return SchemaString
      "boolean" -> return SchemaBool
      "number"  -> return SchemaNumber
      "int"     -> return SchemaInt
      "null"    -> return SchemaNull
      _         -> mzero
  parseJSON _ = mzero

instance ToJSON Schema where
  toJSON (SchemaObject props reqs) =
    object [ "properties" .= props
           , "required" .= reqs
           , "type" .= ("object" :: String) ]
  toJSON (SchemaArray item) =
    object [ "items" .= item
           , "type" .= ("array" :: String) ]
  toJSON SchemaString =
    object [ "type" .= ("string" :: String) ]
  toJSON SchemaBool =
    object [ "type" .= ("boolean" :: String) ]
  toJSON SchemaNumber =
    object [ "type" .= ("number" :: String) ]
  toJSON SchemaInt =
    object [ "type" .= ("int" :: String) ]
  toJSON SchemaNull =
    object [ "type" .= ("null" :: String) ]

jsonSchema :: Value -> Schema
jsonSchema (Object o) =
  let
    t = fmap jsonSchema o
    props = Properties $ map (\(k, v) -> (unpack k, v)) (toList t)
    req = map (unpack . fst) (toList t)
  in
   SchemaObject props req

newtype Const a b =
  Const
  { getValue :: b }

type ConstSchema a = Const a Schema

class HasSchema a where
  toSchema :: ConstSchema a

instance HasSchema String where
  toSchema = Const SchemaString

instance HasSchema Bool where
  toSchema = Const SchemaBool

instance HasSchema Double where
  toSchema = Const SchemaNumber

instance HasSchema Int where
  toSchema = Const SchemaInt

$(deriveLift ''Properties)
$(deriveLift ''Schema)
