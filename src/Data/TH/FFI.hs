module Data.TH.FFI
       ( FFI(..) ) where

import Language.Haskell.TH

data FFI =
  FFI
  { ffiSignature   :: Dec
  , ffiDeclaration :: Dec
  , ffiExport      :: Dec }
