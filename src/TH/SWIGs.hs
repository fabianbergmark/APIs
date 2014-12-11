{-# LANGUAGE TemplateHaskell #-}

module TH.SWIGs where

import Language.Haskell.TH

import TH.API
import TH.SWIG

$(do
     runIO $ putStrLn "SWIG generation"
     apis <- generateAPIs "apis"
     generateSWIGs apis
     runIO $ putStrLn "..Done"
     return []
 )
