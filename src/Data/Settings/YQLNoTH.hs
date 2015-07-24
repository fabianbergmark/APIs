{-# LANGUAGE OverloadedStrings #-}

module Data.Settings.YQLNoTH
       ( YQLSettings(..) ) where

import Control.Applicative (pure)
import Data.Aeson

import Data.JSON.SchemaNoTH

data YQLSettings =
  YQLSettings
  deriving (Eq, Read, Show)

instance FromJSON YQLSettings where
  parseJSON _ = pure YQLSettings

instance HasSchema YQLSettings where
  toSchema = Const $ SchemaObject (Properties []) []
