{-# LANGUAGE OverloadedStrings #-}

module Data.Settings.YQL
       ( YQLSettings(..) ) where

import Control.Applicative ((<$>))

import Data.Aeson

import Data.JSON.Schema

data YQLSettings =
  YQLSettings
  { yqlSettingsUrl :: String }
  deriving (Eq, Read, Show)

instance FromJSON YQLSettings where
  parseJSON (Object v) =
    YQLSettings <$>
    v .: "url"
  parseJSON _ = fail "Unable to parse YQLSettings"

instance HasSchema YQLSettings where
  toSchema = Const $ SchemaObject props [ "url" ]
    where props = Properties [ ("url", SchemaString) ]
