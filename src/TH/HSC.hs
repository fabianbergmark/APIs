{-# LANGUAGE TemplateHaskell #-}

module TH.HSC
       ( generateHSC
       , generateHSCs ) where

import Control.Applicative ((<$>))
import Control.Monad (forM, join)

import Data.List (intercalate)

import Language.Haskell.TH
import Language.Haskell.TH.Syntax

import Data.JSON.Void
import Data.TH.API

generateHSCs :: [API] -> Q ()
generateHSCs apis = do
  structss <- sequence $ generateHeaderStructs <$> apis
  cppStructss <- sequence $ generateCppHeaderStructs <$> apis
  instancess <- sequence $ generateHSCInstances <$> apis

  runIO $ do
    writeHeaderFile $ join structss
    writeCppHeaderFile $ join cppStructss
    writeHSCFile $ join instancess

generateHSC :: API -> Q ()
generateHSC api = do
  structs <- generateHeaderStructs api
  cppStructs <- generateCppHeaderStructs api
  instances <- generateHSCInstances api

  runIO $ do
    writeHeaderFile structs
    writeCppHeaderFile cppStructs
    writeHSCFile instances

writeHeaderFile :: [(String, [(String, String)])] -> IO ()
writeHeaderFile structs = do
  let ifndef = "#ifndef API_DEFINE_TYPES\n" ++
               "#define API_DEFINE_TYPES\n" ++
               "\n" ++
               "#include \"array.h\"\n" ++
               "#include \"maybe.h\"\n" ++
               "#include \"void.h\""
      toDecl = \(tName, fields) ->
                "typedef struct " ++ tName ++ " {\n" ++
               intercalate "\n" (map (\(t, n) -> t ++ " " ++ n ++ ";") fields)
               ++ " } " ++ tName ++ ";"
      decls = intercalate "\n\n" $ reverse $ map toDecl structs
      endif = "#endif"
      header = ifndef ++ "\n\n" ++ decls ++ "\n\n" ++ endif
  writeFile "ffi/c/lib/types.h" header

writeCppHeaderFile :: [(String, [(String, String)])] -> IO ()
writeCppHeaderFile structs = do
  let ifndef = "#ifndef API_DEFINE_TYPES\n" ++
               "#define API_DEFINE_TYPES\n" ++
               "\n" ++
               "#include \"array.hpp\"\n" ++
               "#include \"maybe.hpp\"\n" ++
               "#include \"void.hpp\""
      toDecl = \(tName, fields) ->
                "typedef struct " ++ tName ++ " {\n" ++
               intercalate "\n" (map (\(t, n) -> t ++ " " ++ n ++ ";") fields)
               ++ " } " ++ tName ++ ";"
      decls = intercalate "\n\n" $ reverse $ map toDecl structs
      endif = "#endif"
      header = ifndef ++ "\n\n" ++ decls ++ "\n\n" ++ endif
  writeFile "ffi/cpp/lib/types.hpp" header

writeHSCFile :: String -> IO ()
writeHSCFile instances = do
  let header =
        "{-# LANGUAGE ForeignFunctionInterface #-}\n" ++
        "module FFI.Types where\n" ++
        "\n" ++
        "import Foreign\n" ++
        "import Foreign.C.String\n" ++
        "\n" ++
        "import FFI.Array()\n" ++
        "import FFI.Maybe()\n" ++
        "import FFI.Void()\n" ++
        "\n" ++
        "import TH.APIsNoTH\n" ++
        "\n" ++
        "#include \"ffi/c/lib/types.h\"\n" ++
        "\n"
      hsc = header ++ instances
  writeFile "src/FFI/Types.hsc" hsc

generateHeaderStructs :: API -> Q [(String, [(String, String)])]
generateHeaderStructs (API
                       fname
                       (APIInput _ _ _ iDecs)
                       (APIOutput _ _ _ oDecs)) = do
  iStructs <- forM iDecs generateStruct
  oStructs <- forM oDecs generateStruct

  let structs = filter (not . null . fst) $ iStructs ++ oStructs
  return structs

generateStruct :: Dec -> Q (String, [(String, String)])
generateStruct (DataD _ (Name (OccName tName) _) _ [RecC _ fields] _) = do
  structFields <- mapM hsTypeToCField fields
  return (tName, structFields)
generateStruct (DataD _ (Name (OccName tName) _) _ [NormalC _ []] _) = do
  return (tName, [])
generateStruct dec = return ("", [])

hsTypeToCField :: (Name, Strict, Type) -> Q (String, String)
hsTypeToCField (Name (OccName fName) _, _, ConT hs)
  | hs == ''Int = return $ ("int", fName)
  | hs == ''Double = return $ ("double", fName)
  | hs == ''Bool = return $ ("int", fName)
  | hs == ''String = return $ ("char*", fName)
  | hs == ''Void = return $ ("Void", fName)
  | otherwise = do
      info <- reify hs
      case info of
       (TyConI dec) -> do
         (t, _) <- generateStruct dec
         return $ (t, fName)
       _ -> return $ (show info, fName)
hsTypeToCField (name@(Name (OccName fName) _), s, AppT ListT hs) = do
  (t, n) <- hsTypeToCField (name, s, hs)
  return ("Array", fName)
hsTypeToCField (name@(Name (OccName fName) _), s, AppT (ConT f) hs)
  | f == ''Maybe = do
      (t, n) <- hsTypeToCField (name, s, hs)
      return ("Maybe", fName)
  | otherwise = error $ "Unsupported boxing type: " ++ show f
hsTypeToCField (fName, _, hs) = error $ "Unsupported type: " ++ show hs

generateCppHeaderStructs :: API -> Q [(String, [(String, String)])]
generateCppHeaderStructs (API
                       fname
                       (APIInput _ _ _ iDecs)
                       (APIOutput _ _ _ oDecs)) = do
  iStructs <- forM iDecs generateCppStruct
  oStructs <- forM oDecs generateCppStruct

  let structs = filter (not . null . fst) $ iStructs ++ oStructs
  return structs

generateCppStruct :: Dec -> Q (String, [(String, String)])
generateCppStruct (DataD _ (Name (OccName tName) _) _ [RecC _ fields] _) = do
  structFields <- mapM hsTypeToCppField fields
  return (tName, structFields)
generateCppStruct (DataD _ (Name (OccName tName) _) _ [NormalC _ []] _) = do
  return (tName, [])
generateCppStruct dec = return ("", [])

hsTypeToCppField :: (Name, Strict, Type) -> Q (String, String)
hsTypeToCppField (Name (OccName fName) _, _, ConT hs)
  | hs == ''Int = return $ ("int", fName)
  | hs == ''Double = return $ ("double", fName)
  | hs == ''Bool = return $ ("int", fName)
  | hs == ''String = return $ ("char*", fName)
  | hs == ''Void = return $ ("Void", fName)
  | otherwise = do
      info <- reify hs
      case info of
       (TyConI dec) -> do
         (t, _) <- generateCppStruct dec
         return $ (t, fName)
       _ -> return $ (show info, fName)
hsTypeToCppField (name@(Name (OccName fName) _), s, AppT ListT hs) = do
  (t, n) <- hsTypeToCppField (name, s, hs)
  return ("Array<" ++ t ++ ">", fName)
hsTypeToCppField (name@(Name (OccName fName) _), s, AppT (ConT f) hs)
  | f == ''Maybe = do
      (t, n) <- hsTypeToCppField (name, s, hs)
      return ("Maybe<" ++ t ++ ">", fName)
  | otherwise = error $ "Unsupported boxing type: " ++ show f
hsTypeToCppField (fName, _, hs) = error $ "Unsupported type: " ++ show hs

generateHSCInstances :: API -> Q String
generateHSCInstances (API
                     fname
                     (APIInput _ _ _ iDecs)
                     (APIOutput _ _ _ oDecs)) = do
  iInstances <- forM iDecs generateStorableInstance
  oInstances <- forM oDecs generateStorableInstance

  let instances = join iInstances ++ join oInstances
  return instances

generateStorableInstance :: Dec -> Q String
generateStorableInstance dec@(DataD _ name _ cons _) = do
  (sName, sFields) <- generateStruct dec
  let tName = show name
      hscInstance =
        "instance Storable " ++ tName ++ " where\n" ++
        "  alignment _ = #{const (offsetof(struct {char x__; " ++ tName ++ " (y__); }, y__))}\n" ++
        "  sizeOf _ = #{size " ++ tName ++ "}\n" ++
        "  peek ptr = do\n" ++
        snd (foldl
             (\(n, a) (t, fName) ->
               (n+1, a ++
                     "    d" ++ (show n) ++ " <- " ++
                     case t of
                      "char*" ->
                        "#{peek " ++ sName ++ ", " ++ fName ++ "} ptr >>= peekCString\n"
                      _ ->
                        "#{peek " ++ sName ++ ", " ++ fName ++ "} ptr\n"))
             (0 :: Int, "")
             sFields) ++
        "    return $ " ++ tName ++
        snd (foldl
             (\(n, a) _ -> (n+1, a ++ " d" ++ (show n)))
             (0 :: Int, "")
             sFields) ++ "\n" ++
        "  poke ptr (" ++
        tName ++
        snd (foldl
             (\(n, a) (t, fName) -> (n+1, a ++  " d" ++ show n))
             (0 :: Int, "")
             sFields) ++
        ") = do\n" ++
        snd (foldl
            (\(n, a) (t, fName) ->
              (n+1, a ++
                    case t of
                     "char*" ->
                       "    newCString d" ++ show n ++ " >>= #{poke " ++ sName ++ ", " ++ fName ++ "} ptr\n"
                     _ ->
                       "    #{poke " ++ sName ++ ", " ++ fName ++ "} ptr d" ++ show n ++ "\n"))
            (0 :: Int, "")
            sFields) ++
        "    return ()\n"
  return hscInstance
generateStorableInstance _ = return ""
