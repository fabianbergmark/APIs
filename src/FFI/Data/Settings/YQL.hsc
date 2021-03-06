{-# LANGUAGE ForeignFunctionInterface #-}
module FFI.Data.Settings.YQL where

import Foreign

import Data.Settings.YQL

import FFI.Array()

#include "ffi/c/lib/yql.h"

instance Storable YQLSettings where
  alignment _ = #{const (offsetof(struct {char x__; YQLSettings (y__); }, y__))}
  sizeOf _ = #{size YQLSettings}
  peek ptr = return YQLSettings
  poke ptr YQLSettings = return ()
