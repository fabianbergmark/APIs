{-# LANGUAGE ForeignFunctionInterface #-}
module FFI.Void where

import Foreign

import Data.JSON.Void

#let alignment t = "%lu", (unsigned long)offsetof(struct {char x__; t (y__); }, y__)

#include "/home/fabian/src/API/API-APIs/ffi/c/lib/void.h"

instance Storable Void where
  alignment _ = #{alignment Void}
  sizeOf _ = #{size Void}
  peek ptr = return Void
  poke ptr Void = return ()
