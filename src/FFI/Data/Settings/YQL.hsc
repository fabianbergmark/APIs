{-# LANGUAGE ForeignFunctionInterface #-}
module FFI.Data.Settings.YQL where

import Foreign

import Data.Settings.YQL

import FFI.Array()

#let alignment t = "%lu", (unsigned long)offsetof(struct {char x__; t (y__); }, y__)

#include "/home/fabian/src/API/API-APIs/ffi/c/lib/yql.h"

instance Storable YQLSettings where
  alignment _ = #{alignment YQLSettings}
  sizeOf _ = #{size YQLSettings}
  peek ptr = return YQLSettings
  poke ptr YQLSettings = return ()
