{-# LANGUAGE ForeignFunctionInterface #-}
module FFI.Array where

import Foreign

#let alignment t = "%lu", (unsigned long)offsetof(struct {char x__; t (y__); }, y__)

#include "/home/fabian/src/API/API-APIs/ffi/c/lib/array.h"

instance Storable a => Storable [a] where
  alignment _ = #{alignment Array}
  sizeOf _ = #{size Array}
  peek ptr = do
    l <- #{peek Array, length} ptr
    let arrPtr = #{ptr Array, array} ptr
    peekArray l arrPtr
  poke ptr ls = do
    arrPtr <- newArray ls
    #{poke Array, length} ptr $ length ls
    #{poke Array, array} ptr arrPtr
