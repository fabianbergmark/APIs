{-# LANGUAGE OverloadedStrings,
             TemplateHaskell #-}

module TH.YQLs where

import Language.Haskell.TH

import TH.API
import TH.APIs
import TH.YQL
import qualified Data.TH.YQL as TH

$(do
     runIO $ putStrLn "YQL generation"
     apis <- generateAPIs "apis"
     yqls <- generateYQLs apis
     runIO . putStrLn $ "..Generated " ++
                        (show . length $ yqls) ++
                        " yqls"
     runIO $ putStrLn "..Done"
     return $ foldr
       (\(TH.YQL _ _
          (TH.YQLPipe _ pSig pDec)) a ->
         pSig:pDec:a)
       [] yqls
 )
