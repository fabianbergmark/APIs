module Data.State.YQL
       ( YQLState(..) ) where

import Network.HTTP.Conduit

class YQLState a where
  yqlStateGetHttpManager :: a -> Manager
