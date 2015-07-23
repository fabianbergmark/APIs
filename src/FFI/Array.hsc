{-# LANGUAGE ForeignFunctionInterface #-}
module FFI.Array where

import Foreign

#include "ffi/c/lib/array.h"

instance Storable a => Storable [a] where
  alignment _ = #{const (offsetof(struct {char x__; Array (y__); }, y__))}
  sizeOf _ = #{size Array}
  peek ptr = do
    l <- #{peek Array, length} ptr
    let arrPtr = #{ptr Array, array} ptr
    peekArray l arrPtr
  poke ptr ls = do
    arrPtr <- newArray ls
    #{poke Array, length} ptr $ length ls
    #{poke Array, array} ptr arrPtr
