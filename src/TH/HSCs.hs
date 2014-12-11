{-# LANGUAGE TemplateHaskell #-}

module TH.HSCs where

import Language.Haskell.TH

import TH.API
import TH.APIs
import TH.HSC

$(do
     runIO $ putStrLn "HSC generation"
     apis <- generateAPIs "apis"
     generateHSCs apis
     runIO $ putStrLn "..Done"
     return []
 )
