{-# LANGUAGE RecordWildCards,
             ScopedTypeVariables,
             TemplateHaskell #-}

module TH.FFI
       ( generateFFI
       , generateFFIs ) where

import Control.Applicative ((<$>))

import Data.Monoid ((<>))

import Foreign.Marshal.Utils
import Foreign.Ptr (Ptr)
import Foreign.Storable (Storable(..))

import Language.Haskell.TH (Body(..), Callconv(..), Dec(..), Exp(..),
                            Foreign(..), Pat(..), Q, Type(..),
                            mkName, runIO)
import Language.Haskell.TH.Syntax (Name(..), OccName(..))

import Network.HTTP.Client.Conduit (newManager, Manager)

import Control.Monad.Trans.API (runAPIT)

import Data.List (intercalate)

import Data.Settings.YQL
import Data.State.YQL
import Data.TH.API
import Data.TH.FFI

import FFI.Data.Settings.YQL ()

import Helper.Name

data State
  = State
    { stateHttpManager :: Manager }

instance YQLState State where
  yqlStateGetHttpManager = stateHttpManager

generateFFIs :: [API] -> Q [FFI]
generateFFIs apis = do
  wrappers <- sequence $ generateFFIWrapper <$> apis
  cppWrappers <- sequence $ generateFFICppWrapper <$> apis

  runIO $ do
    writeHeaderFile wrappers
    writeCppHeaderFile cppWrappers

  sequence $ generateFFI <$> apis

generateFFI :: API -> Q FFI
generateFFI api = do

  let base    = "yql" <> (snakeCase . apiName $ api)
      inType  = apiInputType  . apiInput  $ api
      outType = apiOutputType . apiOutput $ api

  let name = mkName $ base <> "Pipe"
      ffiName = mkName $ base <> "Pipe_ffi"
      ffiT = AppT (AppT ArrowT (AppT (ConT ''Ptr) (ConT ''YQLSettings))) (AppT (AppT ArrowT (AppT (ConT ''Ptr) inType)) (AppT (ConT ''IO) (AppT (ConT ''Ptr) (AppT (ConT ''Maybe) outType))))
      ffiSig = SigD ffiName ffiT
  ffiRun <- [| \pipe ptrSettings ptrInput -> do
                settings <- peek ptrSettings
                input <- peek ptrInput
                let action = pipe settings input
                httpManager <- newManager
                ret <- fst <$> runAPIT action (State httpManager)
                new ret |]
  let ffiBody = AppE ffiRun (VarE name)

  let ffiDec = ValD (VarP ffiName) (NormalB ffiBody) []
      ffiE = ForeignD $ ExportF CCall (show ffiName) ffiName ffiT

  return $ FFI ffiSig ffiDec ffiE

writeHeaderFile :: [String] -> IO ()
writeHeaderFile funs = do
  let ifndef = "#ifndef API_DEFINE_API\n" ++
               "#define API_DEFINE_API\n"
      include = "#include <TH/FFIs_stub.h>\n" ++
                "#include \"array.h\"\n" ++
                "#include \"maybe.h\"\n" ++
                "#include \"types.h\"\n" ++
                "#include \"void.h\"\n" ++
                "#include \"yql.h\"\n"
      endif = "#endif"
      header = intercalate "\n" [ ifndef
                                , include
                                , intercalate "\n" funs
                                , endif ]
  writeFile "ffi/c/lib/api.h" header

generateFFIWrapper :: API -> Q String
generateFFIWrapper api = do
  let base    = "yql" <> (snakeCase . apiName $ api)
      (ConT (Name (OccName inName) _))  = apiInputType  . apiInput  $ api
      (ConT (Name (OccName outName) _)) = apiOutputType . apiOutput $ api

  let name = base <> "Pipe"
      ffiName = base <> "Pipe_ffi"

  return $
    "Maybe * " ++ name ++ "(YQLSettings *settings, " ++ inName ++ " *input) " ++
    " { return (Maybe *)" ++ ffiName ++ "(settings, input);" ++ " };\n"

writeCppHeaderFile :: [String] -> IO ()
writeCppHeaderFile funs = do
  let ifndef = "#ifndef API_DEFINE_API\n" ++
               "#define API_DEFINE_API\n"
      include = "#include <TH/FFIs_stub.h>\n" ++
                "#include \"array.hpp\"\n" ++
                "#include \"maybe.hpp\"\n" ++
                "#include \"types.hpp\"\n" ++
                "#include \"void.hpp\"\n" ++
                "#include \"yql.hpp\"\n"
      endif = "#endif"
      header = intercalate "\n" [ ifndef
                                , include
                                , intercalate "\n" funs
                                , endif ]
  writeFile "ffi/cpp/lib/api.hpp" header

generateFFICppWrapper :: API -> Q String
generateFFICppWrapper api = do
  let base    = "yql" <> (snakeCase . apiName $ api)
      (ConT (Name (OccName inName) _))  = apiInputType  . apiInput  $ api
      (ConT (Name (OccName outName) _)) = apiOutputType . apiOutput $ api

  let name = base <> "Pipe"
      ffiName = base <> "Pipe_ffi"

  return $
    "Maybe<" ++ outName ++ "> * " ++ name ++ "(YQLSettings *settings, " ++ inName ++ " *input) " ++
    " { return (Maybe<" ++ outName ++ "> *)" ++ ffiName ++ "(settings, input);" ++ " };\n"
