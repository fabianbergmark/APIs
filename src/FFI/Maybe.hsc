{-# LANGUAGE ForeignFunctionInterface,
             ScopedTypeVariables #-}
module FFI.Maybe where

import Foreign
import Foreign.C.Types

#let alignment t = "%lu", (unsigned long)offsetof(struct {char x__; t (y__); }, y__)

#include "/home/fabian/src/API/API-APIs/ffi/c/lib/maybe.h"

instance Storable a => Storable (Maybe a) where
  alignment _ = #{alignment Maybe}
  sizeOf _ = #{size Maybe}
  peek ptr = do
    j :: CInt <- #{peek Maybe, just} ptr
    case j of
     0 -> return Nothing
     _ -> do
       d <- #{peek Maybe, data} ptr
       return $ Just d
  poke ptr Nothing = do
    #{poke Maybe, just} ptr (0 :: CInt)
    #{poke Maybe, data} ptr (0 :: CInt)
  poke ptr (Just d) = do
    dataPtr <- new d
    #{poke Maybe, just} ptr (1 :: CInt)
    #{poke Maybe, data} ptr dataPtr
