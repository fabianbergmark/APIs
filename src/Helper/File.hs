{-# LANGUAGE BangPatterns #-}

module Helper.File(findAPIs, loadAPI) where

import Prelude

import qualified Data.Aeson as Aeson
import Data.Maybe
import qualified Data.ByteString.Lazy.UTF8 as BSL (fromString)

import Control.Applicative ((<$>))
import Control.DeepSeq (rnf)
import Control.Monad (forM)

import System.IO
import System.Directory
import System.FilePath
import System.FilePath.Find

import Text.XML.HXT.Core (runX, readString, withRemoveWS, yes, (>>>))

import Data.OpenDataTable
import Data.JSON.Schema
import Data.OpenDataTable.Parser

findAPIs :: FilePath -> IO [(FilePath, FilePath)]
findAPIs folder = do
  files <- find always (extension ==? ".json") folder
  catMaybes <$> (forM files $ \json -> do
    let xml = replaceExtension json ".xml"
    existsJSON <- doesFileExist json
    existsXML <- doesFileExist xml
    if (existsJSON && existsXML)
      then return $ Just (xml, json)
      else return Nothing)

loadAPI :: (FilePath, FilePath) -> IO (Maybe (OpenDataTable, Schema))
loadAPI (xml, json) = do

  jsonFile <- openFile json ReadMode
  schema <- hGetContents jsonFile
  rnf schema `seq` hClose jsonFile

  xmlFile <- openFile xml ReadMode
  document <- hGetContents xmlFile
  rnf document `seq` hClose xmlFile

  mOpenDataTable <- listToMaybe <$> runX (readString [withRemoveWS yes] document
                                      >>> parseOpenDataTable)

  return $ do
    !o <- mOpenDataTable
    s <- Aeson.decode . BSL.fromString $ schema
    return (o, s)
