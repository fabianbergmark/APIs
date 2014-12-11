{-# LANGUAGE TemplateHaskell #-}

module TH.FFIs where

import Language.Haskell.TH

import FFI.Types ()

import TH.API
import TH.APIs
import TH.FFI
import TH.YQLs
import qualified Data.TH.FFI as TH

$(do
     runIO $ putStrLn "FFI generation"
     apis <- generateAPIs "apis"
     ffis <- generateFFIs apis
     runIO . putStrLn $ "..Generated " ++
                        (show . length $ ffis) ++
                        " ffis"
     runIO $ putStrLn "..Done"
     return $ foldr
       (\(TH.FFI sig dec exrt) a ->
         sig:dec:exrt:a)
       [] ffis
 )
