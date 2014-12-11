{-# LANGUAGE MultiParamTypeClasses #-}

module Data.TH.Object
       ( Object(..) ) where

import Data.Map

class Object a k v where
  toObject :: a -> Map k v
