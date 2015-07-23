{-# LANGUAGE DeriveDataTypeable,
             FlexibleInstances,
             MultiParamTypeClasses,
             OverloadedStrings,
             TemplateHaskell,
             TypeSynonymInstances #-}

module TH.APIsNoTH where

import Language.Haskell.TH

import qualified Data.TH.Object
import qualified Data.TH.API as TH
import qualified Data.TH.Convert

import qualified Data.Maybe
import qualified Data.Data
import qualified Data.Typeable
import qualified Data.Aeson

import Control.Applicative
import Control.Monad
import Data.Map (fromList)
import qualified Language.JavaScript.Interpret

-- src/TH/APIs.hs:(17,3)-(28,14): Splicing declarations
data InputDropboxFiles
  = InputDropboxFiles {inputDropboxFilesRoot :: String,
                       inputDropboxFilesPath :: String,
                       inputDropboxFilesRev :: Maybe Double,
                       inputDropboxFilesAccess_token :: String}
  deriving (Data.Data.Data,
            Eq,
            Read,
            Show,
            Data.Typeable.Typeable)
instance Data.Aeson.ToJSON InputDropboxFiles where
  toJSON x@(InputDropboxFiles {})
    = Data.Aeson.object
        (Data.Maybe.catMaybes
           [Just
              ((Data.Aeson..=) "root" (inputDropboxFilesRoot x)),
            Just
              ((Data.Aeson..=) "path" (inputDropboxFilesPath x)),
            fmap
              ((Data.Aeson..=) "rev") (inputDropboxFilesRev x),
            Just
              ((Data.Aeson..=)
                 "access_token" (inputDropboxFilesAccess_token x))])
instance Data.Aeson.FromJSON InputDropboxFiles where
  parseJSON
    (Data.Aeson.Object v)
    = (<|>)
        ((<*>)
           ((<*>)
              ((<*>)
                 ((<*>)
                    (pure InputDropboxFiles)
                    ((Data.Aeson..:) v "root"))
                 ((Data.Aeson..:) v "path"))
              ((Data.Aeson..:?) v "rev"))
           ((Data.Aeson..:) v "access_token"))
        empty
  parseJSON _ = mzero
instance Data.TH.Object.Object InputDropboxFiles String Language.JavaScript.Interpret.Primitive where
  toObject x@(InputDropboxFiles {})
    = fromList
        (Data.Maybe.catMaybes
           [Just
              ((\ k_aXZA v_aXZB -> (k_aXZA, Data.TH.Convert.convert v_aXZB))
                 "root" (inputDropboxFilesRoot x)),
            Just
              ((\ k_aXZA v_aXZB -> (k_aXZA, Data.TH.Convert.convert v_aXZB))
                 "path" (inputDropboxFilesPath x)),
            fmap
              ((\ k_aXZA v_aXZB -> (k_aXZA, Data.TH.Convert.convert v_aXZB))
               "rev")
              (inputDropboxFilesRev x),
            Just
              ((\ k_aXZA v_aXZB -> (k_aXZA, Data.TH.Convert.convert v_aXZB))
                 "access_token" (inputDropboxFilesAccess_token x))])
data OutputDropboxFiles
  = OutputDropboxFiles {outputDropboxFilesContent :: String}
  deriving (Data.Data.Data,
            Eq,
            Read,
            Show,
            Data.Typeable.Typeable)
instance Data.Aeson.ToJSON OutputDropboxFiles where
  toJSON x
    = Data.Aeson.object
        (Data.Maybe.catMaybes
           [Just
              ((Data.Aeson..=)
                 "content" (outputDropboxFilesContent x))])
instance Data.Aeson.FromJSON OutputDropboxFiles where
  parseJSON
    (Data.Aeson.Object v)
    = (<*>)
        (pure OutputDropboxFiles)
        ((Data.Aeson..:) v "content")
  parseJSON v
    = fail (show v)
data InputDropboxFilesPut
  = InputDropboxFilesPut {inputDropboxFilesPutRoot :: String,
                          inputDropboxFilesPutPath :: String,
                          inputDropboxFilesPutParam :: Maybe String,
                          inputDropboxFilesPutContent :: String,
                          inputDropboxFilesPutAccess_token :: String}
  deriving (Data.Data.Data,
            Eq,
            Read,
            Show,
            Data.Typeable.Typeable)
instance Data.Aeson.ToJSON InputDropboxFilesPut where
  toJSON x@(InputDropboxFilesPut {})
    = Data.Aeson.object
        (Data.Maybe.catMaybes
           [Just
              ((Data.Aeson..=)
                 "root" (inputDropboxFilesPutRoot x)),
            Just
              ((Data.Aeson..=)
                 "path" (inputDropboxFilesPutPath x)),
            fmap
              ((Data.Aeson..=) "param")
              (inputDropboxFilesPutParam x),
            Just
              ((Data.Aeson..=)
                 "content" (inputDropboxFilesPutContent x)),
            Just
              ((Data.Aeson..=)
                 "access_token" (inputDropboxFilesPutAccess_token x))])
instance Data.Aeson.FromJSON InputDropboxFilesPut where
  parseJSON
    (Data.Aeson.Object v)
    = (<|>)
        ((<*>)
           ((<*>)
              ((<*>)
                 ((<*>)
                    ((<*>)
                       (pure InputDropboxFilesPut)
                       ((Data.Aeson..:) v "root"))
                    ((Data.Aeson..:) v "path"))
                 ((Data.Aeson..:?) v "param"))
              ((Data.Aeson..:) v "content"))
           ((Data.Aeson..:) v "access_token"))
        empty
  parseJSON _ = mzero
instance Data.TH.Object.Object InputDropboxFilesPut String Language.JavaScript.Interpret.Primitive where
  toObject x@(InputDropboxFilesPut {})
    = fromList
        (Data.Maybe.catMaybes
           [Just
              ((\ k_aXZC v_aXZD -> (k_aXZC, Data.TH.Convert.convert v_aXZD))
                 "root" (inputDropboxFilesPutRoot x)),
            Just
              ((\ k_aXZC v_aXZD -> (k_aXZC, Data.TH.Convert.convert v_aXZD))
                 "path" (inputDropboxFilesPutPath x)),
            fmap
              ((\ k_aXZC v_aXZD -> (k_aXZC, Data.TH.Convert.convert v_aXZD))
                 "param")
              (inputDropboxFilesPutParam x),
            Just
              ((\ k_aXZC v_aXZD -> (k_aXZC, Data.TH.Convert.convert v_aXZD))
                 "content" (inputDropboxFilesPutContent x)),
            Just
              ((\ k_aXZC v_aXZD -> (k_aXZC, Data.TH.Convert.convert v_aXZD))
                 "access_token" (inputDropboxFilesPutAccess_token x))])
data OutputDropboxFilesPut
  = OutputDropboxFilesPut {outputDropboxFilesPutPath :: String,
                           outputDropboxFilesPutSize :: String,
                           outputDropboxFilesPutIcon :: String,
                           outputDropboxFilesPutMime_type :: String,
                           outputDropboxFilesPutRoot :: String,
                           outputDropboxFilesPutClient_mtime :: String,
                           outputDropboxFilesPutThumb_exists :: Bool,
                           outputDropboxFilesPutModified :: String,
                           outputDropboxFilesPutIs_dir :: Bool,
                           outputDropboxFilesPutRevision :: Double,
                           outputDropboxFilesPutRev :: String,
                           outputDropboxFilesPutBytes :: Double}
  deriving (Data.Data.Data,
            Eq,
            Read,
            Show,
            Data.Typeable.Typeable)
instance Data.Aeson.ToJSON OutputDropboxFilesPut where
  toJSON x
    = Data.Aeson.object
        (Data.Maybe.catMaybes
           [Just
              ((Data.Aeson..=)
                 "path" (outputDropboxFilesPutPath x)),
            Just
              ((Data.Aeson..=)
                 "size" (outputDropboxFilesPutSize x)),
            Just
              ((Data.Aeson..=)
                 "icon" (outputDropboxFilesPutIcon x)),
            Just
              ((Data.Aeson..=)
                 "mime_type" (outputDropboxFilesPutMime_type x)),
            Just
              ((Data.Aeson..=)
                 "root" (outputDropboxFilesPutRoot x)),
            Just
              ((Data.Aeson..=)
                 "client_mtime" (outputDropboxFilesPutClient_mtime x)),
            Just
              ((Data.Aeson..=)
                 "thumb_exists" (outputDropboxFilesPutThumb_exists x)),
            Just
              ((Data.Aeson..=)
                 "modified" (outputDropboxFilesPutModified x)),
            Just
              ((Data.Aeson..=)
                 "is_dir" (outputDropboxFilesPutIs_dir x)),
            Just
              ((Data.Aeson..=)
                 "revision" (outputDropboxFilesPutRevision x)),
            Just
              ((Data.Aeson..=)
                 "rev" (outputDropboxFilesPutRev x)),
            Just
              ((Data.Aeson..=)
                 "bytes" (outputDropboxFilesPutBytes x))])
instance Data.Aeson.FromJSON OutputDropboxFilesPut where
  parseJSON
    (Data.Aeson.Object v)
    = (<*>)
        ((<*>)
           ((<*>)
              ((<*>)
                 ((<*>)
                    ((<*>)
                       ((<*>)
                          ((<*>)
                             ((<*>)
                                ((<*>)
                                   ((<*>)
                                      ((<*>)
                                         (pure OutputDropboxFilesPut)
                                         ((Data.Aeson..:) v "path"))
                                      ((Data.Aeson..:) v "size"))
                                   ((Data.Aeson..:) v "icon"))
                                ((Data.Aeson..:) v "mime_type"))
                             ((Data.Aeson..:) v "root"))
                          ((Data.Aeson..:) v "client_mtime"))
                       ((Data.Aeson..:) v "thumb_exists"))
                    ((Data.Aeson..:) v "modified"))
                 ((Data.Aeson..:) v "is_dir"))
              ((Data.Aeson..:) v "revision"))
           ((Data.Aeson..:) v "rev"))
        ((Data.Aeson..:) v "bytes")
  parseJSON v
    = fail (show v)
data InputDropboxMetadata
  = InputDropboxMetadata {inputDropboxMetadataPath :: String,
                          inputDropboxMetadataRoot :: Maybe String,
                          inputDropboxMetadataFile_limit :: Maybe Double,
                          inputDropboxMetadataHash :: Maybe String,
                          inputDropboxMetadataList :: Maybe Bool,
                          inputDropboxMetadataInclude_deleted :: Maybe Bool,
                          inputDropboxMetadataRev :: Maybe Double,
                          inputDropboxMetadataLocale :: Maybe String,
                          inputDropboxMetadataInclude_media_info :: Maybe Bool,
                          inputDropboxMetadataAccess_token :: String}
  deriving (Data.Data.Data,
            Eq,
            Read,
            Show,
            Data.Typeable.Typeable)
instance Data.Aeson.ToJSON InputDropboxMetadata where
  toJSON x@(InputDropboxMetadata {})
    = Data.Aeson.object
        (Data.Maybe.catMaybes
           [Just
              ((Data.Aeson..=)
                 "path" (inputDropboxMetadataPath x)),
            fmap
              ((Data.Aeson..=) "root")
              (inputDropboxMetadataRoot x),
            fmap
              ((Data.Aeson..=) "file_limit")
              (inputDropboxMetadataFile_limit x),
            fmap
              ((Data.Aeson..=) "hash")
              (inputDropboxMetadataHash x),
            fmap
              ((Data.Aeson..=) "list")
              (inputDropboxMetadataList x),
            fmap
              ((Data.Aeson..=) "include_deleted")
              (inputDropboxMetadataInclude_deleted x),
            fmap
              ((Data.Aeson..=) "rev")
              (inputDropboxMetadataRev x),
            fmap
              ((Data.Aeson..=) "locale")
              (inputDropboxMetadataLocale x),
            fmap
              ((Data.Aeson..=) "include_media_info")
              (inputDropboxMetadataInclude_media_info x),
            Just
              ((Data.Aeson..=)
                 "access_token" (inputDropboxMetadataAccess_token x))])
instance Data.Aeson.FromJSON InputDropboxMetadata where
  parseJSON
    (Data.Aeson.Object v)
    = (<|>)
        ((<*>)
           ((<*>)
              ((<*>)
                 ((<*>)
                    ((<*>)
                       ((<*>)
                          ((<*>)
                             ((<*>)
                                ((<*>)
                                   ((<*>)
                                      (pure InputDropboxMetadata)
                                      ((Data.Aeson..:) v "path"))
                                   ((Data.Aeson..:?) v "root"))
                                ((Data.Aeson..:?) v "file_limit"))
                             ((Data.Aeson..:?) v "hash"))
                          ((Data.Aeson..:?) v "list"))
                       ((Data.Aeson..:?) v "include_deleted"))
                    ((Data.Aeson..:?) v "rev"))
                 ((Data.Aeson..:?) v "locale"))
              ((Data.Aeson..:?) v "include_media_info"))
           ((Data.Aeson..:) v "access_token"))
        empty
  parseJSON _ = mzero
instance Data.TH.Object.Object InputDropboxMetadata String Language.JavaScript.Interpret.Primitive where
  toObject x@(InputDropboxMetadata {})
    = fromList
        (Data.Maybe.catMaybes
           [Just
              ((\ k_aXZE v_aXZF -> (k_aXZE, Data.TH.Convert.convert v_aXZF))
                 "path" (inputDropboxMetadataPath x)),
            fmap
              ((\ k_aXZE v_aXZF -> (k_aXZE, Data.TH.Convert.convert v_aXZF))
                 "root")
              (inputDropboxMetadataRoot x),
            fmap
              ((\ k_aXZE v_aXZF -> (k_aXZE, Data.TH.Convert.convert v_aXZF))
                 "file_limit")
              (inputDropboxMetadataFile_limit x),
            fmap
              ((\ k_aXZE v_aXZF -> (k_aXZE, Data.TH.Convert.convert v_aXZF))
                 "hash")
              (inputDropboxMetadataHash x),
            fmap
              ((\ k_aXZE v_aXZF -> (k_aXZE, Data.TH.Convert.convert v_aXZF))
                 "list")
              (inputDropboxMetadataList x),
            fmap
              ((\ k_aXZE v_aXZF -> (k_aXZE, Data.TH.Convert.convert v_aXZF))
                 "include_deleted")
              (inputDropboxMetadataInclude_deleted x),
            fmap
              ((\ k_aXZE v_aXZF -> (k_aXZE, Data.TH.Convert.convert v_aXZF))
               "rev")
              (inputDropboxMetadataRev x),
            fmap
              ((\ k_aXZE v_aXZF -> (k_aXZE, Data.TH.Convert.convert v_aXZF))
                 "locale")
              (inputDropboxMetadataLocale x),
            fmap
              ((\ k_aXZE v_aXZF -> (k_aXZE, Data.TH.Convert.convert v_aXZF))
                 "include_media_info")
              (inputDropboxMetadataInclude_media_info x),
            Just
              ((\ k_aXZE v_aXZF -> (k_aXZE, Data.TH.Convert.convert v_aXZF))
                 "access_token" (inputDropboxMetadataAccess_token x))])
data OutputDropboxMetadata
  = OutputDropboxMetadata {outputDropboxMetadataHash :: String,
                           outputDropboxMetadataContents :: [OutputDropboxMetadataContents],
                           outputDropboxMetadataPath :: String,
                           outputDropboxMetadataSize :: String,
                           outputDropboxMetadataIs_deleted :: Maybe Bool,
                           outputDropboxMetadataIcon :: String,
                           outputDropboxMetadataRoot :: String,
                           outputDropboxMetadataClient_mtime :: Maybe String,
                           outputDropboxMetadataThumb_exists :: Bool,
                           outputDropboxMetadataModified :: Maybe String,
                           outputDropboxMetadataIs_dir :: Bool,
                           outputDropboxMetadataRev :: Maybe String,
                           outputDropboxMetadataBytes :: Double}
  deriving (Data.Data.Data,
            Eq,
            Read,
            Show,
            Data.Typeable.Typeable)
instance Data.Aeson.ToJSON OutputDropboxMetadata where
  toJSON x
    = Data.Aeson.object
        (Data.Maybe.catMaybes
           [Just
              ((Data.Aeson..=)
                 "hash" (outputDropboxMetadataHash x)),
            Just
              ((Data.Aeson..=)
                 "contents" (outputDropboxMetadataContents x)),
            Just
              ((Data.Aeson..=)
                 "path" (outputDropboxMetadataPath x)),
            Just
              ((Data.Aeson..=)
                 "size" (outputDropboxMetadataSize x)),
            fmap
              ((Data.Aeson..=) "is_deleted")
              (outputDropboxMetadataIs_deleted x),
            Just
              ((Data.Aeson..=)
                 "icon" (outputDropboxMetadataIcon x)),
            Just
              ((Data.Aeson..=)
                 "root" (outputDropboxMetadataRoot x)),
            fmap
              ((Data.Aeson..=) "client_mtime")
              (outputDropboxMetadataClient_mtime x),
            Just
              ((Data.Aeson..=)
                 "thumb_exists" (outputDropboxMetadataThumb_exists x)),
            fmap
              ((Data.Aeson..=) "modified")
              (outputDropboxMetadataModified x),
            Just
              ((Data.Aeson..=)
                 "is_dir" (outputDropboxMetadataIs_dir x)),
            fmap
              ((Data.Aeson..=) "rev")
              (outputDropboxMetadataRev x),
            Just
              ((Data.Aeson..=)
                 "bytes" (outputDropboxMetadataBytes x))])
instance Data.Aeson.FromJSON OutputDropboxMetadata where
  parseJSON
    (Data.Aeson.Object v)
    = (<*>)
        ((<*>)
           ((<*>)
              ((<*>)
                 ((<*>)
                    ((<*>)
                       ((<*>)
                          ((<*>)
                             ((<*>)
                                ((<*>)
                                   ((<*>)
                                      ((<*>)
                                         ((<*>)
                                            (pure OutputDropboxMetadata)
                                            ((Data.Aeson..:) v "hash"))
                                         ((Data.Aeson..:) v "contents"))
                                      ((Data.Aeson..:) v "path"))
                                   ((Data.Aeson..:) v "size"))
                                ((Data.Aeson..:?) v "is_deleted"))
                             ((Data.Aeson..:) v "icon"))
                          ((Data.Aeson..:) v "root"))
                       ((Data.Aeson..:?) v "client_mtime"))
                    ((Data.Aeson..:) v "thumb_exists"))
                 ((Data.Aeson..:?) v "modified"))
              ((Data.Aeson..:) v "is_dir"))
           ((Data.Aeson..:?) v "rev"))
        ((Data.Aeson..:) v "bytes")
  parseJSON v
    = fail (show v)
data OutputDropboxMetadataContents
  = OutputDropboxMetadataContents {outputDropboxMetadataContentsPath :: String,
                                   outputDropboxMetadataContentsSize :: String,
                                   outputDropboxMetadataContentsIcon :: String,
                                   outputDropboxMetadataContentsMime_type :: Maybe String,
                                   outputDropboxMetadataContentsRoot :: String,
                                   outputDropboxMetadataContentsClient_mtime :: Maybe String,
                                   outputDropboxMetadataContentsThumb_exists :: Bool,
                                   outputDropboxMetadataContentsModified :: String,
                                   outputDropboxMetadataContentsIs_dir :: Bool,
                                   outputDropboxMetadataContentsRevision :: Double,
                                   outputDropboxMetadataContentsRev :: String,
                                   outputDropboxMetadataContentsBytes :: Double}
  deriving (Data.Data.Data,
            Eq,
            Read,
            Show,
            Data.Typeable.Typeable)
instance Data.Aeson.ToJSON OutputDropboxMetadataContents where
  toJSON x
    = Data.Aeson.object
        (Data.Maybe.catMaybes
           [Just
              ((Data.Aeson..=)
                 "path" (outputDropboxMetadataContentsPath x)),
            Just
              ((Data.Aeson..=)
                 "size" (outputDropboxMetadataContentsSize x)),
            Just
              ((Data.Aeson..=)
                 "icon" (outputDropboxMetadataContentsIcon x)),
            fmap
              ((Data.Aeson..=) "mime_type")
              (outputDropboxMetadataContentsMime_type x),
            Just
              ((Data.Aeson..=)
                 "root" (outputDropboxMetadataContentsRoot x)),
            fmap
              ((Data.Aeson..=) "client_mtime")
              (outputDropboxMetadataContentsClient_mtime x),
            Just
              ((Data.Aeson..=)
                 "thumb_exists" (outputDropboxMetadataContentsThumb_exists x)),
            Just
              ((Data.Aeson..=)
                 "modified" (outputDropboxMetadataContentsModified x)),
            Just
              ((Data.Aeson..=)
                 "is_dir" (outputDropboxMetadataContentsIs_dir x)),
            Just
              ((Data.Aeson..=)
                 "revision" (outputDropboxMetadataContentsRevision x)),
            Just
              ((Data.Aeson..=)
                 "rev" (outputDropboxMetadataContentsRev x)),
            Just
              ((Data.Aeson..=)
                 "bytes" (outputDropboxMetadataContentsBytes x))])
instance Data.Aeson.FromJSON OutputDropboxMetadataContents where
  parseJSON
    (Data.Aeson.Object v)
    = (<*>)
        ((<*>)
           ((<*>)
              ((<*>)
                 ((<*>)
                    ((<*>)
                       ((<*>)
                          ((<*>)
                             ((<*>)
                                ((<*>)
                                   ((<*>)
                                      ((<*>)
                                         (pure OutputDropboxMetadataContents)
                                         ((Data.Aeson..:) v "path"))
                                      ((Data.Aeson..:) v "size"))
                                   ((Data.Aeson..:) v "icon"))
                                ((Data.Aeson..:?) v "mime_type"))
                             ((Data.Aeson..:) v "root"))
                          ((Data.Aeson..:?) v "client_mtime"))
                       ((Data.Aeson..:) v "thumb_exists"))
                    ((Data.Aeson..:) v "modified"))
                 ((Data.Aeson..:) v "is_dir"))
              ((Data.Aeson..:) v "revision"))
           ((Data.Aeson..:) v "rev"))
        ((Data.Aeson..:) v "bytes")
  parseJSON v
    = fail (show v)
data InputFacebookGraphUserFeed
  = InputFacebookGraphUserFeed {inputFacebookGraphUserFeedUser_id :: String,
                                inputFacebookGraphUserFeedAccess_token :: String}
  deriving (Data.Data.Data,
            Eq,
            Read,
            Show,
            Data.Typeable.Typeable)
instance Data.Aeson.ToJSON InputFacebookGraphUserFeed where
  toJSON x@(InputFacebookGraphUserFeed {})
    = Data.Aeson.object
        (Data.Maybe.catMaybes
           [Just
              ((Data.Aeson..=)
                 "user_id" (inputFacebookGraphUserFeedUser_id x)),
            Just
              ((Data.Aeson..=)
                 "access_token" (inputFacebookGraphUserFeedAccess_token x))])
instance Data.Aeson.FromJSON InputFacebookGraphUserFeed where
  parseJSON
    (Data.Aeson.Object v)
    = (<|>)
        ((<*>)
           ((<*>)
              (pure InputFacebookGraphUserFeed)
              ((Data.Aeson..:) v "user_id"))
           ((Data.Aeson..:) v "access_token"))
        empty
  parseJSON _ = mzero
instance Data.TH.Object.Object InputFacebookGraphUserFeed String Language.JavaScript.Interpret.Primitive where
  toObject x@(InputFacebookGraphUserFeed {})
    = fromList
        (Data.Maybe.catMaybes
           [Just
              ((\ k_aXZG v_aXZH -> (k_aXZG, Data.TH.Convert.convert v_aXZH))
                 "user_id" (inputFacebookGraphUserFeedUser_id x)),
            Just
              ((\ k_aXZG v_aXZH -> (k_aXZG, Data.TH.Convert.convert v_aXZH))
                 "access_token" (inputFacebookGraphUserFeedAccess_token x))])
data OutputFacebookGraphUserFeed
  = OutputFacebookGraphUserFeed {outputFacebookGraphUserFeedData :: [OutputFacebookGraphUserFeedData],
                                 outputFacebookGraphUserFeedPaging :: OutputFacebookGraphUserFeedPaging}
  deriving (Data.Data.Data,
            Eq,
            Read,
            Show,
            Data.Typeable.Typeable)
instance Data.Aeson.ToJSON OutputFacebookGraphUserFeed where
  toJSON x
    = Data.Aeson.object
        (Data.Maybe.catMaybes
           [Just
              ((Data.Aeson..=)
                 "data" (outputFacebookGraphUserFeedData x)),
            Just
              ((Data.Aeson..=)
                 "paging" (outputFacebookGraphUserFeedPaging x))])
instance Data.Aeson.FromJSON OutputFacebookGraphUserFeed where
  parseJSON
    (Data.Aeson.Object v)
    = (<*>)
        ((<*>)
           (pure OutputFacebookGraphUserFeed)
           ((Data.Aeson..:) v "data"))
        ((Data.Aeson..:) v "paging")
  parseJSON v
    = fail (show v)
data OutputFacebookGraphUserFeedData
  = OutputFacebookGraphUserFeedData {outputFacebookGraphUserFeedDataObject_id :: Maybe String,
                                     outputFacebookGraphUserFeedDataApplication :: OutputFacebookGraphUserFeedDataApplication,
                                     outputFacebookGraphUserFeedDataActions :: [OutputFacebookGraphUserFeedDataActions],
                                     outputFacebookGraphUserFeedDataLink :: Maybe String,
                                     outputFacebookGraphUserFeedDataStatus_type :: String,
                                     outputFacebookGraphUserFeedDataIcon :: Maybe String,
                                     outputFacebookGraphUserFeedDataCaption :: Maybe String,
                                     outputFacebookGraphUserFeedDataPrivacy :: OutputFacebookGraphUserFeedDataPrivacy,
                                     outputFacebookGraphUserFeedDataFrom :: OutputFacebookGraphUserFeedDataFrom,
                                     outputFacebookGraphUserFeedDataPicture :: Maybe String,
                                     outputFacebookGraphUserFeedDataUpdated_time :: String,
                                     outputFacebookGraphUserFeedDataName :: Maybe String,
                                     outputFacebookGraphUserFeedDataIs_hidden :: Maybe Bool,
                                     outputFacebookGraphUserFeedDataCreated_time :: String,
                                     outputFacebookGraphUserFeedDataSource :: Maybe String,
                                     outputFacebookGraphUserFeedDataId :: String,
                                     outputFacebookGraphUserFeedDataType :: String,
                                     outputFacebookGraphUserFeedDataMessage :: String,
                                     outputFacebookGraphUserFeedDataDescription :: Maybe String}
  deriving (Data.Data.Data,
            Eq,
            Read,
            Show,
            Data.Typeable.Typeable)
instance Data.Aeson.ToJSON OutputFacebookGraphUserFeedData where
  toJSON x
    = Data.Aeson.object
        (Data.Maybe.catMaybes
           [fmap
              ((Data.Aeson..=) "object_id")
              (outputFacebookGraphUserFeedDataObject_id x),
            Just
              ((Data.Aeson..=)
                 "application" (outputFacebookGraphUserFeedDataApplication x)),
            Just
              ((Data.Aeson..=)
                 "actions" (outputFacebookGraphUserFeedDataActions x)),
            fmap
              ((Data.Aeson..=) "link")
              (outputFacebookGraphUserFeedDataLink x),
            Just
              ((Data.Aeson..=)
                 "status_type" (outputFacebookGraphUserFeedDataStatus_type x)),
            fmap
              ((Data.Aeson..=) "icon")
              (outputFacebookGraphUserFeedDataIcon x),
            fmap
              ((Data.Aeson..=) "caption")
              (outputFacebookGraphUserFeedDataCaption x),
            Just
              ((Data.Aeson..=)
                 "privacy" (outputFacebookGraphUserFeedDataPrivacy x)),
            Just
              ((Data.Aeson..=)
                 "from" (outputFacebookGraphUserFeedDataFrom x)),
            fmap
              ((Data.Aeson..=) "picture")
              (outputFacebookGraphUserFeedDataPicture x),
            Just
              ((Data.Aeson..=)
                 "updated_time" (outputFacebookGraphUserFeedDataUpdated_time x)),
            fmap
              ((Data.Aeson..=) "name")
              (outputFacebookGraphUserFeedDataName x),
            fmap
              ((Data.Aeson..=) "is_hidden")
              (outputFacebookGraphUserFeedDataIs_hidden x),
            Just
              ((Data.Aeson..=)
                 "created_time" (outputFacebookGraphUserFeedDataCreated_time x)),
            fmap
              ((Data.Aeson..=) "source")
              (outputFacebookGraphUserFeedDataSource x),
            Just
              ((Data.Aeson..=)
                 "id" (outputFacebookGraphUserFeedDataId x)),
            Just
              ((Data.Aeson..=)
                 "type" (outputFacebookGraphUserFeedDataType x)),
            Just
              ((Data.Aeson..=)
                 "message" (outputFacebookGraphUserFeedDataMessage x)),
            fmap
              ((Data.Aeson..=) "description")
              (outputFacebookGraphUserFeedDataDescription x)])
instance Data.Aeson.FromJSON OutputFacebookGraphUserFeedData where
  parseJSON
    (Data.Aeson.Object v)
    = (<*>)
        ((<*>)
           ((<*>)
              ((<*>)
                 ((<*>)
                    ((<*>)
                       ((<*>)
                          ((<*>)
                             ((<*>)
                                ((<*>)
                                   ((<*>)
                                      ((<*>)
                                         ((<*>)
                                            ((<*>)
                                               ((<*>)
                                                  ((<*>)
                                                     ((<*>)
                                                        ((<*>)
                                                           ((<*>)
                                                              (pure
                                                                 OutputFacebookGraphUserFeedData)
                                                              ((Data.Aeson..:?)
                                                                 v "object_id"))
                                                           ((Data.Aeson..:)
                                                              v "application"))
                                                        ((Data.Aeson..:)
                                                           v "actions"))
                                                     ((Data.Aeson..:?) v "link"))
                                                  ((Data.Aeson..:) v "status_type"))
                                               ((Data.Aeson..:?) v "icon"))
                                            ((Data.Aeson..:?) v "caption"))
                                         ((Data.Aeson..:) v "privacy"))
                                      ((Data.Aeson..:) v "from"))
                                   ((Data.Aeson..:?) v "picture"))
                                ((Data.Aeson..:) v "updated_time"))
                             ((Data.Aeson..:?) v "name"))
                          ((Data.Aeson..:?) v "is_hidden"))
                       ((Data.Aeson..:) v "created_time"))
                    ((Data.Aeson..:?) v "source"))
                 ((Data.Aeson..:) v "id"))
              ((Data.Aeson..:) v "type"))
           ((Data.Aeson..:) v "message"))
        ((Data.Aeson..:?) v "description")
  parseJSON v
    = fail (show v)
data OutputFacebookGraphUserFeedDataApplication
  = OutputFacebookGraphUserFeedDataApplication {outputFacebookGraphUserFeedDataApplicationName :: String,
                                                outputFacebookGraphUserFeedDataApplicationId :: String}
  deriving (Data.Data.Data,
            Eq,
            Read,
            Show,
            Data.Typeable.Typeable)
instance Data.Aeson.ToJSON OutputFacebookGraphUserFeedDataApplication where
  toJSON x
    = Data.Aeson.object
        (Data.Maybe.catMaybes
           [Just
              ((Data.Aeson..=)
                 "name" (outputFacebookGraphUserFeedDataApplicationName x)),
            Just
              ((Data.Aeson..=)
                 "id" (outputFacebookGraphUserFeedDataApplicationId x))])
instance Data.Aeson.FromJSON OutputFacebookGraphUserFeedDataApplication where
  parseJSON
    (Data.Aeson.Object v)
    = (<*>)
        ((<*>)
           (pure OutputFacebookGraphUserFeedDataApplication)
           ((Data.Aeson..:) v "name"))
        ((Data.Aeson..:) v "id")
  parseJSON v
    = fail (show v)
data OutputFacebookGraphUserFeedDataActions
  = OutputFacebookGraphUserFeedDataActions {outputFacebookGraphUserFeedDataActionsLink :: String,
                                            outputFacebookGraphUserFeedDataActionsName :: String}
  deriving (Data.Data.Data,
            Eq,
            Read,
            Show,
            Data.Typeable.Typeable)
instance Data.Aeson.ToJSON OutputFacebookGraphUserFeedDataActions where
  toJSON x
    = Data.Aeson.object
        (Data.Maybe.catMaybes
           [Just
              ((Data.Aeson..=)
                 "link" (outputFacebookGraphUserFeedDataActionsLink x)),
            Just
              ((Data.Aeson..=)
                 "name" (outputFacebookGraphUserFeedDataActionsName x))])
instance Data.Aeson.FromJSON OutputFacebookGraphUserFeedDataActions where
  parseJSON
    (Data.Aeson.Object v)
    = (<*>)
        ((<*>)
           (pure OutputFacebookGraphUserFeedDataActions)
           ((Data.Aeson..:) v "link"))
        ((Data.Aeson..:) v "name")
  parseJSON v
    = fail (show v)
data OutputFacebookGraphUserFeedDataPrivacy
  = OutputFacebookGraphUserFeedDataPrivacy {outputFacebookGraphUserFeedDataPrivacyNetworks :: String,
                                            outputFacebookGraphUserFeedDataPrivacyValue :: String,
                                            outputFacebookGraphUserFeedDataPrivacyAllow :: String,
                                            outputFacebookGraphUserFeedDataPrivacyDeny :: String,
                                            outputFacebookGraphUserFeedDataPrivacyDescription :: String,
                                            outputFacebookGraphUserFeedDataPrivacyFriends :: String}
  deriving (Data.Data.Data,
            Eq,
            Read,
            Show,
            Data.Typeable.Typeable)
instance Data.Aeson.ToJSON OutputFacebookGraphUserFeedDataPrivacy where
  toJSON x
    = Data.Aeson.object
        (Data.Maybe.catMaybes
           [Just
              ((Data.Aeson..=)
                 "networks" (outputFacebookGraphUserFeedDataPrivacyNetworks x)),
            Just
              ((Data.Aeson..=)
                 "value" (outputFacebookGraphUserFeedDataPrivacyValue x)),
            Just
              ((Data.Aeson..=)
                 "allow" (outputFacebookGraphUserFeedDataPrivacyAllow x)),
            Just
              ((Data.Aeson..=)
                 "deny" (outputFacebookGraphUserFeedDataPrivacyDeny x)),
            Just
              ((Data.Aeson..=)
                 "description"
                 (outputFacebookGraphUserFeedDataPrivacyDescription x)),
            Just
              ((Data.Aeson..=)
                 "friends" (outputFacebookGraphUserFeedDataPrivacyFriends x))])
instance Data.Aeson.FromJSON OutputFacebookGraphUserFeedDataPrivacy where
  parseJSON
    (Data.Aeson.Object v)
    = (<*>)
        ((<*>)
           ((<*>)
              ((<*>)
                 ((<*>)
                    ((<*>)
                       (pure OutputFacebookGraphUserFeedDataPrivacy)
                       ((Data.Aeson..:) v "networks"))
                    ((Data.Aeson..:) v "value"))
                 ((Data.Aeson..:) v "allow"))
              ((Data.Aeson..:) v "deny"))
           ((Data.Aeson..:) v "description"))
        ((Data.Aeson..:) v "friends")
  parseJSON v
    = fail (show v)
data OutputFacebookGraphUserFeedDataFrom
  = OutputFacebookGraphUserFeedDataFrom {outputFacebookGraphUserFeedDataFromName :: String,
                                         outputFacebookGraphUserFeedDataFromId :: String}
  deriving (Data.Data.Data,
            Eq,
            Read,
            Show,
            Data.Typeable.Typeable)
instance Data.Aeson.ToJSON OutputFacebookGraphUserFeedDataFrom where
  toJSON x
    = Data.Aeson.object
        (Data.Maybe.catMaybes
           [Just
              ((Data.Aeson..=)
                 "name" (outputFacebookGraphUserFeedDataFromName x)),
            Just
              ((Data.Aeson..=)
                 "id" (outputFacebookGraphUserFeedDataFromId x))])
instance Data.Aeson.FromJSON OutputFacebookGraphUserFeedDataFrom where
  parseJSON
    (Data.Aeson.Object v)
    = (<*>)
        ((<*>)
           (pure OutputFacebookGraphUserFeedDataFrom)
           ((Data.Aeson..:) v "name"))
        ((Data.Aeson..:) v "id")
  parseJSON v
    = fail (show v)
data OutputFacebookGraphUserFeedPaging
  = OutputFacebookGraphUserFeedPaging {outputFacebookGraphUserFeedPagingNext :: String,
                                       outputFacebookGraphUserFeedPagingPrevious :: String}
  deriving (Data.Data.Data,
            Eq,
            Read,
            Show,
            Data.Typeable.Typeable)
instance Data.Aeson.ToJSON OutputFacebookGraphUserFeedPaging where
  toJSON x
    = Data.Aeson.object
        (Data.Maybe.catMaybes
           [Just
              ((Data.Aeson..=)
                 "next" (outputFacebookGraphUserFeedPagingNext x)),
            Just
              ((Data.Aeson..=)
                 "previous" (outputFacebookGraphUserFeedPagingPrevious x))])
instance Data.Aeson.FromJSON OutputFacebookGraphUserFeedPaging where
  parseJSON
    (Data.Aeson.Object v)
    = (<*>)
        ((<*>)
           (pure OutputFacebookGraphUserFeedPaging)
           ((Data.Aeson..:) v "next"))
        ((Data.Aeson..:) v "previous")
  parseJSON v
    = fail (show v)
data InputFacebookGraphUserFeedPost
  = InputFacebookGraphUserFeedPost {inputFacebookGraphUserFeedPostUser_id :: String,
                                    inputFacebookGraphUserFeedPostAccess_token :: String,
                                    inputFacebookGraphUserFeedPostMessage :: Maybe String,
                                    inputFacebookGraphUserFeedPostLink :: Maybe String,
                                    inputFacebookGraphUserFeedPostActions :: Maybe String,
                                    inputFacebookGraphUserFeedPostPlace :: Maybe String,
                                    inputFacebookGraphUserFeedPostTags :: Maybe String,
                                    inputFacebookGraphUserFeedPostPrivacy :: Maybe String,
                                    inputFacebookGraphUserFeedPostObject_attachment :: Maybe String}
  deriving (Data.Data.Data,
            Eq,
            Read,
            Show,
            Data.Typeable.Typeable)
instance Data.Aeson.ToJSON InputFacebookGraphUserFeedPost where
  toJSON x@(InputFacebookGraphUserFeedPost {})
    = Data.Aeson.object
        (Data.Maybe.catMaybes
           [Just
              ((Data.Aeson..=)
                 "user_id" (inputFacebookGraphUserFeedPostUser_id x)),
            Just
              ((Data.Aeson..=)
                 "access_token" (inputFacebookGraphUserFeedPostAccess_token x)),
            fmap
              ((Data.Aeson..=) "message")
              (inputFacebookGraphUserFeedPostMessage x),
            fmap
              ((Data.Aeson..=) "link")
              (inputFacebookGraphUserFeedPostLink x),
            fmap
              ((Data.Aeson..=) "actions")
              (inputFacebookGraphUserFeedPostActions x),
            fmap
              ((Data.Aeson..=) "place")
              (inputFacebookGraphUserFeedPostPlace x),
            fmap
              ((Data.Aeson..=) "tags")
              (inputFacebookGraphUserFeedPostTags x),
            fmap
              ((Data.Aeson..=) "privacy")
              (inputFacebookGraphUserFeedPostPrivacy x),
            fmap
              ((Data.Aeson..=) "object_attachment")
              (inputFacebookGraphUserFeedPostObject_attachment x)])
instance Data.Aeson.FromJSON InputFacebookGraphUserFeedPost where
  parseJSON
    (Data.Aeson.Object v)
    = (<|>)
        ((<*>)
           ((<*>)
              ((<*>)
                 ((<*>)
                    ((<*>)
                       ((<*>)
                          ((<*>)
                             ((<*>)
                                ((<*>)
                                   (pure InputFacebookGraphUserFeedPost)
                                   ((Data.Aeson..:) v "user_id"))
                                ((Data.Aeson..:) v "access_token"))
                             ((Data.Aeson..:?) v "message"))
                          ((Data.Aeson..:?) v "link"))
                       ((Data.Aeson..:?) v "actions"))
                    ((Data.Aeson..:?) v "place"))
                 ((Data.Aeson..:?) v "tags"))
              ((Data.Aeson..:?) v "privacy"))
           ((Data.Aeson..:?) v "object_attachment"))
        empty
  parseJSON _ = mzero
instance Data.TH.Object.Object InputFacebookGraphUserFeedPost String Language.JavaScript.Interpret.Primitive where
  toObject x@(InputFacebookGraphUserFeedPost {})
    = fromList
        (Data.Maybe.catMaybes
           [Just
              ((\ k_aXZI v_aXZJ -> (k_aXZI, Data.TH.Convert.convert v_aXZJ))
                 "user_id" (inputFacebookGraphUserFeedPostUser_id x)),
            Just
              ((\ k_aXZI v_aXZJ -> (k_aXZI, Data.TH.Convert.convert v_aXZJ))
                 "access_token" (inputFacebookGraphUserFeedPostAccess_token x)),
            fmap
              ((\ k_aXZI v_aXZJ -> (k_aXZI, Data.TH.Convert.convert v_aXZJ))
                 "message")
              (inputFacebookGraphUserFeedPostMessage x),
            fmap
              ((\ k_aXZI v_aXZJ -> (k_aXZI, Data.TH.Convert.convert v_aXZJ))
                 "link")
              (inputFacebookGraphUserFeedPostLink x),
            fmap
              ((\ k_aXZI v_aXZJ -> (k_aXZI, Data.TH.Convert.convert v_aXZJ))
                 "actions")
              (inputFacebookGraphUserFeedPostActions x),
            fmap
              ((\ k_aXZI v_aXZJ -> (k_aXZI, Data.TH.Convert.convert v_aXZJ))
                 "place")
              (inputFacebookGraphUserFeedPostPlace x),
            fmap
              ((\ k_aXZI v_aXZJ -> (k_aXZI, Data.TH.Convert.convert v_aXZJ))
                 "tags")
              (inputFacebookGraphUserFeedPostTags x),
            fmap
              ((\ k_aXZI v_aXZJ -> (k_aXZI, Data.TH.Convert.convert v_aXZJ))
                 "privacy")
              (inputFacebookGraphUserFeedPostPrivacy x),
            fmap
              ((\ k_aXZI v_aXZJ -> (k_aXZI, Data.TH.Convert.convert v_aXZJ))
                 "object_attachment")
              (inputFacebookGraphUserFeedPostObject_attachment x)])
data OutputFacebookGraphUserFeedPost
  = OutputFacebookGraphUserFeedPost {outputFacebookGraphUserFeedPostId :: String}
  deriving (Data.Data.Data,
            Eq,
            Read,
            Show,
            Data.Typeable.Typeable)
instance Data.Aeson.ToJSON OutputFacebookGraphUserFeedPost where
  toJSON x
    = Data.Aeson.object
        (Data.Maybe.catMaybes
           [Just
              ((Data.Aeson..=)
                 "id" (outputFacebookGraphUserFeedPostId x))])
instance Data.Aeson.FromJSON OutputFacebookGraphUserFeedPost where
  parseJSON
    (Data.Aeson.Object v)
    = (<*>)
        (pure OutputFacebookGraphUserFeedPost)
        ((Data.Aeson..:) v "id")
  parseJSON v
    = fail (show v)
data InputFacebookGraphUserFriendlists
  = InputFacebookGraphUserFriendlists {inputFacebookGraphUserFriendlistsUser_id :: String,
                                       inputFacebookGraphUserFriendlistsAccess_token :: String}
  deriving (Data.Data.Data,
            Eq,
            Read,
            Show,
            Data.Typeable.Typeable)
instance Data.Aeson.ToJSON InputFacebookGraphUserFriendlists where
  toJSON
    x@(InputFacebookGraphUserFriendlists {})
    = Data.Aeson.object
        (Data.Maybe.catMaybes
           [Just
              ((Data.Aeson..=)
                 "user_id" (inputFacebookGraphUserFriendlistsUser_id x)),
            Just
              ((Data.Aeson..=)
                 "access_token" (inputFacebookGraphUserFriendlistsAccess_token x))])
instance Data.Aeson.FromJSON InputFacebookGraphUserFriendlists where
  parseJSON
    (Data.Aeson.Object v)
    = (<|>)
        ((<*>)
           ((<*>)
              (pure InputFacebookGraphUserFriendlists)
              ((Data.Aeson..:) v "user_id"))
           ((Data.Aeson..:) v "access_token"))
        empty
  parseJSON _ = mzero
instance Data.TH.Object.Object InputFacebookGraphUserFriendlists String Language.JavaScript.Interpret.Primitive where
  toObject x@(InputFacebookGraphUserFriendlists {})
    = fromList
        (Data.Maybe.catMaybes
           [Just
              ((\ k_aXZK v_aXZL -> (k_aXZK, Data.TH.Convert.convert v_aXZL))
                 "user_id" (inputFacebookGraphUserFriendlistsUser_id x)),
            Just
              ((\ k_aXZK v_aXZL -> (k_aXZK, Data.TH.Convert.convert v_aXZL))
                 "access_token" (inputFacebookGraphUserFriendlistsAccess_token x))])
data OutputFacebookGraphUserFriendlists
  = OutputFacebookGraphUserFriendlists {outputFacebookGraphUserFriendlistsData :: [OutputFacebookGraphUserFriendlistsData],
                                        outputFacebookGraphUserFriendlistsPaging :: OutputFacebookGraphUserFriendlistsPaging}
  deriving (Data.Data.Data,
            Eq,
            Read,
            Show,
            Data.Typeable.Typeable)
instance Data.Aeson.ToJSON OutputFacebookGraphUserFriendlists where
  toJSON x
    = Data.Aeson.object
        (Data.Maybe.catMaybes
           [Just
              ((Data.Aeson..=)
                 "data" (outputFacebookGraphUserFriendlistsData x)),
            Just
              ((Data.Aeson..=)
                 "paging" (outputFacebookGraphUserFriendlistsPaging x))])
instance Data.Aeson.FromJSON OutputFacebookGraphUserFriendlists where
  parseJSON
    (Data.Aeson.Object v)
    = (<*>)
        ((<*>)
           (pure OutputFacebookGraphUserFriendlists)
           ((Data.Aeson..:) v "data"))
        ((Data.Aeson..:) v "paging")
  parseJSON v
    = fail (show v)
data OutputFacebookGraphUserFriendlistsData
  = OutputFacebookGraphUserFriendlistsData {outputFacebookGraphUserFriendlistsDataList_type :: String,
                                            outputFacebookGraphUserFriendlistsDataName :: String,
                                            outputFacebookGraphUserFriendlistsDataId :: String}
  deriving (Data.Data.Data,
            Eq,
            Read,
            Show,
            Data.Typeable.Typeable)
instance Data.Aeson.ToJSON OutputFacebookGraphUserFriendlistsData where
  toJSON x
    = Data.Aeson.object
        (Data.Maybe.catMaybes
           [Just
              ((Data.Aeson..=)
                 "list_type" (outputFacebookGraphUserFriendlistsDataList_type x)),
            Just
              ((Data.Aeson..=)
                 "name" (outputFacebookGraphUserFriendlistsDataName x)),
            Just
              ((Data.Aeson..=)
                 "id" (outputFacebookGraphUserFriendlistsDataId x))])
instance Data.Aeson.FromJSON OutputFacebookGraphUserFriendlistsData where
  parseJSON
    (Data.Aeson.Object v)
    = (<*>)
        ((<*>)
           ((<*>)
              (pure OutputFacebookGraphUserFriendlistsData)
              ((Data.Aeson..:) v "list_type"))
           ((Data.Aeson..:) v "name"))
        ((Data.Aeson..:) v "id")
  parseJSON v
    = fail (show v)
data OutputFacebookGraphUserFriendlistsPaging
  = OutputFacebookGraphUserFriendlistsPaging {outputFacebookGraphUserFriendlistsPagingNext :: String}
  deriving (Data.Data.Data,
            Eq,
            Read,
            Show,
            Data.Typeable.Typeable)
instance Data.Aeson.ToJSON OutputFacebookGraphUserFriendlistsPaging where
  toJSON x
    = Data.Aeson.object
        (Data.Maybe.catMaybes
           [Just
              ((Data.Aeson..=)
                 "next" (outputFacebookGraphUserFriendlistsPagingNext x))])
instance Data.Aeson.FromJSON OutputFacebookGraphUserFriendlistsPaging where
  parseJSON
    (Data.Aeson.Object v)
    = (<*>)
        (pure OutputFacebookGraphUserFriendlistsPaging)
        ((Data.Aeson..:) v "next")
  parseJSON v
    = fail (show v)
data InputFacebookGraphUserFriends
  = InputFacebookGraphUserFriends {inputFacebookGraphUserFriendsUser_id :: String,
                                   inputFacebookGraphUserFriendsAccess_token :: String}
  deriving (Data.Data.Data,
            Eq,
            Read,
            Show,
            Data.Typeable.Typeable)
instance Data.Aeson.ToJSON InputFacebookGraphUserFriends where
  toJSON x@(InputFacebookGraphUserFriends {})
    = Data.Aeson.object
        (Data.Maybe.catMaybes
           [Just
              ((Data.Aeson..=)
                 "user_id" (inputFacebookGraphUserFriendsUser_id x)),
            Just
              ((Data.Aeson..=)
                 "access_token" (inputFacebookGraphUserFriendsAccess_token x))])
instance Data.Aeson.FromJSON InputFacebookGraphUserFriends where
  parseJSON
    (Data.Aeson.Object v)
    = (<|>)
        ((<*>)
           ((<*>)
              (pure InputFacebookGraphUserFriends)
              ((Data.Aeson..:) v "user_id"))
           ((Data.Aeson..:) v "access_token"))
        empty
  parseJSON _ = mzero
instance Data.TH.Object.Object InputFacebookGraphUserFriends String Language.JavaScript.Interpret.Primitive where
  toObject x@(InputFacebookGraphUserFriends {})
    = fromList
        (Data.Maybe.catMaybes
           [Just
              ((\ k_aXZM v_aXZN -> (k_aXZM, Data.TH.Convert.convert v_aXZN))
                 "user_id" (inputFacebookGraphUserFriendsUser_id x)),
            Just
              ((\ k_aXZM v_aXZN -> (k_aXZM, Data.TH.Convert.convert v_aXZN))
                 "access_token" (inputFacebookGraphUserFriendsAccess_token x))])
data OutputFacebookGraphUserFriends
  = OutputFacebookGraphUserFriends {outputFacebookGraphUserFriendsData :: [OutputFacebookGraphUserFriendsData],
                                    outputFacebookGraphUserFriendsPaging :: OutputFacebookGraphUserFriendsPaging}
  deriving (Data.Data.Data,
            Eq,
            Read,
            Show,
            Data.Typeable.Typeable)
instance Data.Aeson.ToJSON OutputFacebookGraphUserFriends where
  toJSON x
    = Data.Aeson.object
        (Data.Maybe.catMaybes
           [Just
              ((Data.Aeson..=)
                 "data" (outputFacebookGraphUserFriendsData x)),
            Just
              ((Data.Aeson..=)
                 "paging" (outputFacebookGraphUserFriendsPaging x))])
instance Data.Aeson.FromJSON OutputFacebookGraphUserFriends where
  parseJSON
    (Data.Aeson.Object v)
    = (<*>)
        ((<*>)
           (pure OutputFacebookGraphUserFriends)
           ((Data.Aeson..:) v "data"))
        ((Data.Aeson..:) v "paging")
  parseJSON v
    = fail (show v)
data OutputFacebookGraphUserFriendsData
  = OutputFacebookGraphUserFriendsData {outputFacebookGraphUserFriendsDataName :: String,
                                        outputFacebookGraphUserFriendsDataId :: String}
  deriving (Data.Data.Data,
            Eq,
            Read,
            Show,
            Data.Typeable.Typeable)
instance Data.Aeson.ToJSON OutputFacebookGraphUserFriendsData where
  toJSON x
    = Data.Aeson.object
        (Data.Maybe.catMaybes
           [Just
              ((Data.Aeson..=)
                 "name" (outputFacebookGraphUserFriendsDataName x)),
            Just
              ((Data.Aeson..=)
                 "id" (outputFacebookGraphUserFriendsDataId x))])
instance Data.Aeson.FromJSON OutputFacebookGraphUserFriendsData where
  parseJSON
    (Data.Aeson.Object v)
    = (<*>)
        ((<*>)
           (pure OutputFacebookGraphUserFriendsData)
           ((Data.Aeson..:) v "name"))
        ((Data.Aeson..:) v "id")
  parseJSON v
    = fail (show v)
data OutputFacebookGraphUserFriendsPaging
  = OutputFacebookGraphUserFriendsPaging {outputFacebookGraphUserFriendsPagingNext :: String}
  deriving (Data.Data.Data,
            Eq,
            Read,
            Show,
            Data.Typeable.Typeable)
instance Data.Aeson.ToJSON OutputFacebookGraphUserFriendsPaging where
  toJSON x
    = Data.Aeson.object
        (Data.Maybe.catMaybes
           [Just
              ((Data.Aeson..=)
                 "next" (outputFacebookGraphUserFriendsPagingNext x))])
instance Data.Aeson.FromJSON OutputFacebookGraphUserFriendsPaging where
  parseJSON
    (Data.Aeson.Object v)
    = (<*>)
        (pure OutputFacebookGraphUserFriendsPaging)
        ((Data.Aeson..:) v "next")
  parseJSON v
    = fail (show v)
data InputFacebookGraphUserInbox
  = InputFacebookGraphUserInbox {inputFacebookGraphUserInboxUser_id :: String,
                                 inputFacebookGraphUserInboxAccess_token :: String}
  deriving (Data.Data.Data,
            Eq,
            Read,
            Show,
            Data.Typeable.Typeable)
instance Data.Aeson.ToJSON InputFacebookGraphUserInbox where
  toJSON x@(InputFacebookGraphUserInbox {})
    = Data.Aeson.object
        (Data.Maybe.catMaybes
           [Just
              ((Data.Aeson..=)
                 "user_id" (inputFacebookGraphUserInboxUser_id x)),
            Just
              ((Data.Aeson..=)
                 "access_token" (inputFacebookGraphUserInboxAccess_token x))])
instance Data.Aeson.FromJSON InputFacebookGraphUserInbox where
  parseJSON
    (Data.Aeson.Object v)
    = (<|>)
        ((<*>)
           ((<*>)
              (pure InputFacebookGraphUserInbox)
              ((Data.Aeson..:) v "user_id"))
           ((Data.Aeson..:) v "access_token"))
        empty
  parseJSON _ = mzero
instance Data.TH.Object.Object InputFacebookGraphUserInbox String Language.JavaScript.Interpret.Primitive where
  toObject x@(InputFacebookGraphUserInbox {})
    = fromList
        (Data.Maybe.catMaybes
           [Just
              ((\ k_aXZO v_aXZP -> (k_aXZO, Data.TH.Convert.convert v_aXZP))
                 "user_id" (inputFacebookGraphUserInboxUser_id x)),
            Just
              ((\ k_aXZO v_aXZP -> (k_aXZO, Data.TH.Convert.convert v_aXZP))
                 "access_token" (inputFacebookGraphUserInboxAccess_token x))])
data OutputFacebookGraphUserInbox
  = OutputFacebookGraphUserInbox {outputFacebookGraphUserInboxData :: [OutputFacebookGraphUserInboxData],
                                  outputFacebookGraphUserInboxPaging :: OutputFacebookGraphUserInboxPaging}
  deriving (Data.Data.Data,
            Eq,
            Read,
            Show,
            Data.Typeable.Typeable)
instance Data.Aeson.ToJSON OutputFacebookGraphUserInbox where
  toJSON x
    = Data.Aeson.object
        (Data.Maybe.catMaybes
           [Just
              ((Data.Aeson..=)
                 "data" (outputFacebookGraphUserInboxData x)),
            Just
              ((Data.Aeson..=)
                 "paging" (outputFacebookGraphUserInboxPaging x))])
instance Data.Aeson.FromJSON OutputFacebookGraphUserInbox where
  parseJSON
    (Data.Aeson.Object v)
    = (<*>)
        ((<*>)
           (pure OutputFacebookGraphUserInbox)
           ((Data.Aeson..:) v "data"))
        ((Data.Aeson..:) v "paging")
  parseJSON v
    = fail (show v)
data OutputFacebookGraphUserInboxData
  = OutputFacebookGraphUserInboxData {outputFacebookGraphUserInboxDataTo :: OutputFacebookGraphUserInboxDataTo,
                                      outputFacebookGraphUserInboxDataUnseen :: Double,
                                      outputFacebookGraphUserInboxDataUpdated_time :: String,
                                      outputFacebookGraphUserInboxDataId :: String,
                                      outputFacebookGraphUserInboxDataComments :: OutputFacebookGraphUserInboxDataComments,
                                      outputFacebookGraphUserInboxDataUnread :: Double}
  deriving (Data.Data.Data,
            Eq,
            Read,
            Show,
            Data.Typeable.Typeable)
instance Data.Aeson.ToJSON OutputFacebookGraphUserInboxData where
  toJSON x
    = Data.Aeson.object
        (Data.Maybe.catMaybes
           [Just
              ((Data.Aeson..=)
                 "to" (outputFacebookGraphUserInboxDataTo x)),
            Just
              ((Data.Aeson..=)
                 "unseen" (outputFacebookGraphUserInboxDataUnseen x)),
            Just
              ((Data.Aeson..=)
                 "updated_time" (outputFacebookGraphUserInboxDataUpdated_time x)),
            Just
              ((Data.Aeson..=)
                 "id" (outputFacebookGraphUserInboxDataId x)),
            Just
              ((Data.Aeson..=)
                 "comments" (outputFacebookGraphUserInboxDataComments x)),
            Just
              ((Data.Aeson..=)
                 "unread" (outputFacebookGraphUserInboxDataUnread x))])
instance Data.Aeson.FromJSON OutputFacebookGraphUserInboxData where
  parseJSON
    (Data.Aeson.Object v)
    = (<*>)
        ((<*>)
           ((<*>)
              ((<*>)
                 ((<*>)
                    ((<*>)
                       (pure OutputFacebookGraphUserInboxData)
                       ((Data.Aeson..:) v "to"))
                    ((Data.Aeson..:) v "unseen"))
                 ((Data.Aeson..:) v "updated_time"))
              ((Data.Aeson..:) v "id"))
           ((Data.Aeson..:) v "comments"))
        ((Data.Aeson..:) v "unread")
  parseJSON v
    = fail (show v)
data OutputFacebookGraphUserInboxDataTo
  = OutputFacebookGraphUserInboxDataTo {outputFacebookGraphUserInboxDataToData :: [OutputFacebookGraphUserInboxDataToData]}
  deriving (Data.Data.Data,
            Eq,
            Read,
            Show,
            Data.Typeable.Typeable)
instance Data.Aeson.ToJSON OutputFacebookGraphUserInboxDataTo where
  toJSON x
    = Data.Aeson.object
        (Data.Maybe.catMaybes
           [Just
              ((Data.Aeson..=)
                 "data" (outputFacebookGraphUserInboxDataToData x))])
instance Data.Aeson.FromJSON OutputFacebookGraphUserInboxDataTo where
  parseJSON
    (Data.Aeson.Object v)
    = (<*>)
        (pure OutputFacebookGraphUserInboxDataTo)
        ((Data.Aeson..:) v "data")
  parseJSON v
    = fail (show v)
data OutputFacebookGraphUserInboxDataToData
  = OutputFacebookGraphUserInboxDataToData {outputFacebookGraphUserInboxDataToDataName :: String,
                                            outputFacebookGraphUserInboxDataToDataId :: String}
  deriving (Data.Data.Data,
            Eq,
            Read,
            Show,
            Data.Typeable.Typeable)
instance Data.Aeson.ToJSON OutputFacebookGraphUserInboxDataToData where
  toJSON x
    = Data.Aeson.object
        (Data.Maybe.catMaybes
           [Just
              ((Data.Aeson..=)
                 "name" (outputFacebookGraphUserInboxDataToDataName x)),
            Just
              ((Data.Aeson..=)
                 "id" (outputFacebookGraphUserInboxDataToDataId x))])
instance Data.Aeson.FromJSON OutputFacebookGraphUserInboxDataToData where
  parseJSON
    (Data.Aeson.Object v)
    = (<*>)
        ((<*>)
           (pure OutputFacebookGraphUserInboxDataToData)
           ((Data.Aeson..:) v "name"))
        ((Data.Aeson..:) v "id")
  parseJSON v
    = fail (show v)
data OutputFacebookGraphUserInboxDataComments
  = OutputFacebookGraphUserInboxDataComments {outputFacebookGraphUserInboxDataCommentsData :: [OutputFacebookGraphUserInboxDataCommentsData],
                                              outputFacebookGraphUserInboxDataCommentsPaging :: OutputFacebookGraphUserInboxDataCommentsPaging}
  deriving (Data.Data.Data,
            Eq,
            Read,
            Show,
            Data.Typeable.Typeable)
instance Data.Aeson.ToJSON OutputFacebookGraphUserInboxDataComments where
  toJSON x
    = Data.Aeson.object
        (Data.Maybe.catMaybes
           [Just
              ((Data.Aeson..=)
                 "data" (outputFacebookGraphUserInboxDataCommentsData x)),
            Just
              ((Data.Aeson..=)
                 "paging" (outputFacebookGraphUserInboxDataCommentsPaging x))])
instance Data.Aeson.FromJSON OutputFacebookGraphUserInboxDataComments where
  parseJSON
    (Data.Aeson.Object v)
    = (<*>)
        ((<*>)
           (pure OutputFacebookGraphUserInboxDataComments)
           ((Data.Aeson..:) v "data"))
        ((Data.Aeson..:) v "paging")
  parseJSON v
    = fail (show v)
data OutputFacebookGraphUserInboxDataCommentsData
  = OutputFacebookGraphUserInboxDataCommentsData {outputFacebookGraphUserInboxDataCommentsDataFrom :: OutputFacebookGraphUserInboxDataCommentsDataFrom,
                                                  outputFacebookGraphUserInboxDataCommentsDataCreated_time :: String,
                                                  outputFacebookGraphUserInboxDataCommentsDataId :: String,
                                                  outputFacebookGraphUserInboxDataCommentsDataMessage :: String}
  deriving (Data.Data.Data,
            Eq,
            Read,
            Show,
            Data.Typeable.Typeable)
instance Data.Aeson.ToJSON OutputFacebookGraphUserInboxDataCommentsData where
  toJSON x
    = Data.Aeson.object
        (Data.Maybe.catMaybes
           [Just
              ((Data.Aeson..=)
                 "from" (outputFacebookGraphUserInboxDataCommentsDataFrom x)),
            Just
              ((Data.Aeson..=)
                 "created_time"
                 (outputFacebookGraphUserInboxDataCommentsDataCreated_time x)),
            Just
              ((Data.Aeson..=)
                 "id" (outputFacebookGraphUserInboxDataCommentsDataId x)),
            Just
              ((Data.Aeson..=)
                 "message"
                 (outputFacebookGraphUserInboxDataCommentsDataMessage x))])
instance Data.Aeson.FromJSON OutputFacebookGraphUserInboxDataCommentsData where
  parseJSON
    (Data.Aeson.Object v)
    = (<*>)
        ((<*>)
           ((<*>)
              ((<*>)
                 (pure OutputFacebookGraphUserInboxDataCommentsData)
                 ((Data.Aeson..:) v "from"))
              ((Data.Aeson..:) v "created_time"))
           ((Data.Aeson..:) v "id"))
        ((Data.Aeson..:) v "message")
  parseJSON v
    = fail (show v)
data OutputFacebookGraphUserInboxDataCommentsDataFrom
  = OutputFacebookGraphUserInboxDataCommentsDataFrom {outputFacebookGraphUserInboxDataCommentsDataFromName :: String,
                                                      outputFacebookGraphUserInboxDataCommentsDataFromId :: String}
  deriving (Data.Data.Data,
            Eq,
            Read,
            Show,
            Data.Typeable.Typeable)
instance Data.Aeson.ToJSON OutputFacebookGraphUserInboxDataCommentsDataFrom where
  toJSON x
    = Data.Aeson.object
        (Data.Maybe.catMaybes
           [Just
              ((Data.Aeson..=)
                 "name" (outputFacebookGraphUserInboxDataCommentsDataFromName x)),
            Just
              ((Data.Aeson..=)
                 "id" (outputFacebookGraphUserInboxDataCommentsDataFromId x))])
instance Data.Aeson.FromJSON OutputFacebookGraphUserInboxDataCommentsDataFrom where
  parseJSON
    (Data.Aeson.Object v)
    = (<*>)
        ((<*>)
           (pure OutputFacebookGraphUserInboxDataCommentsDataFrom)
           ((Data.Aeson..:) v "name"))
        ((Data.Aeson..:) v "id")
  parseJSON v
    = fail (show v)
data OutputFacebookGraphUserInboxDataCommentsPaging
  = OutputFacebookGraphUserInboxDataCommentsPaging {outputFacebookGraphUserInboxDataCommentsPagingNext :: String,
                                                    outputFacebookGraphUserInboxDataCommentsPagingPrevious :: String}
  deriving (Data.Data.Data,
            Eq,
            Read,
            Show,
            Data.Typeable.Typeable)
instance Data.Aeson.ToJSON OutputFacebookGraphUserInboxDataCommentsPaging where
  toJSON x
    = Data.Aeson.object
        (Data.Maybe.catMaybes
           [Just
              ((Data.Aeson..=)
                 "next" (outputFacebookGraphUserInboxDataCommentsPagingNext x)),
            Just
              ((Data.Aeson..=)
                 "previous"
                 (outputFacebookGraphUserInboxDataCommentsPagingPrevious x))])
instance Data.Aeson.FromJSON OutputFacebookGraphUserInboxDataCommentsPaging where
  parseJSON
    (Data.Aeson.Object v)
    = (<*>)
        ((<*>)
           (pure OutputFacebookGraphUserInboxDataCommentsPaging)
           ((Data.Aeson..:) v "next"))
        ((Data.Aeson..:) v "previous")
  parseJSON v
    = fail (show v)
data OutputFacebookGraphUserInboxPaging
  = OutputFacebookGraphUserInboxPaging {outputFacebookGraphUserInboxPagingNext :: String,
                                        outputFacebookGraphUserInboxPagingPrevious :: String}
  deriving (Data.Data.Data,
            Eq,
            Read,
            Show,
            Data.Typeable.Typeable)
instance Data.Aeson.ToJSON OutputFacebookGraphUserInboxPaging where
  toJSON x
    = Data.Aeson.object
        (Data.Maybe.catMaybes
           [Just
              ((Data.Aeson..=)
                 "next" (outputFacebookGraphUserInboxPagingNext x)),
            Just
              ((Data.Aeson..=)
                 "previous" (outputFacebookGraphUserInboxPagingPrevious x))])
instance Data.Aeson.FromJSON OutputFacebookGraphUserInboxPaging where
  parseJSON
    (Data.Aeson.Object v)
    = (<*>)
        ((<*>)
           (pure OutputFacebookGraphUserInboxPaging)
           ((Data.Aeson..:) v "next"))
        ((Data.Aeson..:) v "previous")
  parseJSON v
    = fail (show v)
data InputFacebookGraphUserLinks
  = InputFacebookGraphUserLinks {inputFacebookGraphUserLinksUser_id :: String,
                                 inputFacebookGraphUserLinksAccess_token :: String}
  deriving (Data.Data.Data,
            Eq,
            Read,
            Show,
            Data.Typeable.Typeable)
instance Data.Aeson.ToJSON InputFacebookGraphUserLinks where
  toJSON x@(InputFacebookGraphUserLinks {})
    = Data.Aeson.object
        (Data.Maybe.catMaybes
           [Just
              ((Data.Aeson..=)
                 "user_id" (inputFacebookGraphUserLinksUser_id x)),
            Just
              ((Data.Aeson..=)
                 "access_token" (inputFacebookGraphUserLinksAccess_token x))])
instance Data.Aeson.FromJSON InputFacebookGraphUserLinks where
  parseJSON
    (Data.Aeson.Object v)
    = (<|>)
        ((<*>)
           ((<*>)
              (pure InputFacebookGraphUserLinks)
              ((Data.Aeson..:) v "user_id"))
           ((Data.Aeson..:) v "access_token"))
        empty
  parseJSON _ = mzero
instance Data.TH.Object.Object InputFacebookGraphUserLinks String Language.JavaScript.Interpret.Primitive where
  toObject x@(InputFacebookGraphUserLinks {})
    = fromList
        (Data.Maybe.catMaybes
           [Just
              ((\ k_aXZQ v_aXZR -> (k_aXZQ, Data.TH.Convert.convert v_aXZR))
                 "user_id" (inputFacebookGraphUserLinksUser_id x)),
            Just
              ((\ k_aXZQ v_aXZR -> (k_aXZQ, Data.TH.Convert.convert v_aXZR))
                 "access_token" (inputFacebookGraphUserLinksAccess_token x))])
data OutputFacebookGraphUserLinks
  = OutputFacebookGraphUserLinks {outputFacebookGraphUserLinksData :: [OutputFacebookGraphUserLinksData],
                                  outputFacebookGraphUserLinksPaging :: OutputFacebookGraphUserLinksPaging}
  deriving (Data.Data.Data,
            Eq,
            Read,
            Show,
            Data.Typeable.Typeable)
instance Data.Aeson.ToJSON OutputFacebookGraphUserLinks where
  toJSON x
    = Data.Aeson.object
        (Data.Maybe.catMaybes
           [Just
              ((Data.Aeson..=)
                 "data" (outputFacebookGraphUserLinksData x)),
            Just
              ((Data.Aeson..=)
                 "paging" (outputFacebookGraphUserLinksPaging x))])
instance Data.Aeson.FromJSON OutputFacebookGraphUserLinks where
  parseJSON
    (Data.Aeson.Object v)
    = (<*>)
        ((<*>)
           (pure OutputFacebookGraphUserLinks)
           ((Data.Aeson..:) v "data"))
        ((Data.Aeson..:) v "paging")
  parseJSON v
    = fail (show v)
data OutputFacebookGraphUserLinksData
  = OutputFacebookGraphUserLinksData {outputFacebookGraphUserLinksDataObject_id :: Maybe String,
                                      outputFacebookGraphUserLinksDataApplication :: OutputFacebookGraphUserLinksDataApplication,
                                      outputFacebookGraphUserLinksDataActions :: [OutputFacebookGraphUserLinksDataActions],
                                      outputFacebookGraphUserLinksDataLink :: Maybe String,
                                      outputFacebookGraphUserLinksDataStatus_type :: String,
                                      outputFacebookGraphUserLinksDataIcon :: Maybe String,
                                      outputFacebookGraphUserLinksDataCaption :: Maybe String,
                                      outputFacebookGraphUserLinksDataPrivacy :: OutputFacebookGraphUserLinksDataPrivacy,
                                      outputFacebookGraphUserLinksDataFrom :: OutputFacebookGraphUserLinksDataFrom,
                                      outputFacebookGraphUserLinksDataPicture :: Maybe String,
                                      outputFacebookGraphUserLinksDataUpdated_time :: String,
                                      outputFacebookGraphUserLinksDataName :: Maybe String,
                                      outputFacebookGraphUserLinksDataIs_hidden :: Maybe Bool,
                                      outputFacebookGraphUserLinksDataCreated_time :: String,
                                      outputFacebookGraphUserLinksDataSource :: Maybe String,
                                      outputFacebookGraphUserLinksDataId :: String,
                                      outputFacebookGraphUserLinksDataType :: String,
                                      outputFacebookGraphUserLinksDataMessage :: String,
                                      outputFacebookGraphUserLinksDataDescription :: Maybe String}
  deriving (Data.Data.Data,
            Eq,
            Read,
            Show,
            Data.Typeable.Typeable)
instance Data.Aeson.ToJSON OutputFacebookGraphUserLinksData where
  toJSON x
    = Data.Aeson.object
        (Data.Maybe.catMaybes
           [fmap
              ((Data.Aeson..=) "object_id")
              (outputFacebookGraphUserLinksDataObject_id x),
            Just
              ((Data.Aeson..=)
                 "application" (outputFacebookGraphUserLinksDataApplication x)),
            Just
              ((Data.Aeson..=)
                 "actions" (outputFacebookGraphUserLinksDataActions x)),
            fmap
              ((Data.Aeson..=) "link")
              (outputFacebookGraphUserLinksDataLink x),
            Just
              ((Data.Aeson..=)
                 "status_type" (outputFacebookGraphUserLinksDataStatus_type x)),
            fmap
              ((Data.Aeson..=) "icon")
              (outputFacebookGraphUserLinksDataIcon x),
            fmap
              ((Data.Aeson..=) "caption")
              (outputFacebookGraphUserLinksDataCaption x),
            Just
              ((Data.Aeson..=)
                 "privacy" (outputFacebookGraphUserLinksDataPrivacy x)),
            Just
              ((Data.Aeson..=)
                 "from" (outputFacebookGraphUserLinksDataFrom x)),
            fmap
              ((Data.Aeson..=) "picture")
              (outputFacebookGraphUserLinksDataPicture x),
            Just
              ((Data.Aeson..=)
                 "updated_time" (outputFacebookGraphUserLinksDataUpdated_time x)),
            fmap
              ((Data.Aeson..=) "name")
              (outputFacebookGraphUserLinksDataName x),
            fmap
              ((Data.Aeson..=) "is_hidden")
              (outputFacebookGraphUserLinksDataIs_hidden x),
            Just
              ((Data.Aeson..=)
                 "created_time" (outputFacebookGraphUserLinksDataCreated_time x)),
            fmap
              ((Data.Aeson..=) "source")
              (outputFacebookGraphUserLinksDataSource x),
            Just
              ((Data.Aeson..=)
                 "id" (outputFacebookGraphUserLinksDataId x)),
            Just
              ((Data.Aeson..=)
                 "type" (outputFacebookGraphUserLinksDataType x)),
            Just
              ((Data.Aeson..=)
                 "message" (outputFacebookGraphUserLinksDataMessage x)),
            fmap
              ((Data.Aeson..=) "description")
              (outputFacebookGraphUserLinksDataDescription x)])
instance Data.Aeson.FromJSON OutputFacebookGraphUserLinksData where
  parseJSON
    (Data.Aeson.Object v)
    = (<*>)
        ((<*>)
           ((<*>)
              ((<*>)
                 ((<*>)
                    ((<*>)
                       ((<*>)
                          ((<*>)
                             ((<*>)
                                ((<*>)
                                   ((<*>)
                                      ((<*>)
                                         ((<*>)
                                            ((<*>)
                                               ((<*>)
                                                  ((<*>)
                                                     ((<*>)
                                                        ((<*>)
                                                           ((<*>)
                                                              (pure
                                                                 OutputFacebookGraphUserLinksData)
                                                              ((Data.Aeson..:?)
                                                                 v "object_id"))
                                                           ((Data.Aeson..:)
                                                              v "application"))
                                                        ((Data.Aeson..:)
                                                           v "actions"))
                                                     ((Data.Aeson..:?) v "link"))
                                                  ((Data.Aeson..:) v "status_type"))
                                               ((Data.Aeson..:?) v "icon"))
                                            ((Data.Aeson..:?) v "caption"))
                                         ((Data.Aeson..:) v "privacy"))
                                      ((Data.Aeson..:) v "from"))
                                   ((Data.Aeson..:?) v "picture"))
                                ((Data.Aeson..:) v "updated_time"))
                             ((Data.Aeson..:?) v "name"))
                          ((Data.Aeson..:?) v "is_hidden"))
                       ((Data.Aeson..:) v "created_time"))
                    ((Data.Aeson..:?) v "source"))
                 ((Data.Aeson..:) v "id"))
              ((Data.Aeson..:) v "type"))
           ((Data.Aeson..:) v "message"))
        ((Data.Aeson..:?) v "description")
  parseJSON v
    = fail (show v)
data OutputFacebookGraphUserLinksDataApplication
  = OutputFacebookGraphUserLinksDataApplication {outputFacebookGraphUserLinksDataApplicationName :: String,
                                                 outputFacebookGraphUserLinksDataApplicationId :: String}
  deriving (Data.Data.Data,
            Eq,
            Read,
            Show,
            Data.Typeable.Typeable)
instance Data.Aeson.ToJSON OutputFacebookGraphUserLinksDataApplication where
  toJSON x
    = Data.Aeson.object
        (Data.Maybe.catMaybes
           [Just
              ((Data.Aeson..=)
                 "name" (outputFacebookGraphUserLinksDataApplicationName x)),
            Just
              ((Data.Aeson..=)
                 "id" (outputFacebookGraphUserLinksDataApplicationId x))])
instance Data.Aeson.FromJSON OutputFacebookGraphUserLinksDataApplication where
  parseJSON
    (Data.Aeson.Object v)
    = (<*>)
        ((<*>)
           (pure OutputFacebookGraphUserLinksDataApplication)
           ((Data.Aeson..:) v "name"))
        ((Data.Aeson..:) v "id")
  parseJSON v
    = fail (show v)
data OutputFacebookGraphUserLinksDataActions
  = OutputFacebookGraphUserLinksDataActions {outputFacebookGraphUserLinksDataActionsLink :: String,
                                             outputFacebookGraphUserLinksDataActionsName :: String}
  deriving (Data.Data.Data,
            Eq,
            Read,
            Show,
            Data.Typeable.Typeable)
instance Data.Aeson.ToJSON OutputFacebookGraphUserLinksDataActions where
  toJSON x
    = Data.Aeson.object
        (Data.Maybe.catMaybes
           [Just
              ((Data.Aeson..=)
                 "link" (outputFacebookGraphUserLinksDataActionsLink x)),
            Just
              ((Data.Aeson..=)
                 "name" (outputFacebookGraphUserLinksDataActionsName x))])
instance Data.Aeson.FromJSON OutputFacebookGraphUserLinksDataActions where
  parseJSON
    (Data.Aeson.Object v)
    = (<*>)
        ((<*>)
           (pure OutputFacebookGraphUserLinksDataActions)
           ((Data.Aeson..:) v "link"))
        ((Data.Aeson..:) v "name")
  parseJSON v
    = fail (show v)
data OutputFacebookGraphUserLinksDataPrivacy
  = OutputFacebookGraphUserLinksDataPrivacy {outputFacebookGraphUserLinksDataPrivacyNetworks :: String,
                                             outputFacebookGraphUserLinksDataPrivacyValue :: String,
                                             outputFacebookGraphUserLinksDataPrivacyAllow :: String,
                                             outputFacebookGraphUserLinksDataPrivacyDeny :: String,
                                             outputFacebookGraphUserLinksDataPrivacyDescription :: String,
                                             outputFacebookGraphUserLinksDataPrivacyFriends :: String}
  deriving (Data.Data.Data,
            Eq,
            Read,
            Show,
            Data.Typeable.Typeable)
instance Data.Aeson.ToJSON OutputFacebookGraphUserLinksDataPrivacy where
  toJSON x
    = Data.Aeson.object
        (Data.Maybe.catMaybes
           [Just
              ((Data.Aeson..=)
                 "networks" (outputFacebookGraphUserLinksDataPrivacyNetworks x)),
            Just
              ((Data.Aeson..=)
                 "value" (outputFacebookGraphUserLinksDataPrivacyValue x)),
            Just
              ((Data.Aeson..=)
                 "allow" (outputFacebookGraphUserLinksDataPrivacyAllow x)),
            Just
              ((Data.Aeson..=)
                 "deny" (outputFacebookGraphUserLinksDataPrivacyDeny x)),
            Just
              ((Data.Aeson..=)
                 "description"
                 (outputFacebookGraphUserLinksDataPrivacyDescription x)),
            Just
              ((Data.Aeson..=)
                 "friends" (outputFacebookGraphUserLinksDataPrivacyFriends x))])
instance Data.Aeson.FromJSON OutputFacebookGraphUserLinksDataPrivacy where
  parseJSON
    (Data.Aeson.Object v)
    = (<*>)
        ((<*>)
           ((<*>)
              ((<*>)
                 ((<*>)
                    ((<*>)
                       (pure OutputFacebookGraphUserLinksDataPrivacy)
                       ((Data.Aeson..:) v "networks"))
                    ((Data.Aeson..:) v "value"))
                 ((Data.Aeson..:) v "allow"))
              ((Data.Aeson..:) v "deny"))
           ((Data.Aeson..:) v "description"))
        ((Data.Aeson..:) v "friends")
  parseJSON v
    = fail (show v)
data OutputFacebookGraphUserLinksDataFrom
  = OutputFacebookGraphUserLinksDataFrom {outputFacebookGraphUserLinksDataFromName :: String,
                                          outputFacebookGraphUserLinksDataFromId :: String}
  deriving (Data.Data.Data,
            Eq,
            Read,
            Show,
            Data.Typeable.Typeable)
instance Data.Aeson.ToJSON OutputFacebookGraphUserLinksDataFrom where
  toJSON x
    = Data.Aeson.object
        (Data.Maybe.catMaybes
           [Just
              ((Data.Aeson..=)
                 "name" (outputFacebookGraphUserLinksDataFromName x)),
            Just
              ((Data.Aeson..=)
                 "id" (outputFacebookGraphUserLinksDataFromId x))])
instance Data.Aeson.FromJSON OutputFacebookGraphUserLinksDataFrom where
  parseJSON
    (Data.Aeson.Object v)
    = (<*>)
        ((<*>)
           (pure OutputFacebookGraphUserLinksDataFrom)
           ((Data.Aeson..:) v "name"))
        ((Data.Aeson..:) v "id")
  parseJSON v
    = fail (show v)
data OutputFacebookGraphUserLinksPaging
  = OutputFacebookGraphUserLinksPaging {outputFacebookGraphUserLinksPagingNext :: String,
                                        outputFacebookGraphUserLinksPagingPrevious :: String}
  deriving (Data.Data.Data,
            Eq,
            Read,
            Show,
            Data.Typeable.Typeable)
instance Data.Aeson.ToJSON OutputFacebookGraphUserLinksPaging where
  toJSON x
    = Data.Aeson.object
        (Data.Maybe.catMaybes
           [Just
              ((Data.Aeson..=)
                 "next" (outputFacebookGraphUserLinksPagingNext x)),
            Just
              ((Data.Aeson..=)
                 "previous" (outputFacebookGraphUserLinksPagingPrevious x))])
instance Data.Aeson.FromJSON OutputFacebookGraphUserLinksPaging where
  parseJSON
    (Data.Aeson.Object v)
    = (<*>)
        ((<*>)
           (pure OutputFacebookGraphUserLinksPaging)
           ((Data.Aeson..:) v "next"))
        ((Data.Aeson..:) v "previous")
  parseJSON v
    = fail (show v)
data InputFacebookGraphUserPhotos
  = InputFacebookGraphUserPhotos {inputFacebookGraphUserPhotosUser_id :: String,
                                  inputFacebookGraphUserPhotosAccess_token :: String}
  deriving (Data.Data.Data,
            Eq,
            Read,
            Show,
            Data.Typeable.Typeable)
instance Data.Aeson.ToJSON InputFacebookGraphUserPhotos where
  toJSON x@(InputFacebookGraphUserPhotos {})
    = Data.Aeson.object
        (Data.Maybe.catMaybes
           [Just
              ((Data.Aeson..=)
                 "user_id" (inputFacebookGraphUserPhotosUser_id x)),
            Just
              ((Data.Aeson..=)
                 "access_token" (inputFacebookGraphUserPhotosAccess_token x))])
instance Data.Aeson.FromJSON InputFacebookGraphUserPhotos where
  parseJSON
    (Data.Aeson.Object v)
    = (<|>)
        ((<*>)
           ((<*>)
              (pure InputFacebookGraphUserPhotos)
              ((Data.Aeson..:) v "user_id"))
           ((Data.Aeson..:) v "access_token"))
        empty
  parseJSON _ = mzero
instance Data.TH.Object.Object InputFacebookGraphUserPhotos String Language.JavaScript.Interpret.Primitive where
  toObject x@(InputFacebookGraphUserPhotos {})
    = fromList
        (Data.Maybe.catMaybes
           [Just
              ((\ k_aXZS v_aXZT -> (k_aXZS, Data.TH.Convert.convert v_aXZT))
                 "user_id" (inputFacebookGraphUserPhotosUser_id x)),
            Just
              ((\ k_aXZS v_aXZT -> (k_aXZS, Data.TH.Convert.convert v_aXZT))
                 "access_token" (inputFacebookGraphUserPhotosAccess_token x))])
data OutputFacebookGraphUserPhotos
  = OutputFacebookGraphUserPhotos {outputFacebookGraphUserPhotosData :: [OutputFacebookGraphUserPhotosData],
                                   outputFacebookGraphUserPhotosPaging :: OutputFacebookGraphUserPhotosPaging}
  deriving (Data.Data.Data,
            Eq,
            Read,
            Show,
            Data.Typeable.Typeable)
instance Data.Aeson.ToJSON OutputFacebookGraphUserPhotos where
  toJSON x
    = Data.Aeson.object
        (Data.Maybe.catMaybes
           [Just
              ((Data.Aeson..=)
                 "data" (outputFacebookGraphUserPhotosData x)),
            Just
              ((Data.Aeson..=)
                 "paging" (outputFacebookGraphUserPhotosPaging x))])
instance Data.Aeson.FromJSON OutputFacebookGraphUserPhotos where
  parseJSON
    (Data.Aeson.Object v)
    = (<*>)
        ((<*>)
           (pure OutputFacebookGraphUserPhotos)
           ((Data.Aeson..:) v "data"))
        ((Data.Aeson..:) v "paging")
  parseJSON v
    = fail (show v)
data OutputFacebookGraphUserPhotosData
  = OutputFacebookGraphUserPhotosData {outputFacebookGraphUserPhotosDataImages :: [OutputFacebookGraphUserPhotosDataImages],
                                       outputFacebookGraphUserPhotosDataHeight :: Double,
                                       outputFacebookGraphUserPhotosDataLink :: String,
                                       outputFacebookGraphUserPhotosDataIcon :: String,
                                       outputFacebookGraphUserPhotosDataWidth :: Double,
                                       outputFacebookGraphUserPhotosDataFrom :: OutputFacebookGraphUserPhotosDataFrom,
                                       outputFacebookGraphUserPhotosDataBackdated_time :: Maybe String,
                                       outputFacebookGraphUserPhotosDataPicture :: String,
                                       outputFacebookGraphUserPhotosDataUpdated_time :: String,
                                       outputFacebookGraphUserPhotosDataName :: Maybe String,
                                       outputFacebookGraphUserPhotosDataBackdated_time_granularity :: Maybe String,
                                       outputFacebookGraphUserPhotosDataCreated_time :: String,
                                       outputFacebookGraphUserPhotosDataSource :: String,
                                       outputFacebookGraphUserPhotosDataId :: String,
                                       outputFacebookGraphUserPhotosDataPlace :: Maybe OutputFacebookGraphUserPhotosDataPlace,
                                       outputFacebookGraphUserPhotosDataTags :: OutputFacebookGraphUserPhotosDataTags}
  deriving (Data.Data.Data,
            Eq,
            Read,
            Show,
            Data.Typeable.Typeable)
instance Data.Aeson.ToJSON OutputFacebookGraphUserPhotosData where
  toJSON x
    = Data.Aeson.object
        (Data.Maybe.catMaybes
           [Just
              ((Data.Aeson..=)
                 "images" (outputFacebookGraphUserPhotosDataImages x)),
            Just
              ((Data.Aeson..=)
                 "height" (outputFacebookGraphUserPhotosDataHeight x)),
            Just
              ((Data.Aeson..=)
                 "link" (outputFacebookGraphUserPhotosDataLink x)),
            Just
              ((Data.Aeson..=)
                 "icon" (outputFacebookGraphUserPhotosDataIcon x)),
            Just
              ((Data.Aeson..=)
                 "width" (outputFacebookGraphUserPhotosDataWidth x)),
            Just
              ((Data.Aeson..=)
                 "from" (outputFacebookGraphUserPhotosDataFrom x)),
            fmap
              ((Data.Aeson..=) "backdated_time")
              (outputFacebookGraphUserPhotosDataBackdated_time x),
            Just
              ((Data.Aeson..=)
                 "picture" (outputFacebookGraphUserPhotosDataPicture x)),
            Just
              ((Data.Aeson..=)
                 "updated_time" (outputFacebookGraphUserPhotosDataUpdated_time x)),
            fmap
              ((Data.Aeson..=) "name")
              (outputFacebookGraphUserPhotosDataName x),
            fmap
              ((Data.Aeson..=) "backdated_time_granularity")
              (outputFacebookGraphUserPhotosDataBackdated_time_granularity x),
            Just
              ((Data.Aeson..=)
                 "created_time" (outputFacebookGraphUserPhotosDataCreated_time x)),
            Just
              ((Data.Aeson..=)
                 "source" (outputFacebookGraphUserPhotosDataSource x)),
            Just
              ((Data.Aeson..=)
                 "id" (outputFacebookGraphUserPhotosDataId x)),
            fmap
              ((Data.Aeson..=) "place")
              (outputFacebookGraphUserPhotosDataPlace x),
            Just
              ((Data.Aeson..=)
                 "tags" (outputFacebookGraphUserPhotosDataTags x))])
instance Data.Aeson.FromJSON OutputFacebookGraphUserPhotosData where
  parseJSON
    (Data.Aeson.Object v)
    = (<*>)
        ((<*>)
           ((<*>)
              ((<*>)
                 ((<*>)
                    ((<*>)
                       ((<*>)
                          ((<*>)
                             ((<*>)
                                ((<*>)
                                   ((<*>)
                                      ((<*>)
                                         ((<*>)
                                            ((<*>)
                                               ((<*>)
                                                  ((<*>)
                                                     (pure
                                                        OutputFacebookGraphUserPhotosData)
                                                     ((Data.Aeson..:) v "images"))
                                                  ((Data.Aeson..:) v "height"))
                                               ((Data.Aeson..:) v "link"))
                                            ((Data.Aeson..:) v "icon"))
                                         ((Data.Aeson..:) v "width"))
                                      ((Data.Aeson..:) v "from"))
                                   ((Data.Aeson..:?) v "backdated_time"))
                                ((Data.Aeson..:) v "picture"))
                             ((Data.Aeson..:) v "updated_time"))
                          ((Data.Aeson..:?) v "name"))
                       ((Data.Aeson..:?) v "backdated_time_granularity"))
                    ((Data.Aeson..:) v "created_time"))
                 ((Data.Aeson..:) v "source"))
              ((Data.Aeson..:) v "id"))
           ((Data.Aeson..:?) v "place"))
        ((Data.Aeson..:) v "tags")
  parseJSON v
    = fail (show v)
data OutputFacebookGraphUserPhotosDataImages
  = OutputFacebookGraphUserPhotosDataImages {outputFacebookGraphUserPhotosDataImagesHeight :: Double,
                                             outputFacebookGraphUserPhotosDataImagesWidth :: Double,
                                             outputFacebookGraphUserPhotosDataImagesSource :: String}
  deriving (Data.Data.Data,
            Eq,
            Read,
            Show,
            Data.Typeable.Typeable)
instance Data.Aeson.ToJSON OutputFacebookGraphUserPhotosDataImages where
  toJSON x
    = Data.Aeson.object
        (Data.Maybe.catMaybes
           [Just
              ((Data.Aeson..=)
                 "height" (outputFacebookGraphUserPhotosDataImagesHeight x)),
            Just
              ((Data.Aeson..=)
                 "width" (outputFacebookGraphUserPhotosDataImagesWidth x)),
            Just
              ((Data.Aeson..=)
                 "source" (outputFacebookGraphUserPhotosDataImagesSource x))])
instance Data.Aeson.FromJSON OutputFacebookGraphUserPhotosDataImages where
  parseJSON
    (Data.Aeson.Object v)
    = (<*>)
        ((<*>)
           ((<*>)
              (pure OutputFacebookGraphUserPhotosDataImages)
              ((Data.Aeson..:) v "height"))
           ((Data.Aeson..:) v "width"))
        ((Data.Aeson..:) v "source")
  parseJSON v
    = fail (show v)
data OutputFacebookGraphUserPhotosDataFrom
  = OutputFacebookGraphUserPhotosDataFrom {outputFacebookGraphUserPhotosDataFromName :: String,
                                           outputFacebookGraphUserPhotosDataFromId :: String}
  deriving (Data.Data.Data,
            Eq,
            Read,
            Show,
            Data.Typeable.Typeable)
instance Data.Aeson.ToJSON OutputFacebookGraphUserPhotosDataFrom where
  toJSON x
    = Data.Aeson.object
        (Data.Maybe.catMaybes
           [Just
              ((Data.Aeson..=)
                 "name" (outputFacebookGraphUserPhotosDataFromName x)),
            Just
              ((Data.Aeson..=)
                 "id" (outputFacebookGraphUserPhotosDataFromId x))])
instance Data.Aeson.FromJSON OutputFacebookGraphUserPhotosDataFrom where
  parseJSON
    (Data.Aeson.Object v)
    = (<*>)
        ((<*>)
           (pure OutputFacebookGraphUserPhotosDataFrom)
           ((Data.Aeson..:) v "name"))
        ((Data.Aeson..:) v "id")
  parseJSON v
    = fail (show v)
data OutputFacebookGraphUserPhotosDataPlace
  = OutputFacebookGraphUserPhotosDataPlace {outputFacebookGraphUserPhotosDataPlaceLocation :: OutputFacebookGraphUserPhotosDataPlaceLocation,
                                            outputFacebookGraphUserPhotosDataPlaceName :: String,
                                            outputFacebookGraphUserPhotosDataPlaceId :: String}
  deriving (Data.Data.Data,
            Eq,
            Read,
            Show,
            Data.Typeable.Typeable)
instance Data.Aeson.ToJSON OutputFacebookGraphUserPhotosDataPlace where
  toJSON x
    = Data.Aeson.object
        (Data.Maybe.catMaybes
           [Just
              ((Data.Aeson..=)
                 "location" (outputFacebookGraphUserPhotosDataPlaceLocation x)),
            Just
              ((Data.Aeson..=)
                 "name" (outputFacebookGraphUserPhotosDataPlaceName x)),
            Just
              ((Data.Aeson..=)
                 "id" (outputFacebookGraphUserPhotosDataPlaceId x))])
instance Data.Aeson.FromJSON OutputFacebookGraphUserPhotosDataPlace where
  parseJSON
    (Data.Aeson.Object v)
    = (<*>)
        ((<*>)
           ((<*>)
              (pure OutputFacebookGraphUserPhotosDataPlace)
              ((Data.Aeson..:) v "location"))
           ((Data.Aeson..:) v "name"))
        ((Data.Aeson..:) v "id")
  parseJSON v
    = fail (show v)
data OutputFacebookGraphUserPhotosDataPlaceLocation
  = OutputFacebookGraphUserPhotosDataPlaceLocation {outputFacebookGraphUserPhotosDataPlaceLocationLatitude :: Double,
                                                    outputFacebookGraphUserPhotosDataPlaceLocationLongitude :: Double}
  deriving (Data.Data.Data,
            Eq,
            Read,
            Show,
            Data.Typeable.Typeable)
instance Data.Aeson.ToJSON OutputFacebookGraphUserPhotosDataPlaceLocation where
  toJSON x
    = Data.Aeson.object
        (Data.Maybe.catMaybes
           [Just
              ((Data.Aeson..=)
                 "latitude"
                 (outputFacebookGraphUserPhotosDataPlaceLocationLatitude x)),
            Just
              ((Data.Aeson..=)
                 "longitude"
                 (outputFacebookGraphUserPhotosDataPlaceLocationLongitude x))])
instance Data.Aeson.FromJSON OutputFacebookGraphUserPhotosDataPlaceLocation where
  parseJSON
    (Data.Aeson.Object v)
    = (<*>)
        ((<*>)
           (pure OutputFacebookGraphUserPhotosDataPlaceLocation)
           ((Data.Aeson..:) v "latitude"))
        ((Data.Aeson..:) v "longitude")
  parseJSON v
    = fail (show v)
data OutputFacebookGraphUserPhotosDataTags
  = OutputFacebookGraphUserPhotosDataTags {outputFacebookGraphUserPhotosDataTagsData :: [OutputFacebookGraphUserPhotosDataTagsData],
                                           outputFacebookGraphUserPhotosDataTagsPaging :: OutputFacebookGraphUserPhotosDataTagsPaging}
  deriving (Data.Data.Data,
            Eq,
            Read,
            Show,
            Data.Typeable.Typeable)
instance Data.Aeson.ToJSON OutputFacebookGraphUserPhotosDataTags where
  toJSON x
    = Data.Aeson.object
        (Data.Maybe.catMaybes
           [Just
              ((Data.Aeson..=)
                 "data" (outputFacebookGraphUserPhotosDataTagsData x)),
            Just
              ((Data.Aeson..=)
                 "paging" (outputFacebookGraphUserPhotosDataTagsPaging x))])
instance Data.Aeson.FromJSON OutputFacebookGraphUserPhotosDataTags where
  parseJSON
    (Data.Aeson.Object v)
    = (<*>)
        ((<*>)
           (pure OutputFacebookGraphUserPhotosDataTags)
           ((Data.Aeson..:) v "data"))
        ((Data.Aeson..:) v "paging")
  parseJSON v
    = fail (show v)
data OutputFacebookGraphUserPhotosDataTagsData
  = OutputFacebookGraphUserPhotosDataTagsData {outputFacebookGraphUserPhotosDataTagsDataName :: String,
                                               outputFacebookGraphUserPhotosDataTagsDataCreated_time :: String,
                                               outputFacebookGraphUserPhotosDataTagsDataId :: String,
                                               outputFacebookGraphUserPhotosDataTagsDataX :: Double,
                                               outputFacebookGraphUserPhotosDataTagsDataY :: Double}
  deriving (Data.Data.Data,
            Eq,
            Read,
            Show,
            Data.Typeable.Typeable)
instance Data.Aeson.ToJSON OutputFacebookGraphUserPhotosDataTagsData where
  toJSON x
    = Data.Aeson.object
        (Data.Maybe.catMaybes
           [Just
              ((Data.Aeson..=)
                 "name" (outputFacebookGraphUserPhotosDataTagsDataName x)),
            Just
              ((Data.Aeson..=)
                 "created_time"
                 (outputFacebookGraphUserPhotosDataTagsDataCreated_time x)),
            Just
              ((Data.Aeson..=)
                 "id" (outputFacebookGraphUserPhotosDataTagsDataId x)),
            Just
              ((Data.Aeson..=)
                 "x" (outputFacebookGraphUserPhotosDataTagsDataX x)),
            Just
              ((Data.Aeson..=)
                 "y" (outputFacebookGraphUserPhotosDataTagsDataY x))])
instance Data.Aeson.FromJSON OutputFacebookGraphUserPhotosDataTagsData where
  parseJSON
    (Data.Aeson.Object v)
    = (<*>)
        ((<*>)
           ((<*>)
              ((<*>)
                 ((<*>)
                    (pure OutputFacebookGraphUserPhotosDataTagsData)
                    ((Data.Aeson..:) v "name"))
                 ((Data.Aeson..:) v "created_time"))
              ((Data.Aeson..:) v "id"))
           ((Data.Aeson..:) v "x"))
        ((Data.Aeson..:) v "y")
  parseJSON v
    = fail (show v)
data OutputFacebookGraphUserPhotosDataTagsPaging
  = OutputFacebookGraphUserPhotosDataTagsPaging {outputFacebookGraphUserPhotosDataTagsPagingCursors :: OutputFacebookGraphUserPhotosDataTagsPagingCursors}
  deriving (Data.Data.Data,
            Eq,
            Read,
            Show,
            Data.Typeable.Typeable)
instance Data.Aeson.ToJSON OutputFacebookGraphUserPhotosDataTagsPaging where
  toJSON x
    = Data.Aeson.object
        (Data.Maybe.catMaybes
           [Just
              ((Data.Aeson..=)
                 "cursors" (outputFacebookGraphUserPhotosDataTagsPagingCursors x))])
instance Data.Aeson.FromJSON OutputFacebookGraphUserPhotosDataTagsPaging where
  parseJSON
    (Data.Aeson.Object v)
    = (<*>)
        (pure OutputFacebookGraphUserPhotosDataTagsPaging)
        ((Data.Aeson..:) v "cursors")
  parseJSON v
    = fail (show v)
data OutputFacebookGraphUserPhotosDataTagsPagingCursors
  = OutputFacebookGraphUserPhotosDataTagsPagingCursors {outputFacebookGraphUserPhotosDataTagsPagingCursorsAfter :: String,
                                                        outputFacebookGraphUserPhotosDataTagsPagingCursorsBefore :: String}
  deriving (Data.Data.Data,
            Eq,
            Read,
            Show,
            Data.Typeable.Typeable)
instance Data.Aeson.ToJSON OutputFacebookGraphUserPhotosDataTagsPagingCursors where
  toJSON x
    = Data.Aeson.object
        (Data.Maybe.catMaybes
           [Just
              ((Data.Aeson..=)
                 "after"
                 (outputFacebookGraphUserPhotosDataTagsPagingCursorsAfter x)),
            Just
              ((Data.Aeson..=)
                 "before"
                 (outputFacebookGraphUserPhotosDataTagsPagingCursorsBefore x))])
instance Data.Aeson.FromJSON OutputFacebookGraphUserPhotosDataTagsPagingCursors where
  parseJSON
    (Data.Aeson.Object v)
    = (<*>)
        ((<*>)
           (pure OutputFacebookGraphUserPhotosDataTagsPagingCursors)
           ((Data.Aeson..:) v "after"))
        ((Data.Aeson..:) v "before")
  parseJSON v
    = fail (show v)
data OutputFacebookGraphUserPhotosPaging
  = OutputFacebookGraphUserPhotosPaging {outputFacebookGraphUserPhotosPagingCursors :: OutputFacebookGraphUserPhotosPagingCursors}
  deriving (Data.Data.Data,
            Eq,
            Read,
            Show,
            Data.Typeable.Typeable)
instance Data.Aeson.ToJSON OutputFacebookGraphUserPhotosPaging where
  toJSON x
    = Data.Aeson.object
        (Data.Maybe.catMaybes
           [Just
              ((Data.Aeson..=)
                 "cursors" (outputFacebookGraphUserPhotosPagingCursors x))])
instance Data.Aeson.FromJSON OutputFacebookGraphUserPhotosPaging where
  parseJSON
    (Data.Aeson.Object v)
    = (<*>)
        (pure OutputFacebookGraphUserPhotosPaging)
        ((Data.Aeson..:) v "cursors")
  parseJSON v
    = fail (show v)
data OutputFacebookGraphUserPhotosPagingCursors
  = OutputFacebookGraphUserPhotosPagingCursors {outputFacebookGraphUserPhotosPagingCursorsAfter :: String,
                                                outputFacebookGraphUserPhotosPagingCursorsBefore :: String}
  deriving (Data.Data.Data,
            Eq,
            Read,
            Show,
            Data.Typeable.Typeable)
instance Data.Aeson.ToJSON OutputFacebookGraphUserPhotosPagingCursors where
  toJSON x
    = Data.Aeson.object
        (Data.Maybe.catMaybes
           [Just
              ((Data.Aeson..=)
                 "after" (outputFacebookGraphUserPhotosPagingCursorsAfter x)),
            Just
              ((Data.Aeson..=)
                 "before" (outputFacebookGraphUserPhotosPagingCursorsBefore x))])
instance Data.Aeson.FromJSON OutputFacebookGraphUserPhotosPagingCursors where
  parseJSON
    (Data.Aeson.Object v)
    = (<*>)
        ((<*>)
           (pure OutputFacebookGraphUserPhotosPagingCursors)
           ((Data.Aeson..:) v "after"))
        ((Data.Aeson..:) v "before")
  parseJSON v
    = fail (show v)
data InputFacebookGraphUserPhotosuploaded
  = InputFacebookGraphUserPhotosuploaded {inputFacebookGraphUserPhotosuploadedUser_id :: String,
                                          inputFacebookGraphUserPhotosuploadedAccess_token :: String}
  deriving (Data.Data.Data,
            Eq,
            Read,
            Show,
            Data.Typeable.Typeable)
instance Data.Aeson.ToJSON InputFacebookGraphUserPhotosuploaded where
  toJSON
    x@(InputFacebookGraphUserPhotosuploaded {})
    = Data.Aeson.object
        (Data.Maybe.catMaybes
           [Just
              ((Data.Aeson..=)
                 "user_id" (inputFacebookGraphUserPhotosuploadedUser_id x)),
            Just
              ((Data.Aeson..=)
                 "access_token"
                 (inputFacebookGraphUserPhotosuploadedAccess_token x))])
instance Data.Aeson.FromJSON InputFacebookGraphUserPhotosuploaded where
  parseJSON
    (Data.Aeson.Object v)
    = (<|>)
        ((<*>)
           ((<*>)
              (pure InputFacebookGraphUserPhotosuploaded)
              ((Data.Aeson..:) v "user_id"))
           ((Data.Aeson..:) v "access_token"))
        empty
  parseJSON _ = mzero
instance Data.TH.Object.Object InputFacebookGraphUserPhotosuploaded String Language.JavaScript.Interpret.Primitive where
  toObject x@(InputFacebookGraphUserPhotosuploaded {})
    = fromList
        (Data.Maybe.catMaybes
           [Just
              ((\ k_aXZU v_aXZV -> (k_aXZU, Data.TH.Convert.convert v_aXZV))
                 "user_id" (inputFacebookGraphUserPhotosuploadedUser_id x)),
            Just
              ((\ k_aXZU v_aXZV -> (k_aXZU, Data.TH.Convert.convert v_aXZV))
                 "access_token"
                 (inputFacebookGraphUserPhotosuploadedAccess_token x))])
data OutputFacebookGraphUserPhotosuploaded
  = OutputFacebookGraphUserPhotosuploaded {outputFacebookGraphUserPhotosuploadedData :: [OutputFacebookGraphUserPhotosuploadedData],
                                           outputFacebookGraphUserPhotosuploadedPaging :: OutputFacebookGraphUserPhotosuploadedPaging}
  deriving (Data.Data.Data,
            Eq,
            Read,
            Show,
            Data.Typeable.Typeable)
instance Data.Aeson.ToJSON OutputFacebookGraphUserPhotosuploaded where
  toJSON x
    = Data.Aeson.object
        (Data.Maybe.catMaybes
           [Just
              ((Data.Aeson..=)
                 "data" (outputFacebookGraphUserPhotosuploadedData x)),
            Just
              ((Data.Aeson..=)
                 "paging" (outputFacebookGraphUserPhotosuploadedPaging x))])
instance Data.Aeson.FromJSON OutputFacebookGraphUserPhotosuploaded where
  parseJSON
    (Data.Aeson.Object v)
    = (<*>)
        ((<*>)
           (pure OutputFacebookGraphUserPhotosuploaded)
           ((Data.Aeson..:) v "data"))
        ((Data.Aeson..:) v "paging")
  parseJSON v
    = fail (show v)
data OutputFacebookGraphUserPhotosuploadedData
  = OutputFacebookGraphUserPhotosuploadedData {outputFacebookGraphUserPhotosuploadedDataImages :: [OutputFacebookGraphUserPhotosuploadedDataImages],
                                               outputFacebookGraphUserPhotosuploadedDataHeight :: Double,
                                               outputFacebookGraphUserPhotosuploadedDataLink :: String,
                                               outputFacebookGraphUserPhotosuploadedDataIcon :: String,
                                               outputFacebookGraphUserPhotosuploadedDataWidth :: Double,
                                               outputFacebookGraphUserPhotosuploadedDataFrom :: OutputFacebookGraphUserPhotosuploadedDataFrom,
                                               outputFacebookGraphUserPhotosuploadedDataBackdated_time :: Maybe String,
                                               outputFacebookGraphUserPhotosuploadedDataPicture :: String,
                                               outputFacebookGraphUserPhotosuploadedDataUpdated_time :: String,
                                               outputFacebookGraphUserPhotosuploadedDataName :: Maybe String,
                                               outputFacebookGraphUserPhotosuploadedDataBackdated_time_granularity :: Maybe String,
                                               outputFacebookGraphUserPhotosuploadedDataCreated_time :: String,
                                               outputFacebookGraphUserPhotosuploadedDataSource :: String,
                                               outputFacebookGraphUserPhotosuploadedDataId :: String,
                                               outputFacebookGraphUserPhotosuploadedDataPlace :: Maybe OutputFacebookGraphUserPhotosuploadedDataPlace,
                                               outputFacebookGraphUserPhotosuploadedDataTags :: OutputFacebookGraphUserPhotosuploadedDataTags}
  deriving (Data.Data.Data,
            Eq,
            Read,
            Show,
            Data.Typeable.Typeable)
instance Data.Aeson.ToJSON OutputFacebookGraphUserPhotosuploadedData where
  toJSON x
    = Data.Aeson.object
        (Data.Maybe.catMaybes
           [Just
              ((Data.Aeson..=)
                 "images" (outputFacebookGraphUserPhotosuploadedDataImages x)),
            Just
              ((Data.Aeson..=)
                 "height" (outputFacebookGraphUserPhotosuploadedDataHeight x)),
            Just
              ((Data.Aeson..=)
                 "link" (outputFacebookGraphUserPhotosuploadedDataLink x)),
            Just
              ((Data.Aeson..=)
                 "icon" (outputFacebookGraphUserPhotosuploadedDataIcon x)),
            Just
              ((Data.Aeson..=)
                 "width" (outputFacebookGraphUserPhotosuploadedDataWidth x)),
            Just
              ((Data.Aeson..=)
                 "from" (outputFacebookGraphUserPhotosuploadedDataFrom x)),
            fmap
              ((Data.Aeson..=) "backdated_time")
              (outputFacebookGraphUserPhotosuploadedDataBackdated_time x),
            Just
              ((Data.Aeson..=)
                 "picture" (outputFacebookGraphUserPhotosuploadedDataPicture x)),
            Just
              ((Data.Aeson..=)
                 "updated_time"
                 (outputFacebookGraphUserPhotosuploadedDataUpdated_time x)),
            fmap
              ((Data.Aeson..=) "name")
              (outputFacebookGraphUserPhotosuploadedDataName x),
            fmap
              ((Data.Aeson..=) "backdated_time_granularity")
              (outputFacebookGraphUserPhotosuploadedDataBackdated_time_granularity
                 x),
            Just
              ((Data.Aeson..=)
                 "created_time"
                 (outputFacebookGraphUserPhotosuploadedDataCreated_time x)),
            Just
              ((Data.Aeson..=)
                 "source" (outputFacebookGraphUserPhotosuploadedDataSource x)),
            Just
              ((Data.Aeson..=)
                 "id" (outputFacebookGraphUserPhotosuploadedDataId x)),
            fmap
              ((Data.Aeson..=) "place")
              (outputFacebookGraphUserPhotosuploadedDataPlace x),
            Just
              ((Data.Aeson..=)
                 "tags" (outputFacebookGraphUserPhotosuploadedDataTags x))])
instance Data.Aeson.FromJSON OutputFacebookGraphUserPhotosuploadedData where
  parseJSON
    (Data.Aeson.Object v)
    = (<*>)
        ((<*>)
           ((<*>)
              ((<*>)
                 ((<*>)
                    ((<*>)
                       ((<*>)
                          ((<*>)
                             ((<*>)
                                ((<*>)
                                   ((<*>)
                                      ((<*>)
                                         ((<*>)
                                            ((<*>)
                                               ((<*>)
                                                  ((<*>)
                                                     (pure
                                                        OutputFacebookGraphUserPhotosuploadedData)
                                                     ((Data.Aeson..:) v "images"))
                                                  ((Data.Aeson..:) v "height"))
                                               ((Data.Aeson..:) v "link"))
                                            ((Data.Aeson..:) v "icon"))
                                         ((Data.Aeson..:) v "width"))
                                      ((Data.Aeson..:) v "from"))
                                   ((Data.Aeson..:?) v "backdated_time"))
                                ((Data.Aeson..:) v "picture"))
                             ((Data.Aeson..:) v "updated_time"))
                          ((Data.Aeson..:?) v "name"))
                       ((Data.Aeson..:?) v "backdated_time_granularity"))
                    ((Data.Aeson..:) v "created_time"))
                 ((Data.Aeson..:) v "source"))
              ((Data.Aeson..:) v "id"))
           ((Data.Aeson..:?) v "place"))
        ((Data.Aeson..:) v "tags")
  parseJSON v
    = fail (show v)
data OutputFacebookGraphUserPhotosuploadedDataImages
  = OutputFacebookGraphUserPhotosuploadedDataImages {outputFacebookGraphUserPhotosuploadedDataImagesHeight :: Double,
                                                     outputFacebookGraphUserPhotosuploadedDataImagesWidth :: Double,
                                                     outputFacebookGraphUserPhotosuploadedDataImagesSource :: String}
  deriving (Data.Data.Data,
            Eq,
            Read,
            Show,
            Data.Typeable.Typeable)
instance Data.Aeson.ToJSON OutputFacebookGraphUserPhotosuploadedDataImages where
  toJSON x
    = Data.Aeson.object
        (Data.Maybe.catMaybes
           [Just
              ((Data.Aeson..=)
                 "height"
                 (outputFacebookGraphUserPhotosuploadedDataImagesHeight x)),
            Just
              ((Data.Aeson..=)
                 "width" (outputFacebookGraphUserPhotosuploadedDataImagesWidth x)),
            Just
              ((Data.Aeson..=)
                 "source"
                 (outputFacebookGraphUserPhotosuploadedDataImagesSource x))])
instance Data.Aeson.FromJSON OutputFacebookGraphUserPhotosuploadedDataImages where
  parseJSON
    (Data.Aeson.Object v)
    = (<*>)
        ((<*>)
           ((<*>)
              (pure OutputFacebookGraphUserPhotosuploadedDataImages)
              ((Data.Aeson..:) v "height"))
           ((Data.Aeson..:) v "width"))
        ((Data.Aeson..:) v "source")
  parseJSON v
    = fail (show v)
data OutputFacebookGraphUserPhotosuploadedDataFrom
  = OutputFacebookGraphUserPhotosuploadedDataFrom {outputFacebookGraphUserPhotosuploadedDataFromName :: String,
                                                   outputFacebookGraphUserPhotosuploadedDataFromId :: String}
  deriving (Data.Data.Data,
            Eq,
            Read,
            Show,
            Data.Typeable.Typeable)
instance Data.Aeson.ToJSON OutputFacebookGraphUserPhotosuploadedDataFrom where
  toJSON x
    = Data.Aeson.object
        (Data.Maybe.catMaybes
           [Just
              ((Data.Aeson..=)
                 "name" (outputFacebookGraphUserPhotosuploadedDataFromName x)),
            Just
              ((Data.Aeson..=)
                 "id" (outputFacebookGraphUserPhotosuploadedDataFromId x))])
instance Data.Aeson.FromJSON OutputFacebookGraphUserPhotosuploadedDataFrom where
  parseJSON
    (Data.Aeson.Object v)
    = (<*>)
        ((<*>)
           (pure OutputFacebookGraphUserPhotosuploadedDataFrom)
           ((Data.Aeson..:) v "name"))
        ((Data.Aeson..:) v "id")
  parseJSON v
    = fail (show v)
data OutputFacebookGraphUserPhotosuploadedDataPlace
  = OutputFacebookGraphUserPhotosuploadedDataPlace {outputFacebookGraphUserPhotosuploadedDataPlaceLocation :: OutputFacebookGraphUserPhotosuploadedDataPlaceLocation,
                                                    outputFacebookGraphUserPhotosuploadedDataPlaceName :: String,
                                                    outputFacebookGraphUserPhotosuploadedDataPlaceId :: String}
  deriving (Data.Data.Data,
            Eq,
            Read,
            Show,
            Data.Typeable.Typeable)
instance Data.Aeson.ToJSON OutputFacebookGraphUserPhotosuploadedDataPlace where
  toJSON x
    = Data.Aeson.object
        (Data.Maybe.catMaybes
           [Just
              ((Data.Aeson..=)
                 "location"
                 (outputFacebookGraphUserPhotosuploadedDataPlaceLocation x)),
            Just
              ((Data.Aeson..=)
                 "name" (outputFacebookGraphUserPhotosuploadedDataPlaceName x)),
            Just
              ((Data.Aeson..=)
                 "id" (outputFacebookGraphUserPhotosuploadedDataPlaceId x))])
instance Data.Aeson.FromJSON OutputFacebookGraphUserPhotosuploadedDataPlace where
  parseJSON
    (Data.Aeson.Object v)
    = (<*>)
        ((<*>)
           ((<*>)
              (pure OutputFacebookGraphUserPhotosuploadedDataPlace)
              ((Data.Aeson..:) v "location"))
           ((Data.Aeson..:) v "name"))
        ((Data.Aeson..:) v "id")
  parseJSON v
    = fail (show v)
data OutputFacebookGraphUserPhotosuploadedDataPlaceLocation
  = OutputFacebookGraphUserPhotosuploadedDataPlaceLocation {outputFacebookGraphUserPhotosuploadedDataPlaceLocationLatitude :: Double,
                                                            outputFacebookGraphUserPhotosuploadedDataPlaceLocationLongitude :: Double}
  deriving (Data.Data.Data,
            Eq,
            Read,
            Show,
            Data.Typeable.Typeable)
instance Data.Aeson.ToJSON OutputFacebookGraphUserPhotosuploadedDataPlaceLocation where
  toJSON x
    = Data.Aeson.object
        (Data.Maybe.catMaybes
           [Just
              ((Data.Aeson..=)
                 "latitude"
                 (outputFacebookGraphUserPhotosuploadedDataPlaceLocationLatitude
                    x)),
            Just
              ((Data.Aeson..=)
                 "longitude"
                 (outputFacebookGraphUserPhotosuploadedDataPlaceLocationLongitude
                    x))])
instance Data.Aeson.FromJSON OutputFacebookGraphUserPhotosuploadedDataPlaceLocation where
  parseJSON
    (Data.Aeson.Object v)
    = (<*>)
        ((<*>)
           (pure
              OutputFacebookGraphUserPhotosuploadedDataPlaceLocation)
           ((Data.Aeson..:) v "latitude"))
        ((Data.Aeson..:) v "longitude")
  parseJSON v
    = fail (show v)
data OutputFacebookGraphUserPhotosuploadedDataTags
  = OutputFacebookGraphUserPhotosuploadedDataTags {outputFacebookGraphUserPhotosuploadedDataTagsData :: [OutputFacebookGraphUserPhotosuploadedDataTagsData],
                                                   outputFacebookGraphUserPhotosuploadedDataTagsPaging :: OutputFacebookGraphUserPhotosuploadedDataTagsPaging}
  deriving (Data.Data.Data,
            Eq,
            Read,
            Show,
            Data.Typeable.Typeable)
instance Data.Aeson.ToJSON OutputFacebookGraphUserPhotosuploadedDataTags where
  toJSON x
    = Data.Aeson.object
        (Data.Maybe.catMaybes
           [Just
              ((Data.Aeson..=)
                 "data" (outputFacebookGraphUserPhotosuploadedDataTagsData x)),
            Just
              ((Data.Aeson..=)
                 "paging" (outputFacebookGraphUserPhotosuploadedDataTagsPaging x))])
instance Data.Aeson.FromJSON OutputFacebookGraphUserPhotosuploadedDataTags where
  parseJSON
    (Data.Aeson.Object v)
    = (<*>)
        ((<*>)
           (pure OutputFacebookGraphUserPhotosuploadedDataTags)
           ((Data.Aeson..:) v "data"))
        ((Data.Aeson..:) v "paging")
  parseJSON v
    = fail (show v)
data OutputFacebookGraphUserPhotosuploadedDataTagsData
  = OutputFacebookGraphUserPhotosuploadedDataTagsData {outputFacebookGraphUserPhotosuploadedDataTagsDataName :: String,
                                                       outputFacebookGraphUserPhotosuploadedDataTagsDataCreated_time :: String,
                                                       outputFacebookGraphUserPhotosuploadedDataTagsDataId :: String,
                                                       outputFacebookGraphUserPhotosuploadedDataTagsDataX :: Double,
                                                       outputFacebookGraphUserPhotosuploadedDataTagsDataY :: Double}
  deriving (Data.Data.Data,
            Eq,
            Read,
            Show,
            Data.Typeable.Typeable)
instance Data.Aeson.ToJSON OutputFacebookGraphUserPhotosuploadedDataTagsData where
  toJSON x
    = Data.Aeson.object
        (Data.Maybe.catMaybes
           [Just
              ((Data.Aeson..=)
                 "name" (outputFacebookGraphUserPhotosuploadedDataTagsDataName x)),
            Just
              ((Data.Aeson..=)
                 "created_time"
                 (outputFacebookGraphUserPhotosuploadedDataTagsDataCreated_time x)),
            Just
              ((Data.Aeson..=)
                 "id" (outputFacebookGraphUserPhotosuploadedDataTagsDataId x)),
            Just
              ((Data.Aeson..=)
                 "x" (outputFacebookGraphUserPhotosuploadedDataTagsDataX x)),
            Just
              ((Data.Aeson..=)
                 "y" (outputFacebookGraphUserPhotosuploadedDataTagsDataY x))])
instance Data.Aeson.FromJSON OutputFacebookGraphUserPhotosuploadedDataTagsData where
  parseJSON
    (Data.Aeson.Object v)
    = (<*>)
        ((<*>)
           ((<*>)
              ((<*>)
                 ((<*>)
                    (pure OutputFacebookGraphUserPhotosuploadedDataTagsData)
                    ((Data.Aeson..:) v "name"))
                 ((Data.Aeson..:) v "created_time"))
              ((Data.Aeson..:) v "id"))
           ((Data.Aeson..:) v "x"))
        ((Data.Aeson..:) v "y")
  parseJSON v
    = fail (show v)
data OutputFacebookGraphUserPhotosuploadedDataTagsPaging
  = OutputFacebookGraphUserPhotosuploadedDataTagsPaging {outputFacebookGraphUserPhotosuploadedDataTagsPagingCursors :: OutputFacebookGraphUserPhotosuploadedDataTagsPagingCursors}
  deriving (Data.Data.Data,
            Eq,
            Read,
            Show,
            Data.Typeable.Typeable)
instance Data.Aeson.ToJSON OutputFacebookGraphUserPhotosuploadedDataTagsPaging where
  toJSON x
    = Data.Aeson.object
        (Data.Maybe.catMaybes
           [Just
              ((Data.Aeson..=)
                 "cursors"
                 (outputFacebookGraphUserPhotosuploadedDataTagsPagingCursors x))])
instance Data.Aeson.FromJSON OutputFacebookGraphUserPhotosuploadedDataTagsPaging where
  parseJSON
    (Data.Aeson.Object v)
    = (<*>)
        (pure OutputFacebookGraphUserPhotosuploadedDataTagsPaging)
        ((Data.Aeson..:) v "cursors")
  parseJSON v
    = fail (show v)
data OutputFacebookGraphUserPhotosuploadedDataTagsPagingCursors
  = OutputFacebookGraphUserPhotosuploadedDataTagsPagingCursors {outputFacebookGraphUserPhotosuploadedDataTagsPagingCursorsAfter :: String,
                                                                outputFacebookGraphUserPhotosuploadedDataTagsPagingCursorsBefore :: String}
  deriving (Data.Data.Data,
            Eq,
            Read,
            Show,
            Data.Typeable.Typeable)
instance Data.Aeson.ToJSON OutputFacebookGraphUserPhotosuploadedDataTagsPagingCursors where
  toJSON x
    = Data.Aeson.object
        (Data.Maybe.catMaybes
           [Just
              ((Data.Aeson..=)
                 "after"
                 (outputFacebookGraphUserPhotosuploadedDataTagsPagingCursorsAfter
                    x)),
            Just
              ((Data.Aeson..=)
                 "before"
                 (outputFacebookGraphUserPhotosuploadedDataTagsPagingCursorsBefore
                    x))])
instance Data.Aeson.FromJSON OutputFacebookGraphUserPhotosuploadedDataTagsPagingCursors where
  parseJSON
    (Data.Aeson.Object v)
    = (<*>)
        ((<*>)
           (pure
              OutputFacebookGraphUserPhotosuploadedDataTagsPagingCursors)
           ((Data.Aeson..:) v "after"))
        ((Data.Aeson..:) v "before")
  parseJSON v
    = fail (show v)
data OutputFacebookGraphUserPhotosuploadedPaging
  = OutputFacebookGraphUserPhotosuploadedPaging {outputFacebookGraphUserPhotosuploadedPagingCursors :: OutputFacebookGraphUserPhotosuploadedPagingCursors}
  deriving (Data.Data.Data,
            Eq,
            Read,
            Show,
            Data.Typeable.Typeable)
instance Data.Aeson.ToJSON OutputFacebookGraphUserPhotosuploadedPaging where
  toJSON x
    = Data.Aeson.object
        (Data.Maybe.catMaybes
           [Just
              ((Data.Aeson..=)
                 "cursors" (outputFacebookGraphUserPhotosuploadedPagingCursors x))])
instance Data.Aeson.FromJSON OutputFacebookGraphUserPhotosuploadedPaging where
  parseJSON
    (Data.Aeson.Object v)
    = (<*>)
        (pure OutputFacebookGraphUserPhotosuploadedPaging)
        ((Data.Aeson..:) v "cursors")
  parseJSON v
    = fail (show v)
data OutputFacebookGraphUserPhotosuploadedPagingCursors
  = OutputFacebookGraphUserPhotosuploadedPagingCursors {outputFacebookGraphUserPhotosuploadedPagingCursorsAfter :: String,
                                                        outputFacebookGraphUserPhotosuploadedPagingCursorsBefore :: String}
  deriving (Data.Data.Data,
            Eq,
            Read,
            Show,
            Data.Typeable.Typeable)
instance Data.Aeson.ToJSON OutputFacebookGraphUserPhotosuploadedPagingCursors where
  toJSON x
    = Data.Aeson.object
        (Data.Maybe.catMaybes
           [Just
              ((Data.Aeson..=)
                 "after"
                 (outputFacebookGraphUserPhotosuploadedPagingCursorsAfter x)),
            Just
              ((Data.Aeson..=)
                 "before"
                 (outputFacebookGraphUserPhotosuploadedPagingCursorsBefore x))])
instance Data.Aeson.FromJSON OutputFacebookGraphUserPhotosuploadedPagingCursors where
  parseJSON
    (Data.Aeson.Object v)
    = (<*>)
        ((<*>)
           (pure OutputFacebookGraphUserPhotosuploadedPagingCursors)
           ((Data.Aeson..:) v "after"))
        ((Data.Aeson..:) v "before")
  parseJSON v
    = fail (show v)
data InputFacebookGraphUserPokes
  = InputFacebookGraphUserPokes {inputFacebookGraphUserPokesUser_id :: String,
                                 inputFacebookGraphUserPokesAccess_token :: String}
  deriving (Data.Data.Data,
            Eq,
            Read,
            Show,
            Data.Typeable.Typeable)
instance Data.Aeson.ToJSON InputFacebookGraphUserPokes where
  toJSON x@(InputFacebookGraphUserPokes {})
    = Data.Aeson.object
        (Data.Maybe.catMaybes
           [Just
              ((Data.Aeson..=)
                 "user_id" (inputFacebookGraphUserPokesUser_id x)),
            Just
              ((Data.Aeson..=)
                 "access_token" (inputFacebookGraphUserPokesAccess_token x))])
instance Data.Aeson.FromJSON InputFacebookGraphUserPokes where
  parseJSON
    (Data.Aeson.Object v)
    = (<|>)
        ((<*>)
           ((<*>)
              (pure InputFacebookGraphUserPokes)
              ((Data.Aeson..:) v "user_id"))
           ((Data.Aeson..:) v "access_token"))
        empty
  parseJSON _ = mzero
instance Data.TH.Object.Object InputFacebookGraphUserPokes String Language.JavaScript.Interpret.Primitive where
  toObject x@(InputFacebookGraphUserPokes {})
    = fromList
        (Data.Maybe.catMaybes
           [Just
              ((\ k_aXZW v_aXZX -> (k_aXZW, Data.TH.Convert.convert v_aXZX))
                 "user_id" (inputFacebookGraphUserPokesUser_id x)),
            Just
              ((\ k_aXZW v_aXZX -> (k_aXZW, Data.TH.Convert.convert v_aXZX))
                 "access_token" (inputFacebookGraphUserPokesAccess_token x))])
data OutputFacebookGraphUserPokes
  = OutputFacebookGraphUserPokes {outputFacebookGraphUserPokesData :: [OutputFacebookGraphUserPokesData],
                                  outputFacebookGraphUserPokesPaging :: OutputFacebookGraphUserPokesPaging}
  deriving (Data.Data.Data,
            Eq,
            Read,
            Show,
            Data.Typeable.Typeable)
instance Data.Aeson.ToJSON OutputFacebookGraphUserPokes where
  toJSON x
    = Data.Aeson.object
        (Data.Maybe.catMaybes
           [Just
              ((Data.Aeson..=)
                 "data" (outputFacebookGraphUserPokesData x)),
            Just
              ((Data.Aeson..=)
                 "paging" (outputFacebookGraphUserPokesPaging x))])
instance Data.Aeson.FromJSON OutputFacebookGraphUserPokes where
  parseJSON
    (Data.Aeson.Object v)
    = (<*>)
        ((<*>)
           (pure OutputFacebookGraphUserPokes)
           ((Data.Aeson..:) v "data"))
        ((Data.Aeson..:) v "paging")
  parseJSON v
    = fail (show v)
data OutputFacebookGraphUserPokesData
  = OutputFacebookGraphUserPokesData {outputFacebookGraphUserPokesDataTo :: OutputFacebookGraphUserPokesDataTo,
                                      outputFacebookGraphUserPokesDataFrom :: OutputFacebookGraphUserPokesDataFrom,
                                      outputFacebookGraphUserPokesDataCreated_time :: String}
  deriving (Data.Data.Data,
            Eq,
            Read,
            Show,
            Data.Typeable.Typeable)
instance Data.Aeson.ToJSON OutputFacebookGraphUserPokesData where
  toJSON x
    = Data.Aeson.object
        (Data.Maybe.catMaybes
           [Just
              ((Data.Aeson..=)
                 "to" (outputFacebookGraphUserPokesDataTo x)),
            Just
              ((Data.Aeson..=)
                 "from" (outputFacebookGraphUserPokesDataFrom x)),
            Just
              ((Data.Aeson..=)
                 "created_time" (outputFacebookGraphUserPokesDataCreated_time x))])
instance Data.Aeson.FromJSON OutputFacebookGraphUserPokesData where
  parseJSON
    (Data.Aeson.Object v)
    = (<*>)
        ((<*>)
           ((<*>)
              (pure OutputFacebookGraphUserPokesData)
              ((Data.Aeson..:) v "to"))
           ((Data.Aeson..:) v "from"))
        ((Data.Aeson..:) v "created_time")
  parseJSON v
    = fail (show v)
data OutputFacebookGraphUserPokesDataTo
  = OutputFacebookGraphUserPokesDataTo {outputFacebookGraphUserPokesDataToName :: String,
                                        outputFacebookGraphUserPokesDataToId :: String}
  deriving (Data.Data.Data,
            Eq,
            Read,
            Show,
            Data.Typeable.Typeable)
instance Data.Aeson.ToJSON OutputFacebookGraphUserPokesDataTo where
  toJSON x
    = Data.Aeson.object
        (Data.Maybe.catMaybes
           [Just
              ((Data.Aeson..=)
                 "name" (outputFacebookGraphUserPokesDataToName x)),
            Just
              ((Data.Aeson..=)
                 "id" (outputFacebookGraphUserPokesDataToId x))])
instance Data.Aeson.FromJSON OutputFacebookGraphUserPokesDataTo where
  parseJSON
    (Data.Aeson.Object v)
    = (<*>)
        ((<*>)
           (pure OutputFacebookGraphUserPokesDataTo)
           ((Data.Aeson..:) v "name"))
        ((Data.Aeson..:) v "id")
  parseJSON v
    = fail (show v)
data OutputFacebookGraphUserPokesDataFrom
  = OutputFacebookGraphUserPokesDataFrom {outputFacebookGraphUserPokesDataFromName :: String,
                                          outputFacebookGraphUserPokesDataFromId :: String}
  deriving (Data.Data.Data,
            Eq,
            Read,
            Show,
            Data.Typeable.Typeable)
instance Data.Aeson.ToJSON OutputFacebookGraphUserPokesDataFrom where
  toJSON x
    = Data.Aeson.object
        (Data.Maybe.catMaybes
           [Just
              ((Data.Aeson..=)
                 "name" (outputFacebookGraphUserPokesDataFromName x)),
            Just
              ((Data.Aeson..=)
                 "id" (outputFacebookGraphUserPokesDataFromId x))])
instance Data.Aeson.FromJSON OutputFacebookGraphUserPokesDataFrom where
  parseJSON
    (Data.Aeson.Object v)
    = (<*>)
        ((<*>)
           (pure OutputFacebookGraphUserPokesDataFrom)
           ((Data.Aeson..:) v "name"))
        ((Data.Aeson..:) v "id")
  parseJSON v
    = fail (show v)
data OutputFacebookGraphUserPokesPaging
  = OutputFacebookGraphUserPokesPaging {outputFacebookGraphUserPokesPagingNext :: String,
                                        outputFacebookGraphUserPokesPagingPrevious :: String}
  deriving (Data.Data.Data,
            Eq,
            Read,
            Show,
            Data.Typeable.Typeable)
instance Data.Aeson.ToJSON OutputFacebookGraphUserPokesPaging where
  toJSON x
    = Data.Aeson.object
        (Data.Maybe.catMaybes
           [Just
              ((Data.Aeson..=)
                 "next" (outputFacebookGraphUserPokesPagingNext x)),
            Just
              ((Data.Aeson..=)
                 "previous" (outputFacebookGraphUserPokesPagingPrevious x))])
instance Data.Aeson.FromJSON OutputFacebookGraphUserPokesPaging where
  parseJSON
    (Data.Aeson.Object v)
    = (<*>)
        ((<*>)
           (pure OutputFacebookGraphUserPokesPaging)
           ((Data.Aeson..:) v "next"))
        ((Data.Aeson..:) v "previous")
  parseJSON v
    = fail (show v)
data InputFacebookGraphUserPosts
  = InputFacebookGraphUserPosts {inputFacebookGraphUserPostsUser_id :: String,
                                 inputFacebookGraphUserPostsAccess_token :: String}
  deriving (Data.Data.Data,
            Eq,
            Read,
            Show,
            Data.Typeable.Typeable)
instance Data.Aeson.ToJSON InputFacebookGraphUserPosts where
  toJSON x@(InputFacebookGraphUserPosts {})
    = Data.Aeson.object
        (Data.Maybe.catMaybes
           [Just
              ((Data.Aeson..=)
                 "user_id" (inputFacebookGraphUserPostsUser_id x)),
            Just
              ((Data.Aeson..=)
                 "access_token" (inputFacebookGraphUserPostsAccess_token x))])
instance Data.Aeson.FromJSON InputFacebookGraphUserPosts where
  parseJSON
    (Data.Aeson.Object v)
    = (<|>)
        ((<*>)
           ((<*>)
              (pure InputFacebookGraphUserPosts)
              ((Data.Aeson..:) v "user_id"))
           ((Data.Aeson..:) v "access_token"))
        empty
  parseJSON _ = mzero
instance Data.TH.Object.Object InputFacebookGraphUserPosts String Language.JavaScript.Interpret.Primitive where
  toObject x@(InputFacebookGraphUserPosts {})
    = fromList
        (Data.Maybe.catMaybes
           [Just
              ((\ k_aXZY v_aXZZ -> (k_aXZY, Data.TH.Convert.convert v_aXZZ))
                 "user_id" (inputFacebookGraphUserPostsUser_id x)),
            Just
              ((\ k_aXZY v_aXZZ -> (k_aXZY, Data.TH.Convert.convert v_aXZZ))
                 "access_token" (inputFacebookGraphUserPostsAccess_token x))])
data OutputFacebookGraphUserPosts
  = OutputFacebookGraphUserPosts {outputFacebookGraphUserPostsData :: [OutputFacebookGraphUserPostsData],
                                  outputFacebookGraphUserPostsPaging :: OutputFacebookGraphUserPostsPaging}
  deriving (Data.Data.Data,
            Eq,
            Read,
            Show,
            Data.Typeable.Typeable)
instance Data.Aeson.ToJSON OutputFacebookGraphUserPosts where
  toJSON x
    = Data.Aeson.object
        (Data.Maybe.catMaybes
           [Just
              ((Data.Aeson..=)
                 "data" (outputFacebookGraphUserPostsData x)),
            Just
              ((Data.Aeson..=)
                 "paging" (outputFacebookGraphUserPostsPaging x))])
instance Data.Aeson.FromJSON OutputFacebookGraphUserPosts where
  parseJSON
    (Data.Aeson.Object v)
    = (<*>)
        ((<*>)
           (pure OutputFacebookGraphUserPosts)
           ((Data.Aeson..:) v "data"))
        ((Data.Aeson..:) v "paging")
  parseJSON v
    = fail (show v)
data OutputFacebookGraphUserPostsData
  = OutputFacebookGraphUserPostsData {outputFacebookGraphUserPostsDataObject_id :: Maybe String,
                                      outputFacebookGraphUserPostsDataApplication :: OutputFacebookGraphUserPostsDataApplication,
                                      outputFacebookGraphUserPostsDataActions :: [OutputFacebookGraphUserPostsDataActions],
                                      outputFacebookGraphUserPostsDataLink :: Maybe String,
                                      outputFacebookGraphUserPostsDataStatus_type :: String,
                                      outputFacebookGraphUserPostsDataIcon :: Maybe String,
                                      outputFacebookGraphUserPostsDataCaption :: Maybe String,
                                      outputFacebookGraphUserPostsDataPrivacy :: OutputFacebookGraphUserPostsDataPrivacy,
                                      outputFacebookGraphUserPostsDataFrom :: OutputFacebookGraphUserPostsDataFrom,
                                      outputFacebookGraphUserPostsDataPicture :: Maybe String,
                                      outputFacebookGraphUserPostsDataUpdated_time :: String,
                                      outputFacebookGraphUserPostsDataName :: Maybe String,
                                      outputFacebookGraphUserPostsDataIs_hidden :: Maybe Bool,
                                      outputFacebookGraphUserPostsDataCreated_time :: String,
                                      outputFacebookGraphUserPostsDataSource :: Maybe String,
                                      outputFacebookGraphUserPostsDataId :: String,
                                      outputFacebookGraphUserPostsDataType :: String,
                                      outputFacebookGraphUserPostsDataMessage :: String,
                                      outputFacebookGraphUserPostsDataDescription :: Maybe String}
  deriving (Data.Data.Data,
            Eq,
            Read,
            Show,
            Data.Typeable.Typeable)
instance Data.Aeson.ToJSON OutputFacebookGraphUserPostsData where
  toJSON x
    = Data.Aeson.object
        (Data.Maybe.catMaybes
           [fmap
              ((Data.Aeson..=) "object_id")
              (outputFacebookGraphUserPostsDataObject_id x),
            Just
              ((Data.Aeson..=)
                 "application" (outputFacebookGraphUserPostsDataApplication x)),
            Just
              ((Data.Aeson..=)
                 "actions" (outputFacebookGraphUserPostsDataActions x)),
            fmap
              ((Data.Aeson..=) "link")
              (outputFacebookGraphUserPostsDataLink x),
            Just
              ((Data.Aeson..=)
                 "status_type" (outputFacebookGraphUserPostsDataStatus_type x)),
            fmap
              ((Data.Aeson..=) "icon")
              (outputFacebookGraphUserPostsDataIcon x),
            fmap
              ((Data.Aeson..=) "caption")
              (outputFacebookGraphUserPostsDataCaption x),
            Just
              ((Data.Aeson..=)
                 "privacy" (outputFacebookGraphUserPostsDataPrivacy x)),
            Just
              ((Data.Aeson..=)
                 "from" (outputFacebookGraphUserPostsDataFrom x)),
            fmap
              ((Data.Aeson..=) "picture")
              (outputFacebookGraphUserPostsDataPicture x),
            Just
              ((Data.Aeson..=)
                 "updated_time" (outputFacebookGraphUserPostsDataUpdated_time x)),
            fmap
              ((Data.Aeson..=) "name")
              (outputFacebookGraphUserPostsDataName x),
            fmap
              ((Data.Aeson..=) "is_hidden")
              (outputFacebookGraphUserPostsDataIs_hidden x),
            Just
              ((Data.Aeson..=)
                 "created_time" (outputFacebookGraphUserPostsDataCreated_time x)),
            fmap
              ((Data.Aeson..=) "source")
              (outputFacebookGraphUserPostsDataSource x),
            Just
              ((Data.Aeson..=)
                 "id" (outputFacebookGraphUserPostsDataId x)),
            Just
              ((Data.Aeson..=)
                 "type" (outputFacebookGraphUserPostsDataType x)),
            Just
              ((Data.Aeson..=)
                 "message" (outputFacebookGraphUserPostsDataMessage x)),
            fmap
              ((Data.Aeson..=) "description")
              (outputFacebookGraphUserPostsDataDescription x)])
instance Data.Aeson.FromJSON OutputFacebookGraphUserPostsData where
  parseJSON
    (Data.Aeson.Object v)
    = (<*>)
        ((<*>)
           ((<*>)
              ((<*>)
                 ((<*>)
                    ((<*>)
                       ((<*>)
                          ((<*>)
                             ((<*>)
                                ((<*>)
                                   ((<*>)
                                      ((<*>)
                                         ((<*>)
                                            ((<*>)
                                               ((<*>)
                                                  ((<*>)
                                                     ((<*>)
                                                        ((<*>)
                                                           ((<*>)
                                                              (pure
                                                                 OutputFacebookGraphUserPostsData)
                                                              ((Data.Aeson..:?)
                                                                 v "object_id"))
                                                           ((Data.Aeson..:)
                                                              v "application"))
                                                        ((Data.Aeson..:)
                                                           v "actions"))
                                                     ((Data.Aeson..:?) v "link"))
                                                  ((Data.Aeson..:) v "status_type"))
                                               ((Data.Aeson..:?) v "icon"))
                                            ((Data.Aeson..:?) v "caption"))
                                         ((Data.Aeson..:) v "privacy"))
                                      ((Data.Aeson..:) v "from"))
                                   ((Data.Aeson..:?) v "picture"))
                                ((Data.Aeson..:) v "updated_time"))
                             ((Data.Aeson..:?) v "name"))
                          ((Data.Aeson..:?) v "is_hidden"))
                       ((Data.Aeson..:) v "created_time"))
                    ((Data.Aeson..:?) v "source"))
                 ((Data.Aeson..:) v "id"))
              ((Data.Aeson..:) v "type"))
           ((Data.Aeson..:) v "message"))
        ((Data.Aeson..:?) v "description")
  parseJSON v
    = fail (show v)
data OutputFacebookGraphUserPostsDataApplication
  = OutputFacebookGraphUserPostsDataApplication {outputFacebookGraphUserPostsDataApplicationName :: String,
                                                 outputFacebookGraphUserPostsDataApplicationId :: String}
  deriving (Data.Data.Data,
            Eq,
            Read,
            Show,
            Data.Typeable.Typeable)
instance Data.Aeson.ToJSON OutputFacebookGraphUserPostsDataApplication where
  toJSON x
    = Data.Aeson.object
        (Data.Maybe.catMaybes
           [Just
              ((Data.Aeson..=)
                 "name" (outputFacebookGraphUserPostsDataApplicationName x)),
            Just
              ((Data.Aeson..=)
                 "id" (outputFacebookGraphUserPostsDataApplicationId x))])
instance Data.Aeson.FromJSON OutputFacebookGraphUserPostsDataApplication where
  parseJSON
    (Data.Aeson.Object v)
    = (<*>)
        ((<*>)
           (pure OutputFacebookGraphUserPostsDataApplication)
           ((Data.Aeson..:) v "name"))
        ((Data.Aeson..:) v "id")
  parseJSON v
    = fail (show v)
data OutputFacebookGraphUserPostsDataActions
  = OutputFacebookGraphUserPostsDataActions {outputFacebookGraphUserPostsDataActionsLink :: String,
                                             outputFacebookGraphUserPostsDataActionsName :: String}
  deriving (Data.Data.Data,
            Eq,
            Read,
            Show,
            Data.Typeable.Typeable)
instance Data.Aeson.ToJSON OutputFacebookGraphUserPostsDataActions where
  toJSON x
    = Data.Aeson.object
        (Data.Maybe.catMaybes
           [Just
              ((Data.Aeson..=)
                 "link" (outputFacebookGraphUserPostsDataActionsLink x)),
            Just
              ((Data.Aeson..=)
                 "name" (outputFacebookGraphUserPostsDataActionsName x))])
instance Data.Aeson.FromJSON OutputFacebookGraphUserPostsDataActions where
  parseJSON
    (Data.Aeson.Object v)
    = (<*>)
        ((<*>)
           (pure OutputFacebookGraphUserPostsDataActions)
           ((Data.Aeson..:) v "link"))
        ((Data.Aeson..:) v "name")
  parseJSON v
    = fail (show v)
data OutputFacebookGraphUserPostsDataPrivacy
  = OutputFacebookGraphUserPostsDataPrivacy {outputFacebookGraphUserPostsDataPrivacyNetworks :: String,
                                             outputFacebookGraphUserPostsDataPrivacyValue :: String,
                                             outputFacebookGraphUserPostsDataPrivacyAllow :: String,
                                             outputFacebookGraphUserPostsDataPrivacyDeny :: String,
                                             outputFacebookGraphUserPostsDataPrivacyDescription :: String,
                                             outputFacebookGraphUserPostsDataPrivacyFriends :: String}
  deriving (Data.Data.Data,
            Eq,
            Read,
            Show,
            Data.Typeable.Typeable)
instance Data.Aeson.ToJSON OutputFacebookGraphUserPostsDataPrivacy where
  toJSON x
    = Data.Aeson.object
        (Data.Maybe.catMaybes
           [Just
              ((Data.Aeson..=)
                 "networks" (outputFacebookGraphUserPostsDataPrivacyNetworks x)),
            Just
              ((Data.Aeson..=)
                 "value" (outputFacebookGraphUserPostsDataPrivacyValue x)),
            Just
              ((Data.Aeson..=)
                 "allow" (outputFacebookGraphUserPostsDataPrivacyAllow x)),
            Just
              ((Data.Aeson..=)
                 "deny" (outputFacebookGraphUserPostsDataPrivacyDeny x)),
            Just
              ((Data.Aeson..=)
                 "description"
                 (outputFacebookGraphUserPostsDataPrivacyDescription x)),
            Just
              ((Data.Aeson..=)
                 "friends" (outputFacebookGraphUserPostsDataPrivacyFriends x))])
instance Data.Aeson.FromJSON OutputFacebookGraphUserPostsDataPrivacy where
  parseJSON
    (Data.Aeson.Object v)
    = (<*>)
        ((<*>)
           ((<*>)
              ((<*>)
                 ((<*>)
                    ((<*>)
                       (pure OutputFacebookGraphUserPostsDataPrivacy)
                       ((Data.Aeson..:) v "networks"))
                    ((Data.Aeson..:) v "value"))
                 ((Data.Aeson..:) v "allow"))
              ((Data.Aeson..:) v "deny"))
           ((Data.Aeson..:) v "description"))
        ((Data.Aeson..:) v "friends")
  parseJSON v
    = fail (show v)
data OutputFacebookGraphUserPostsDataFrom
  = OutputFacebookGraphUserPostsDataFrom {outputFacebookGraphUserPostsDataFromName :: String,
                                          outputFacebookGraphUserPostsDataFromId :: String}
  deriving (Data.Data.Data,
            Eq,
            Read,
            Show,
            Data.Typeable.Typeable)
instance Data.Aeson.ToJSON OutputFacebookGraphUserPostsDataFrom where
  toJSON x
    = Data.Aeson.object
        (Data.Maybe.catMaybes
           [Just
              ((Data.Aeson..=)
                 "name" (outputFacebookGraphUserPostsDataFromName x)),
            Just
              ((Data.Aeson..=)
                 "id" (outputFacebookGraphUserPostsDataFromId x))])
instance Data.Aeson.FromJSON OutputFacebookGraphUserPostsDataFrom where
  parseJSON
    (Data.Aeson.Object v)
    = (<*>)
        ((<*>)
           (pure OutputFacebookGraphUserPostsDataFrom)
           ((Data.Aeson..:) v "name"))
        ((Data.Aeson..:) v "id")
  parseJSON v
    = fail (show v)
data OutputFacebookGraphUserPostsPaging
  = OutputFacebookGraphUserPostsPaging {outputFacebookGraphUserPostsPagingNext :: String,
                                        outputFacebookGraphUserPostsPagingPrevious :: String}
  deriving (Data.Data.Data,
            Eq,
            Read,
            Show,
            Data.Typeable.Typeable)
instance Data.Aeson.ToJSON OutputFacebookGraphUserPostsPaging where
  toJSON x
    = Data.Aeson.object
        (Data.Maybe.catMaybes
           [Just
              ((Data.Aeson..=)
                 "next" (outputFacebookGraphUserPostsPagingNext x)),
            Just
              ((Data.Aeson..=)
                 "previous" (outputFacebookGraphUserPostsPagingPrevious x))])
instance Data.Aeson.FromJSON OutputFacebookGraphUserPostsPaging where
  parseJSON
    (Data.Aeson.Object v)
    = (<*>)
        ((<*>)
           (pure OutputFacebookGraphUserPostsPaging)
           ((Data.Aeson..:) v "next"))
        ((Data.Aeson..:) v "previous")
  parseJSON v
    = fail (show v)
data InputFacebookGraphUserStatuses
  = InputFacebookGraphUserStatuses {inputFacebookGraphUserStatusesUser_id :: String,
                                    inputFacebookGraphUserStatusesAccess_token :: String}
  deriving (Data.Data.Data,
            Eq,
            Read,
            Show,
            Data.Typeable.Typeable)
instance Data.Aeson.ToJSON InputFacebookGraphUserStatuses where
  toJSON x@(InputFacebookGraphUserStatuses {})
    = Data.Aeson.object
        (Data.Maybe.catMaybes
           [Just
              ((Data.Aeson..=)
                 "user_id" (inputFacebookGraphUserStatusesUser_id x)),
            Just
              ((Data.Aeson..=)
                 "access_token" (inputFacebookGraphUserStatusesAccess_token x))])
instance Data.Aeson.FromJSON InputFacebookGraphUserStatuses where
  parseJSON
    (Data.Aeson.Object v)
    = (<|>)
        ((<*>)
           ((<*>)
              (pure InputFacebookGraphUserStatuses)
              ((Data.Aeson..:) v "user_id"))
           ((Data.Aeson..:) v "access_token"))
        empty
  parseJSON _ = mzero
instance Data.TH.Object.Object InputFacebookGraphUserStatuses String Language.JavaScript.Interpret.Primitive where
  toObject x@(InputFacebookGraphUserStatuses {})
    = fromList
        (Data.Maybe.catMaybes
           [Just
              ((\ k_aY00 v_aY01 -> (k_aY00, Data.TH.Convert.convert v_aY01))
                 "user_id" (inputFacebookGraphUserStatusesUser_id x)),
            Just
              ((\ k_aY00 v_aY01 -> (k_aY00, Data.TH.Convert.convert v_aY01))
                 "access_token" (inputFacebookGraphUserStatusesAccess_token x))])
data OutputFacebookGraphUserStatuses
  = OutputFacebookGraphUserStatuses {outputFacebookGraphUserStatusesData :: [OutputFacebookGraphUserStatusesData],
                                     outputFacebookGraphUserStatusesPaging :: OutputFacebookGraphUserStatusesPaging}
  deriving (Data.Data.Data,
            Eq,
            Read,
            Show,
            Data.Typeable.Typeable)
instance Data.Aeson.ToJSON OutputFacebookGraphUserStatuses where
  toJSON x
    = Data.Aeson.object
        (Data.Maybe.catMaybes
           [Just
              ((Data.Aeson..=)
                 "data" (outputFacebookGraphUserStatusesData x)),
            Just
              ((Data.Aeson..=)
                 "paging" (outputFacebookGraphUserStatusesPaging x))])
instance Data.Aeson.FromJSON OutputFacebookGraphUserStatuses where
  parseJSON
    (Data.Aeson.Object v)
    = (<*>)
        ((<*>)
           (pure OutputFacebookGraphUserStatuses)
           ((Data.Aeson..:) v "data"))
        ((Data.Aeson..:) v "paging")
  parseJSON v
    = fail (show v)
data OutputFacebookGraphUserStatusesData
  = OutputFacebookGraphUserStatusesData {outputFacebookGraphUserStatusesDataObject_id :: Maybe String,
                                         outputFacebookGraphUserStatusesDataApplication :: OutputFacebookGraphUserStatusesDataApplication,
                                         outputFacebookGraphUserStatusesDataActions :: [OutputFacebookGraphUserStatusesDataActions],
                                         outputFacebookGraphUserStatusesDataLink :: Maybe String,
                                         outputFacebookGraphUserStatusesDataStatus_type :: String,
                                         outputFacebookGraphUserStatusesDataIcon :: Maybe String,
                                         outputFacebookGraphUserStatusesDataCaption :: Maybe String,
                                         outputFacebookGraphUserStatusesDataPrivacy :: OutputFacebookGraphUserStatusesDataPrivacy,
                                         outputFacebookGraphUserStatusesDataFrom :: OutputFacebookGraphUserStatusesDataFrom,
                                         outputFacebookGraphUserStatusesDataPicture :: Maybe String,
                                         outputFacebookGraphUserStatusesDataUpdated_time :: String,
                                         outputFacebookGraphUserStatusesDataName :: Maybe String,
                                         outputFacebookGraphUserStatusesDataIs_hidden :: Maybe Bool,
                                         outputFacebookGraphUserStatusesDataCreated_time :: String,
                                         outputFacebookGraphUserStatusesDataSource :: Maybe String,
                                         outputFacebookGraphUserStatusesDataId :: String,
                                         outputFacebookGraphUserStatusesDataType :: String,
                                         outputFacebookGraphUserStatusesDataMessage :: String,
                                         outputFacebookGraphUserStatusesDataDescription :: Maybe String}
  deriving (Data.Data.Data,
            Eq,
            Read,
            Show,
            Data.Typeable.Typeable)
instance Data.Aeson.ToJSON OutputFacebookGraphUserStatusesData where
  toJSON x
    = Data.Aeson.object
        (Data.Maybe.catMaybes
           [fmap
              ((Data.Aeson..=) "object_id")
              (outputFacebookGraphUserStatusesDataObject_id x),
            Just
              ((Data.Aeson..=)
                 "application" (outputFacebookGraphUserStatusesDataApplication x)),
            Just
              ((Data.Aeson..=)
                 "actions" (outputFacebookGraphUserStatusesDataActions x)),
            fmap
              ((Data.Aeson..=) "link")
              (outputFacebookGraphUserStatusesDataLink x),
            Just
              ((Data.Aeson..=)
                 "status_type" (outputFacebookGraphUserStatusesDataStatus_type x)),
            fmap
              ((Data.Aeson..=) "icon")
              (outputFacebookGraphUserStatusesDataIcon x),
            fmap
              ((Data.Aeson..=) "caption")
              (outputFacebookGraphUserStatusesDataCaption x),
            Just
              ((Data.Aeson..=)
                 "privacy" (outputFacebookGraphUserStatusesDataPrivacy x)),
            Just
              ((Data.Aeson..=)
                 "from" (outputFacebookGraphUserStatusesDataFrom x)),
            fmap
              ((Data.Aeson..=) "picture")
              (outputFacebookGraphUserStatusesDataPicture x),
            Just
              ((Data.Aeson..=)
                 "updated_time"
                 (outputFacebookGraphUserStatusesDataUpdated_time x)),
            fmap
              ((Data.Aeson..=) "name")
              (outputFacebookGraphUserStatusesDataName x),
            fmap
              ((Data.Aeson..=) "is_hidden")
              (outputFacebookGraphUserStatusesDataIs_hidden x),
            Just
              ((Data.Aeson..=)
                 "created_time"
                 (outputFacebookGraphUserStatusesDataCreated_time x)),
            fmap
              ((Data.Aeson..=) "source")
              (outputFacebookGraphUserStatusesDataSource x),
            Just
              ((Data.Aeson..=)
                 "id" (outputFacebookGraphUserStatusesDataId x)),
            Just
              ((Data.Aeson..=)
                 "type" (outputFacebookGraphUserStatusesDataType x)),
            Just
              ((Data.Aeson..=)
                 "message" (outputFacebookGraphUserStatusesDataMessage x)),
            fmap
              ((Data.Aeson..=) "description")
              (outputFacebookGraphUserStatusesDataDescription x)])
instance Data.Aeson.FromJSON OutputFacebookGraphUserStatusesData where
  parseJSON
    (Data.Aeson.Object v)
    = (<*>)
        ((<*>)
           ((<*>)
              ((<*>)
                 ((<*>)
                    ((<*>)
                       ((<*>)
                          ((<*>)
                             ((<*>)
                                ((<*>)
                                   ((<*>)
                                      ((<*>)
                                         ((<*>)
                                            ((<*>)
                                               ((<*>)
                                                  ((<*>)
                                                     ((<*>)
                                                        ((<*>)
                                                           ((<*>)
                                                              (pure
                                                                 OutputFacebookGraphUserStatusesData)
                                                              ((Data.Aeson..:?)
                                                                 v "object_id"))
                                                           ((Data.Aeson..:)
                                                              v "application"))
                                                        ((Data.Aeson..:)
                                                           v "actions"))
                                                     ((Data.Aeson..:?) v "link"))
                                                  ((Data.Aeson..:) v "status_type"))
                                               ((Data.Aeson..:?) v "icon"))
                                            ((Data.Aeson..:?) v "caption"))
                                         ((Data.Aeson..:) v "privacy"))
                                      ((Data.Aeson..:) v "from"))
                                   ((Data.Aeson..:?) v "picture"))
                                ((Data.Aeson..:) v "updated_time"))
                             ((Data.Aeson..:?) v "name"))
                          ((Data.Aeson..:?) v "is_hidden"))
                       ((Data.Aeson..:) v "created_time"))
                    ((Data.Aeson..:?) v "source"))
                 ((Data.Aeson..:) v "id"))
              ((Data.Aeson..:) v "type"))
           ((Data.Aeson..:) v "message"))
        ((Data.Aeson..:?) v "description")
  parseJSON v
    = fail (show v)
data OutputFacebookGraphUserStatusesDataApplication
  = OutputFacebookGraphUserStatusesDataApplication {outputFacebookGraphUserStatusesDataApplicationName :: String,
                                                    outputFacebookGraphUserStatusesDataApplicationId :: String}
  deriving (Data.Data.Data,
            Eq,
            Read,
            Show,
            Data.Typeable.Typeable)
instance Data.Aeson.ToJSON OutputFacebookGraphUserStatusesDataApplication where
  toJSON x
    = Data.Aeson.object
        (Data.Maybe.catMaybes
           [Just
              ((Data.Aeson..=)
                 "name" (outputFacebookGraphUserStatusesDataApplicationName x)),
            Just
              ((Data.Aeson..=)
                 "id" (outputFacebookGraphUserStatusesDataApplicationId x))])
instance Data.Aeson.FromJSON OutputFacebookGraphUserStatusesDataApplication where
  parseJSON
    (Data.Aeson.Object v)
    = (<*>)
        ((<*>)
           (pure OutputFacebookGraphUserStatusesDataApplication)
           ((Data.Aeson..:) v "name"))
        ((Data.Aeson..:) v "id")
  parseJSON v
    = fail (show v)
data OutputFacebookGraphUserStatusesDataActions
  = OutputFacebookGraphUserStatusesDataActions {outputFacebookGraphUserStatusesDataActionsLink :: String,
                                                outputFacebookGraphUserStatusesDataActionsName :: String}
  deriving (Data.Data.Data,
            Eq,
            Read,
            Show,
            Data.Typeable.Typeable)
instance Data.Aeson.ToJSON OutputFacebookGraphUserStatusesDataActions where
  toJSON x
    = Data.Aeson.object
        (Data.Maybe.catMaybes
           [Just
              ((Data.Aeson..=)
                 "link" (outputFacebookGraphUserStatusesDataActionsLink x)),
            Just
              ((Data.Aeson..=)
                 "name" (outputFacebookGraphUserStatusesDataActionsName x))])
instance Data.Aeson.FromJSON OutputFacebookGraphUserStatusesDataActions where
  parseJSON
    (Data.Aeson.Object v)
    = (<*>)
        ((<*>)
           (pure OutputFacebookGraphUserStatusesDataActions)
           ((Data.Aeson..:) v "link"))
        ((Data.Aeson..:) v "name")
  parseJSON v
    = fail (show v)
data OutputFacebookGraphUserStatusesDataPrivacy
  = OutputFacebookGraphUserStatusesDataPrivacy {outputFacebookGraphUserStatusesDataPrivacyNetworks :: String,
                                                outputFacebookGraphUserStatusesDataPrivacyValue :: String,
                                                outputFacebookGraphUserStatusesDataPrivacyAllow :: String,
                                                outputFacebookGraphUserStatusesDataPrivacyDeny :: String,
                                                outputFacebookGraphUserStatusesDataPrivacyDescription :: String,
                                                outputFacebookGraphUserStatusesDataPrivacyFriends :: String}
  deriving (Data.Data.Data,
            Eq,
            Read,
            Show,
            Data.Typeable.Typeable)
instance Data.Aeson.ToJSON OutputFacebookGraphUserStatusesDataPrivacy where
  toJSON x
    = Data.Aeson.object
        (Data.Maybe.catMaybes
           [Just
              ((Data.Aeson..=)
                 "networks" (outputFacebookGraphUserStatusesDataPrivacyNetworks x)),
            Just
              ((Data.Aeson..=)
                 "value" (outputFacebookGraphUserStatusesDataPrivacyValue x)),
            Just
              ((Data.Aeson..=)
                 "allow" (outputFacebookGraphUserStatusesDataPrivacyAllow x)),
            Just
              ((Data.Aeson..=)
                 "deny" (outputFacebookGraphUserStatusesDataPrivacyDeny x)),
            Just
              ((Data.Aeson..=)
                 "description"
                 (outputFacebookGraphUserStatusesDataPrivacyDescription x)),
            Just
              ((Data.Aeson..=)
                 "friends" (outputFacebookGraphUserStatusesDataPrivacyFriends x))])
instance Data.Aeson.FromJSON OutputFacebookGraphUserStatusesDataPrivacy where
  parseJSON
    (Data.Aeson.Object v)
    = (<*>)
        ((<*>)
           ((<*>)
              ((<*>)
                 ((<*>)
                    ((<*>)
                       (pure OutputFacebookGraphUserStatusesDataPrivacy)
                       ((Data.Aeson..:) v "networks"))
                    ((Data.Aeson..:) v "value"))
                 ((Data.Aeson..:) v "allow"))
              ((Data.Aeson..:) v "deny"))
           ((Data.Aeson..:) v "description"))
        ((Data.Aeson..:) v "friends")
  parseJSON v
    = fail (show v)
data OutputFacebookGraphUserStatusesDataFrom
  = OutputFacebookGraphUserStatusesDataFrom {outputFacebookGraphUserStatusesDataFromName :: String,
                                             outputFacebookGraphUserStatusesDataFromId :: String}
  deriving (Data.Data.Data,
            Eq,
            Read,
            Show,
            Data.Typeable.Typeable)
instance Data.Aeson.ToJSON OutputFacebookGraphUserStatusesDataFrom where
  toJSON x
    = Data.Aeson.object
        (Data.Maybe.catMaybes
           [Just
              ((Data.Aeson..=)
                 "name" (outputFacebookGraphUserStatusesDataFromName x)),
            Just
              ((Data.Aeson..=)
                 "id" (outputFacebookGraphUserStatusesDataFromId x))])
instance Data.Aeson.FromJSON OutputFacebookGraphUserStatusesDataFrom where
  parseJSON
    (Data.Aeson.Object v)
    = (<*>)
        ((<*>)
           (pure OutputFacebookGraphUserStatusesDataFrom)
           ((Data.Aeson..:) v "name"))
        ((Data.Aeson..:) v "id")
  parseJSON v
    = fail (show v)
data OutputFacebookGraphUserStatusesPaging
  = OutputFacebookGraphUserStatusesPaging {outputFacebookGraphUserStatusesPagingNext :: String,
                                           outputFacebookGraphUserStatusesPagingPrevious :: String}
  deriving (Data.Data.Data,
            Eq,
            Read,
            Show,
            Data.Typeable.Typeable)
instance Data.Aeson.ToJSON OutputFacebookGraphUserStatusesPaging where
  toJSON x
    = Data.Aeson.object
        (Data.Maybe.catMaybes
           [Just
              ((Data.Aeson..=)
                 "next" (outputFacebookGraphUserStatusesPagingNext x)),
            Just
              ((Data.Aeson..=)
                 "previous" (outputFacebookGraphUserStatusesPagingPrevious x))])
instance Data.Aeson.FromJSON OutputFacebookGraphUserStatusesPaging where
  parseJSON
    (Data.Aeson.Object v)
    = (<*>)
        ((<*>)
           (pure OutputFacebookGraphUserStatusesPaging)
           ((Data.Aeson..:) v "next"))
        ((Data.Aeson..:) v "previous")
  parseJSON v
    = fail (show v)
data InputFacebookGraphUserTagged
  = InputFacebookGraphUserTagged {inputFacebookGraphUserTaggedUser_id :: String,
                                  inputFacebookGraphUserTaggedAccess_token :: String}
  deriving (Data.Data.Data,
            Eq,
            Read,
            Show,
            Data.Typeable.Typeable)
instance Data.Aeson.ToJSON InputFacebookGraphUserTagged where
  toJSON x@(InputFacebookGraphUserTagged {})
    = Data.Aeson.object
        (Data.Maybe.catMaybes
           [Just
              ((Data.Aeson..=)
                 "user_id" (inputFacebookGraphUserTaggedUser_id x)),
            Just
              ((Data.Aeson..=)
                 "access_token" (inputFacebookGraphUserTaggedAccess_token x))])
instance Data.Aeson.FromJSON InputFacebookGraphUserTagged where
  parseJSON
    (Data.Aeson.Object v)
    = (<|>)
        ((<*>)
           ((<*>)
              (pure InputFacebookGraphUserTagged)
              ((Data.Aeson..:) v "user_id"))
           ((Data.Aeson..:) v "access_token"))
        empty
  parseJSON _ = mzero
instance Data.TH.Object.Object InputFacebookGraphUserTagged String Language.JavaScript.Interpret.Primitive where
  toObject x@(InputFacebookGraphUserTagged {})
    = fromList
        (Data.Maybe.catMaybes
           [Just
              ((\ k_aY02 v_aY03 -> (k_aY02, Data.TH.Convert.convert v_aY03))
                 "user_id" (inputFacebookGraphUserTaggedUser_id x)),
            Just
              ((\ k_aY02 v_aY03 -> (k_aY02, Data.TH.Convert.convert v_aY03))
                 "access_token" (inputFacebookGraphUserTaggedAccess_token x))])
data OutputFacebookGraphUserTagged
  = OutputFacebookGraphUserTagged {outputFacebookGraphUserTaggedData :: [OutputFacebookGraphUserTaggedData],
                                   outputFacebookGraphUserTaggedPaging :: OutputFacebookGraphUserTaggedPaging}
  deriving (Data.Data.Data,
            Eq,
            Read,
            Show,
            Data.Typeable.Typeable)
instance Data.Aeson.ToJSON OutputFacebookGraphUserTagged where
  toJSON x
    = Data.Aeson.object
        (Data.Maybe.catMaybes
           [Just
              ((Data.Aeson..=)
                 "data" (outputFacebookGraphUserTaggedData x)),
            Just
              ((Data.Aeson..=)
                 "paging" (outputFacebookGraphUserTaggedPaging x))])
instance Data.Aeson.FromJSON OutputFacebookGraphUserTagged where
  parseJSON
    (Data.Aeson.Object v)
    = (<*>)
        ((<*>)
           (pure OutputFacebookGraphUserTagged)
           ((Data.Aeson..:) v "data"))
        ((Data.Aeson..:) v "paging")
  parseJSON v
    = fail (show v)
data OutputFacebookGraphUserTaggedData
  = OutputFacebookGraphUserTaggedData {outputFacebookGraphUserTaggedDataObject_id :: Maybe String,
                                       outputFacebookGraphUserTaggedDataApplication :: OutputFacebookGraphUserTaggedDataApplication,
                                       outputFacebookGraphUserTaggedDataActions :: [OutputFacebookGraphUserTaggedDataActions],
                                       outputFacebookGraphUserTaggedDataLink :: Maybe String,
                                       outputFacebookGraphUserTaggedDataStatus_type :: String,
                                       outputFacebookGraphUserTaggedDataIcon :: Maybe String,
                                       outputFacebookGraphUserTaggedDataCaption :: Maybe String,
                                       outputFacebookGraphUserTaggedDataPrivacy :: OutputFacebookGraphUserTaggedDataPrivacy,
                                       outputFacebookGraphUserTaggedDataFrom :: OutputFacebookGraphUserTaggedDataFrom,
                                       outputFacebookGraphUserTaggedDataPicture :: Maybe String,
                                       outputFacebookGraphUserTaggedDataUpdated_time :: String,
                                       outputFacebookGraphUserTaggedDataName :: Maybe String,
                                       outputFacebookGraphUserTaggedDataIs_hidden :: Maybe Bool,
                                       outputFacebookGraphUserTaggedDataCreated_time :: String,
                                       outputFacebookGraphUserTaggedDataSource :: Maybe String,
                                       outputFacebookGraphUserTaggedDataId :: String,
                                       outputFacebookGraphUserTaggedDataType :: String,
                                       outputFacebookGraphUserTaggedDataMessage :: String,
                                       outputFacebookGraphUserTaggedDataDescription :: Maybe String}
  deriving (Data.Data.Data,
            Eq,
            Read,
            Show,
            Data.Typeable.Typeable)
instance Data.Aeson.ToJSON OutputFacebookGraphUserTaggedData where
  toJSON x
    = Data.Aeson.object
        (Data.Maybe.catMaybes
           [fmap
              ((Data.Aeson..=) "object_id")
              (outputFacebookGraphUserTaggedDataObject_id x),
            Just
              ((Data.Aeson..=)
                 "application" (outputFacebookGraphUserTaggedDataApplication x)),
            Just
              ((Data.Aeson..=)
                 "actions" (outputFacebookGraphUserTaggedDataActions x)),
            fmap
              ((Data.Aeson..=) "link")
              (outputFacebookGraphUserTaggedDataLink x),
            Just
              ((Data.Aeson..=)
                 "status_type" (outputFacebookGraphUserTaggedDataStatus_type x)),
            fmap
              ((Data.Aeson..=) "icon")
              (outputFacebookGraphUserTaggedDataIcon x),
            fmap
              ((Data.Aeson..=) "caption")
              (outputFacebookGraphUserTaggedDataCaption x),
            Just
              ((Data.Aeson..=)
                 "privacy" (outputFacebookGraphUserTaggedDataPrivacy x)),
            Just
              ((Data.Aeson..=)
                 "from" (outputFacebookGraphUserTaggedDataFrom x)),
            fmap
              ((Data.Aeson..=) "picture")
              (outputFacebookGraphUserTaggedDataPicture x),
            Just
              ((Data.Aeson..=)
                 "updated_time" (outputFacebookGraphUserTaggedDataUpdated_time x)),
            fmap
              ((Data.Aeson..=) "name")
              (outputFacebookGraphUserTaggedDataName x),
            fmap
              ((Data.Aeson..=) "is_hidden")
              (outputFacebookGraphUserTaggedDataIs_hidden x),
            Just
              ((Data.Aeson..=)
                 "created_time" (outputFacebookGraphUserTaggedDataCreated_time x)),
            fmap
              ((Data.Aeson..=) "source")
              (outputFacebookGraphUserTaggedDataSource x),
            Just
              ((Data.Aeson..=)
                 "id" (outputFacebookGraphUserTaggedDataId x)),
            Just
              ((Data.Aeson..=)
                 "type" (outputFacebookGraphUserTaggedDataType x)),
            Just
              ((Data.Aeson..=)
                 "message" (outputFacebookGraphUserTaggedDataMessage x)),
            fmap
              ((Data.Aeson..=) "description")
              (outputFacebookGraphUserTaggedDataDescription x)])
instance Data.Aeson.FromJSON OutputFacebookGraphUserTaggedData where
  parseJSON
    (Data.Aeson.Object v)
    = (<*>)
        ((<*>)
           ((<*>)
              ((<*>)
                 ((<*>)
                    ((<*>)
                       ((<*>)
                          ((<*>)
                             ((<*>)
                                ((<*>)
                                   ((<*>)
                                      ((<*>)
                                         ((<*>)
                                            ((<*>)
                                               ((<*>)
                                                  ((<*>)
                                                     ((<*>)
                                                        ((<*>)
                                                           ((<*>)
                                                              (pure
                                                                 OutputFacebookGraphUserTaggedData)
                                                              ((Data.Aeson..:?)
                                                                 v "object_id"))
                                                           ((Data.Aeson..:)
                                                              v "application"))
                                                        ((Data.Aeson..:)
                                                           v "actions"))
                                                     ((Data.Aeson..:?) v "link"))
                                                  ((Data.Aeson..:) v "status_type"))
                                               ((Data.Aeson..:?) v "icon"))
                                            ((Data.Aeson..:?) v "caption"))
                                         ((Data.Aeson..:) v "privacy"))
                                      ((Data.Aeson..:) v "from"))
                                   ((Data.Aeson..:?) v "picture"))
                                ((Data.Aeson..:) v "updated_time"))
                             ((Data.Aeson..:?) v "name"))
                          ((Data.Aeson..:?) v "is_hidden"))
                       ((Data.Aeson..:) v "created_time"))
                    ((Data.Aeson..:?) v "source"))
                 ((Data.Aeson..:) v "id"))
              ((Data.Aeson..:) v "type"))
           ((Data.Aeson..:) v "message"))
        ((Data.Aeson..:?) v "description")
  parseJSON v
    = fail (show v)
data OutputFacebookGraphUserTaggedDataApplication
  = OutputFacebookGraphUserTaggedDataApplication {outputFacebookGraphUserTaggedDataApplicationName :: String,
                                                  outputFacebookGraphUserTaggedDataApplicationId :: String}
  deriving (Data.Data.Data,
            Eq,
            Read,
            Show,
            Data.Typeable.Typeable)
instance Data.Aeson.ToJSON OutputFacebookGraphUserTaggedDataApplication where
  toJSON x
    = Data.Aeson.object
        (Data.Maybe.catMaybes
           [Just
              ((Data.Aeson..=)
                 "name" (outputFacebookGraphUserTaggedDataApplicationName x)),
            Just
              ((Data.Aeson..=)
                 "id" (outputFacebookGraphUserTaggedDataApplicationId x))])
instance Data.Aeson.FromJSON OutputFacebookGraphUserTaggedDataApplication where
  parseJSON
    (Data.Aeson.Object v)
    = (<*>)
        ((<*>)
           (pure OutputFacebookGraphUserTaggedDataApplication)
           ((Data.Aeson..:) v "name"))
        ((Data.Aeson..:) v "id")
  parseJSON v
    = fail (show v)
data OutputFacebookGraphUserTaggedDataActions
  = OutputFacebookGraphUserTaggedDataActions {outputFacebookGraphUserTaggedDataActionsLink :: String,
                                              outputFacebookGraphUserTaggedDataActionsName :: String}
  deriving (Data.Data.Data,
            Eq,
            Read,
            Show,
            Data.Typeable.Typeable)
instance Data.Aeson.ToJSON OutputFacebookGraphUserTaggedDataActions where
  toJSON x
    = Data.Aeson.object
        (Data.Maybe.catMaybes
           [Just
              ((Data.Aeson..=)
                 "link" (outputFacebookGraphUserTaggedDataActionsLink x)),
            Just
              ((Data.Aeson..=)
                 "name" (outputFacebookGraphUserTaggedDataActionsName x))])
instance Data.Aeson.FromJSON OutputFacebookGraphUserTaggedDataActions where
  parseJSON
    (Data.Aeson.Object v)
    = (<*>)
        ((<*>)
           (pure OutputFacebookGraphUserTaggedDataActions)
           ((Data.Aeson..:) v "link"))
        ((Data.Aeson..:) v "name")
  parseJSON v
    = fail (show v)
data OutputFacebookGraphUserTaggedDataPrivacy
  = OutputFacebookGraphUserTaggedDataPrivacy {outputFacebookGraphUserTaggedDataPrivacyNetworks :: String,
                                              outputFacebookGraphUserTaggedDataPrivacyValue :: String,
                                              outputFacebookGraphUserTaggedDataPrivacyAllow :: String,
                                              outputFacebookGraphUserTaggedDataPrivacyDeny :: String,
                                              outputFacebookGraphUserTaggedDataPrivacyDescription :: String,
                                              outputFacebookGraphUserTaggedDataPrivacyFriends :: String}
  deriving (Data.Data.Data,
            Eq,
            Read,
            Show,
            Data.Typeable.Typeable)
instance Data.Aeson.ToJSON OutputFacebookGraphUserTaggedDataPrivacy where
  toJSON x
    = Data.Aeson.object
        (Data.Maybe.catMaybes
           [Just
              ((Data.Aeson..=)
                 "networks" (outputFacebookGraphUserTaggedDataPrivacyNetworks x)),
            Just
              ((Data.Aeson..=)
                 "value" (outputFacebookGraphUserTaggedDataPrivacyValue x)),
            Just
              ((Data.Aeson..=)
                 "allow" (outputFacebookGraphUserTaggedDataPrivacyAllow x)),
            Just
              ((Data.Aeson..=)
                 "deny" (outputFacebookGraphUserTaggedDataPrivacyDeny x)),
            Just
              ((Data.Aeson..=)
                 "description"
                 (outputFacebookGraphUserTaggedDataPrivacyDescription x)),
            Just
              ((Data.Aeson..=)
                 "friends" (outputFacebookGraphUserTaggedDataPrivacyFriends x))])
instance Data.Aeson.FromJSON OutputFacebookGraphUserTaggedDataPrivacy where
  parseJSON
    (Data.Aeson.Object v)
    = (<*>)
        ((<*>)
           ((<*>)
              ((<*>)
                 ((<*>)
                    ((<*>)
                       (pure OutputFacebookGraphUserTaggedDataPrivacy)
                       ((Data.Aeson..:) v "networks"))
                    ((Data.Aeson..:) v "value"))
                 ((Data.Aeson..:) v "allow"))
              ((Data.Aeson..:) v "deny"))
           ((Data.Aeson..:) v "description"))
        ((Data.Aeson..:) v "friends")
  parseJSON v
    = fail (show v)
data OutputFacebookGraphUserTaggedDataFrom
  = OutputFacebookGraphUserTaggedDataFrom {outputFacebookGraphUserTaggedDataFromName :: String,
                                           outputFacebookGraphUserTaggedDataFromId :: String}
  deriving (Data.Data.Data,
            Eq,
            Read,
            Show,
            Data.Typeable.Typeable)
instance Data.Aeson.ToJSON OutputFacebookGraphUserTaggedDataFrom where
  toJSON x
    = Data.Aeson.object
        (Data.Maybe.catMaybes
           [Just
              ((Data.Aeson..=)
                 "name" (outputFacebookGraphUserTaggedDataFromName x)),
            Just
              ((Data.Aeson..=)
                 "id" (outputFacebookGraphUserTaggedDataFromId x))])
instance Data.Aeson.FromJSON OutputFacebookGraphUserTaggedDataFrom where
  parseJSON
    (Data.Aeson.Object v)
    = (<*>)
        ((<*>)
           (pure OutputFacebookGraphUserTaggedDataFrom)
           ((Data.Aeson..:) v "name"))
        ((Data.Aeson..:) v "id")
  parseJSON v
    = fail (show v)
data OutputFacebookGraphUserTaggedPaging
  = OutputFacebookGraphUserTaggedPaging {outputFacebookGraphUserTaggedPagingNext :: String,
                                         outputFacebookGraphUserTaggedPagingPrevious :: String}
  deriving (Data.Data.Data,
            Eq,
            Read,
            Show,
            Data.Typeable.Typeable)
instance Data.Aeson.ToJSON OutputFacebookGraphUserTaggedPaging where
  toJSON x
    = Data.Aeson.object
        (Data.Maybe.catMaybes
           [Just
              ((Data.Aeson..=)
                 "next" (outputFacebookGraphUserTaggedPagingNext x)),
            Just
              ((Data.Aeson..=)
                 "previous" (outputFacebookGraphUserTaggedPagingPrevious x))])
instance Data.Aeson.FromJSON OutputFacebookGraphUserTaggedPaging where
  parseJSON
    (Data.Aeson.Object v)
    = (<*>)
        ((<*>)
           (pure OutputFacebookGraphUserTaggedPaging)
           ((Data.Aeson..:) v "next"))
        ((Data.Aeson..:) v "previous")
  parseJSON v
    = fail (show v)
data InputKrisinformationFeed
  = InputKrisinformationFeed {}
  deriving (Data.Data.Data,
            Eq,
            Read,
            Show,
            Data.Typeable.Typeable)
instance Data.Aeson.ToJSON InputKrisinformationFeed where
  toJSON x@(InputKrisinformationFeed {})
    = Data.Aeson.object (Data.Maybe.catMaybes [])
instance Data.Aeson.FromJSON InputKrisinformationFeed where
  parseJSON
    (Data.Aeson.Object v)
    = (<|>)
        (pure InputKrisinformationFeed) empty
  parseJSON _ = mzero
instance Data.TH.Object.Object InputKrisinformationFeed String Language.JavaScript.Interpret.Primitive where
  toObject x@(InputKrisinformationFeed {})
    = fromList (Data.Maybe.catMaybes [])
data OutputKrisinformationFeed
  = OutputKrisinformationFeed {outputKrisinformationFeedEntries :: [OutputKrisinformationFeedEntries]}
  deriving (Data.Data.Data,
            Eq,
            Read,
            Show,
            Data.Typeable.Typeable)
instance Data.Aeson.ToJSON OutputKrisinformationFeed where
  toJSON x
    = Data.Aeson.object
        (Data.Maybe.catMaybes
           [Just
              ((Data.Aeson..=)
                 "Entries" (outputKrisinformationFeedEntries x))])
instance Data.Aeson.FromJSON OutputKrisinformationFeed where
  parseJSON
    (Data.Aeson.Object v)
    = (<*>)
        (pure OutputKrisinformationFeed)
        ((Data.Aeson..:) v "Entries")
  parseJSON v
    = fail (show v)
data OutputKrisinformationFeedEntries
  = OutputKrisinformationFeedEntries {outputKrisinformationFeedEntriesSummary :: String,
                                      outputKrisinformationFeedEntriesCapArea :: [OutputKrisinformationFeedEntriesCapArea],
                                      outputKrisinformationFeedEntriesLink :: String,
                                      outputKrisinformationFeedEntriesAuthor :: String,
                                      outputKrisinformationFeedEntriesUpdated :: String,
                                      outputKrisinformationFeedEntriesID :: String,
                                      outputKrisinformationFeedEntriesTitle :: String,
                                      outputKrisinformationFeedEntriesCapEvent :: String}
  deriving (Data.Data.Data,
            Eq,
            Read,
            Show,
            Data.Typeable.Typeable)
instance Data.Aeson.ToJSON OutputKrisinformationFeedEntries where
  toJSON x
    = Data.Aeson.object
        (Data.Maybe.catMaybes
           [Just
              ((Data.Aeson..=)
                 "Summary" (outputKrisinformationFeedEntriesSummary x)),
            Just
              ((Data.Aeson..=)
                 "CapArea" (outputKrisinformationFeedEntriesCapArea x)),
            Just
              ((Data.Aeson..=)
                 "Link" (outputKrisinformationFeedEntriesLink x)),
            Just
              ((Data.Aeson..=)
                 "Author" (outputKrisinformationFeedEntriesAuthor x)),
            Just
              ((Data.Aeson..=)
                 "Updated" (outputKrisinformationFeedEntriesUpdated x)),
            Just
              ((Data.Aeson..=)
                 "ID" (outputKrisinformationFeedEntriesID x)),
            Just
              ((Data.Aeson..=)
                 "Title" (outputKrisinformationFeedEntriesTitle x)),
            Just
              ((Data.Aeson..=)
                 "CapEvent" (outputKrisinformationFeedEntriesCapEvent x))])
instance Data.Aeson.FromJSON OutputKrisinformationFeedEntries where
  parseJSON
    (Data.Aeson.Object v)
    = (<*>)
        ((<*>)
           ((<*>)
              ((<*>)
                 ((<*>)
                    ((<*>)
                       ((<*>)
                          ((<*>)
                             (pure OutputKrisinformationFeedEntries)
                             ((Data.Aeson..:) v "Summary"))
                          ((Data.Aeson..:) v "CapArea"))
                       ((Data.Aeson..:) v "Link"))
                    ((Data.Aeson..:) v "Author"))
                 ((Data.Aeson..:) v "Updated"))
              ((Data.Aeson..:) v "ID"))
           ((Data.Aeson..:) v "Title"))
        ((Data.Aeson..:) v "CapEvent")
  parseJSON v
    = fail (show v)
data OutputKrisinformationFeedEntriesCapArea
  = OutputKrisinformationFeedEntriesCapArea {outputKrisinformationFeedEntriesCapAreaCapAreaDesc :: String,
                                             outputKrisinformationFeedEntriesCapAreaCoordinate :: String}
  deriving (Data.Data.Data,
            Eq,
            Read,
            Show,
            Data.Typeable.Typeable)
instance Data.Aeson.ToJSON OutputKrisinformationFeedEntriesCapArea where
  toJSON x
    = Data.Aeson.object
        (Data.Maybe.catMaybes
           [Just
              ((Data.Aeson..=)
                 "CapAreaDesc"
                 (outputKrisinformationFeedEntriesCapAreaCapAreaDesc x)),
            Just
              ((Data.Aeson..=)
                 "Coordinate"
                 (outputKrisinformationFeedEntriesCapAreaCoordinate x))])
instance Data.Aeson.FromJSON OutputKrisinformationFeedEntriesCapArea where
  parseJSON
    (Data.Aeson.Object v)
    = (<*>)
        ((<*>)
           (pure OutputKrisinformationFeedEntriesCapArea)
           ((Data.Aeson..:) v "CapAreaDesc"))
        ((Data.Aeson..:) v "Coordinate")
  parseJSON v
    = fail (show v)
data InputSmhiPmp
  = InputSmhiPmp {inputSmhiPmpLat :: String,
                  inputSmhiPmpLon :: String}
  deriving (Data.Data.Data,
            Eq,
            Read,
            Show,
            Data.Typeable.Typeable)
instance Data.Aeson.ToJSON InputSmhiPmp where
  toJSON x@(InputSmhiPmp {})
    = Data.Aeson.object
        (Data.Maybe.catMaybes
           [Just
              ((Data.Aeson..=) "lat" (inputSmhiPmpLat x)),
            Just
              ((Data.Aeson..=) "lon" (inputSmhiPmpLon x))])
instance Data.Aeson.FromJSON InputSmhiPmp where
  parseJSON
    (Data.Aeson.Object v)
    = (<|>)
        ((<*>)
           ((<*>)
              (pure InputSmhiPmp)
              ((Data.Aeson..:) v "lat"))
           ((Data.Aeson..:) v "lon"))
        empty
  parseJSON _ = mzero
instance Data.TH.Object.Object InputSmhiPmp String Language.JavaScript.Interpret.Primitive where
  toObject x@(InputSmhiPmp {})
    = fromList
        (Data.Maybe.catMaybes
           [Just
              ((\ k_aY06 v_aY07 -> (k_aY06, Data.TH.Convert.convert v_aY07))
                 "lat" (inputSmhiPmpLat x)),
            Just
              ((\ k_aY06 v_aY07 -> (k_aY06, Data.TH.Convert.convert v_aY07))
                 "lon" (inputSmhiPmpLon x))])
data OutputSmhiPmp
  = OutputSmhiPmp {outputSmhiPmpLat :: Double,
                   outputSmhiPmpLon :: Double,
                   outputSmhiPmpReferenceTime :: String,
                   outputSmhiPmpTimeseries :: [OutputSmhiPmpTimeseries]}
  deriving (Data.Data.Data,
            Eq,
            Read,
            Show,
            Data.Typeable.Typeable)
instance Data.Aeson.ToJSON OutputSmhiPmp where
  toJSON x
    = Data.Aeson.object
        (Data.Maybe.catMaybes
           [Just
              ((Data.Aeson..=) "lat" (outputSmhiPmpLat x)),
            Just
              ((Data.Aeson..=) "lon" (outputSmhiPmpLon x)),
            Just
              ((Data.Aeson..=)
                 "referenceTime" (outputSmhiPmpReferenceTime x)),
            Just
              ((Data.Aeson..=)
                 "timeseries" (outputSmhiPmpTimeseries x))])
instance Data.Aeson.FromJSON OutputSmhiPmp where
  parseJSON
    (Data.Aeson.Object v)
    = (<*>)
        ((<*>)
           ((<*>)
              ((<*>)
                 (pure OutputSmhiPmp)
                 ((Data.Aeson..:) v "lat"))
              ((Data.Aeson..:) v "lon"))
           ((Data.Aeson..:) v "referenceTime"))
        ((Data.Aeson..:) v "timeseries")
  parseJSON v
    = fail (show v)
data OutputSmhiPmpTimeseries
  = OutputSmhiPmpTimeseries {outputSmhiPmpTimeseriesTcc :: Double,
                             outputSmhiPmpTimeseriesWs :: Double,
                             outputSmhiPmpTimeseriesMsl :: Double,
                             outputSmhiPmpTimeseriesHcc :: Double,
                             outputSmhiPmpTimeseriesValidTime :: String,
                             outputSmhiPmpTimeseriesWd :: Double,
                             outputSmhiPmpTimeseriesPcat :: Double,
                             outputSmhiPmpTimeseriesTstm :: Double,
                             outputSmhiPmpTimeseriesLcc :: Double,
                             outputSmhiPmpTimeseriesT :: Double,
                             outputSmhiPmpTimeseriesVis :: Double,
                             outputSmhiPmpTimeseriesPis :: Double,
                             outputSmhiPmpTimeseriesR :: Double,
                             outputSmhiPmpTimeseriesMcc :: Double,
                             outputSmhiPmpTimeseriesPit :: Double,
                             outputSmhiPmpTimeseriesGust :: Double}
  deriving (Data.Data.Data,
            Eq,
            Read,
            Show,
            Data.Typeable.Typeable)
instance Data.Aeson.ToJSON OutputSmhiPmpTimeseries where
  toJSON x
    = Data.Aeson.object
        (Data.Maybe.catMaybes
           [Just
              ((Data.Aeson..=)
                 "tcc" (outputSmhiPmpTimeseriesTcc x)),
            Just
              ((Data.Aeson..=)
                 "ws" (outputSmhiPmpTimeseriesWs x)),
            Just
              ((Data.Aeson..=)
                 "msl" (outputSmhiPmpTimeseriesMsl x)),
            Just
              ((Data.Aeson..=)
                 "hcc" (outputSmhiPmpTimeseriesHcc x)),
            Just
              ((Data.Aeson..=)
                 "validTime" (outputSmhiPmpTimeseriesValidTime x)),
            Just
              ((Data.Aeson..=)
                 "wd" (outputSmhiPmpTimeseriesWd x)),
            Just
              ((Data.Aeson..=)
                 "pcat" (outputSmhiPmpTimeseriesPcat x)),
            Just
              ((Data.Aeson..=)
                 "tstm" (outputSmhiPmpTimeseriesTstm x)),
            Just
              ((Data.Aeson..=)
                 "lcc" (outputSmhiPmpTimeseriesLcc x)),
            Just
              ((Data.Aeson..=) "t" (outputSmhiPmpTimeseriesT x)),
            Just
              ((Data.Aeson..=)
                 "vis" (outputSmhiPmpTimeseriesVis x)),
            Just
              ((Data.Aeson..=)
                 "pis" (outputSmhiPmpTimeseriesPis x)),
            Just
              ((Data.Aeson..=) "r" (outputSmhiPmpTimeseriesR x)),
            Just
              ((Data.Aeson..=)
                 "mcc" (outputSmhiPmpTimeseriesMcc x)),
            Just
              ((Data.Aeson..=)
                 "pit" (outputSmhiPmpTimeseriesPit x)),
            Just
              ((Data.Aeson..=)
                 "gust" (outputSmhiPmpTimeseriesGust x))])
instance Data.Aeson.FromJSON OutputSmhiPmpTimeseries where
  parseJSON
    (Data.Aeson.Object v)
    = (<*>)
        ((<*>)
           ((<*>)
              ((<*>)
                 ((<*>)
                    ((<*>)
                       ((<*>)
                          ((<*>)
                             ((<*>)
                                ((<*>)
                                   ((<*>)
                                      ((<*>)
                                         ((<*>)
                                            ((<*>)
                                               ((<*>)
                                                  ((<*>)
                                                     (pure OutputSmhiPmpTimeseries)
                                                     ((Data.Aeson..:) v "tcc"))
                                                  ((Data.Aeson..:) v "ws"))
                                               ((Data.Aeson..:) v "msl"))
                                            ((Data.Aeson..:) v "hcc"))
                                         ((Data.Aeson..:) v "validTime"))
                                      ((Data.Aeson..:) v "wd"))
                                   ((Data.Aeson..:) v "pcat"))
                                ((Data.Aeson..:) v "tstm"))
                             ((Data.Aeson..:) v "lcc"))
                          ((Data.Aeson..:) v "t"))
                       ((Data.Aeson..:) v "vis"))
                    ((Data.Aeson..:) v "pis"))
                 ((Data.Aeson..:) v "r"))
              ((Data.Aeson..:) v "mcc"))
           ((Data.Aeson..:) v "pit"))
        ((Data.Aeson..:) v "gust")
  parseJSON v
    = fail (show v)
