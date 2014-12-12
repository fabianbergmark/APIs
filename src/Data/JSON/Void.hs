{-# LANGUAGE DeriveDataTypeable #-}

module Data.JSON.Void where

import Prelude
import Data.Aeson
import Data.Data

data Void
  = Void
  deriving (Data, Eq, Read, Show, Typeable)

instance FromJSON Void where
  parseJSON Null = return Void
  parseJSON _    = fail "void"

instance ToJSON Void where
  toJSON _ = Null
