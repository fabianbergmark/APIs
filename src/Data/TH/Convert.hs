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
  convert = r.r.inj . Number

instance Convert Int where
  convert = r.r.inj . Number . fromIntegral

instance Convert Null where
  convert = inj

instance Convert Undefined where
  convert = r.inj

instance Convert Number where
  convert = r.r.inj

instance Convert String where
  convert = r.r.r.inj

instance Convert Bool where
  convert = r.r.r.r.inj
