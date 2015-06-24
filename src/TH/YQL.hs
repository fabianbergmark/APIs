{-# LANGUAGE RecordWildCards,
             ScopedTypeVariables,
             TemplateHaskell #-}

module TH.YQL(generateYQLs, generateYQL) where

import Control.Applicative ((<$>))
import Control.Monad.Catch (MonadThrow)
import Control.Monad.IO.Class (MonadIO(liftIO))

import Data.Aeson
import Data.Char
import Data.Monoid ((<>))

import Language.Haskell.TH (Body(..), Dec(..),  Pat(..),
                            Pred(..), Q, Type(..), TyVarBndr(..),
                            mkName)

import System.Log.Logger

import Control.Monad.Trans.API

import Data.JSON.Void ()
import Data.Settings.YQL
import Data.State.YQL
import Data.TH.API
import Data.TH.YQL
import Data.TH.Object

import Helper.Name

import YQL

generateYQLs :: [API] -> Q [YQL]
generateYQLs apis = do
  sequence $ generateYQL <$> apis

generateYQL :: API -> Q YQL
generateYQL api = do

  let cc = camelCase . apiName $ api
      name    = (toLower . head $ cc):(tail cc)
      inType  = apiInputType  . apiInput  $ api
      outType = apiOutputType . apiOutput $ api

  pipe <- generateYQLPipe name api

  return $ YQL inType outType pipe

generateYQLPipe :: String -> API -> Q YQLPipe
generateYQLPipe base API {..} = do
  let name = mkName base
      opentable = snd $ apiInputOpenDataTable apiInput
      inType  = apiInputType  $ apiInput
      outType = apiOutputType $ apiOutput

  let r = mkName "r"
      s = mkName "s"
      m = mkName "m"
      a = mkName "a"
      t = AppT (AppT ArrowT (ConT ''YQLSettings)) (AppT (AppT ArrowT inType) (AppT (AppT (AppT (ConT ''APIT) (VarT s)) (VarT m)) (AppT (ConT ''Maybe) outType)))
      t' = ForallT
           [ PlainTV s, PlainTV m, PlainTV a ]
           [ AppT (ConT ''MonadIO) (VarT m)
           , AppT (ConT ''MonadThrow) (VarT m)
           , AppT (ConT ''YQLState) (VarT s) ]
           t
      sig = SigD name t'

  body <-
    [| \_ input -> do
        value <- liftIO . runYQL opentable . toObject $ input
        case fromJSON value of
         Success output -> do
           return . Just $ output
         Error _ -> do
           liftIO $
             errorM
             ("YQL." ++ apiName)
             "Could not decode response body"
           return Nothing |]
  let dec = ValD (VarP name) (NormalB body) []

  return $ YQLPipe name sig dec
