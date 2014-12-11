{-# LANGUAGE FlexibleContexts,
             FlexibleInstances,
             UndecidableInstances #-}

module Data.TH.Convert
       ( Convert(..) ) where

import Language.JavaScript.Interpret
import Language.JavaScript.SubType

class Convert a where
  convert :: a -> Primitive

instance Convert Double where
  convert = inj . Number

instance Convert Int where
  convert = inj . Number . fromIntegral

instance Convert Null where
  convert = inj

instance Convert Undefined where
  convert = inj

instance Convert Number where
  convert = inj

instance Convert String where
  convert = inj

instance Convert Bool where
  convert = inj
