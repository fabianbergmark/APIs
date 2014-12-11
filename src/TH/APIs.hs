{-# LANGUAGE DeriveDataTypeable,
             FlexibleInstances,
             MultiParamTypeClasses,
             OverloadedStrings,
             TemplateHaskell,
             TypeSynonymInstances #-}

module TH.APIs where

import Language.Haskell.TH

import qualified Data.TH.API as TH
import Data.TH.Convert ()

import TH.API

$(do
     runIO $ putStrLn "API generation"
     apis <- generateAPIs "apis"
     runIO . putStrLn $ "..Generated " ++
                        (show . length $ apis) ++
                        " apis"
     runIO $ putStrLn "..Done"
     return $ foldr
       (\(TH.API _
          (TH.APIInput _ _ _ iDecs)
          (TH.APIOutput _ _ _ oDecs)) a -> iDecs ++ oDecs ++ a)
       [] apis
 )
