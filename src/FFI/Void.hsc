{-# LANGUAGE ForeignFunctionInterface #-}
module FFI.Void where

import Foreign

import Data.JSON.Void

#include "ffi/c/lib/void.h"

instance Storable Void where
  alignment _ = #{const (offsetof(struct {char x__; Void (y__); }, y__))}
  sizeOf _ = #{size Void}
  peek ptr = return Void
  poke ptr Void = return ()
