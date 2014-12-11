{-# LANGUAGE ForeignFunctionInterface #-}
module FFI.Data.Settings.YQL where

import Foreign
import Foreign.C.String

import Data.Settings.YQL

import FFI.Array()

#let alignment t = "%lu", (unsigned long)offsetof(struct {char x__; t (y__); }, y__)

#include "/home/fabian/src/API/API-APIs/ffi/c/lib/yql.h"

instance Storable YQLSettings where
  alignment _ = #{alignment YQLSettings}
  sizeOf _ = #{size YQLSettings}
  peek ptr = do
    cptr <- #{peek YQLSettings, yqlSettingsUrl} ptr
    url <- peekCString cptr
    return $ YQLSettings url
  poke ptr (YQLSettings url) = do
    strPtr <- newCString url
    #{poke YQLSettings, yqlSettingsUrl} ptr strPtr
