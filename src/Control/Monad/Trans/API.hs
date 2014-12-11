module Control.Monad.Trans.API
       ( APIT
       , runAPIT ) where

import Control.Monad.State.Strict

type APIT s m = StateT s m

runAPIT :: s -> APIT s m a -> m (a, s)
runAPIT = flip runStateT
