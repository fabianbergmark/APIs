{-# LANGUAGE OverloadedStrings,
             RankNTypes,
             TemplateHaskell #-}

module TH.YQLsNoTH where

import Language.Haskell.TH

import TH.APIsNoTH
import qualified YQL
import qualified Data.TH.Object
import Data.OpenDataTable
import Data.OpenDataTable.LiftNoTH ()
import qualified Data.OpenDataTable
import Data.Settings.YQLNoTH
import qualified Data.State.YQL
import qualified Control.Monad.Trans.API

import qualified Data.Aeson
import qualified Control.Monad.IO.Class
import qualified Control.Monad.Catch
import qualified System.Log.Logger

-- src/TH/YQLs.hs:(13,3)-(25,14): Splicing declarations
dropboxFiles ::
  forall s m a. (Control.Monad.IO.Class.MonadIO m,
                 Control.Monad.Catch.MonadThrow m,
                 Data.State.YQL.YQLState s) =>
  YQLSettings
  -> InputDropboxFiles
     -> Control.Monad.Trans.API.APIT s m (Maybe OutputDropboxFiles)
dropboxFiles
  = \ _ input_ak0KF
      -> do { value_ak0KG <- ((Control.Monad.IO.Class.liftIO
                               .
                                 ((YQL.runYQL
                                     (OpenDataTable
                                        Nothing
                                        Nothing
                                        Nothing
                                        (Meta
                                           (Just
                                              "\n\
                                              \      Fabian Bergmark\n\
                                              \    ")
                                           Nothing
                                           (Just
                                              "\n\
                                              \      https://www.dropbox.com/developers/core/docs\n\
                                              \    ")
                                           Nothing
                                           [])
                                        Nothing
                                        [SelectBinding
                                           (Select
                                              Nothing
                                              (Just ProductJSON)
                                              Nothing
                                              (Just
                                                 "\n\
                                                 \          https://api-content.dropbox.com/1/files/{root}/{path}\n\
                                                 \        ")
                                              [InputKey
                                                 (InputInfo
                                                    "root"
                                                    Nothing
                                                    InputTypeString
                                                    ParamTypePath
                                                    True
                                                    (Just "auto")
                                                    Nothing
                                                    Nothing
                                                    Nothing
                                                    Nothing),
                                               InputKey
                                                 (InputInfo
                                                    "path"
                                                    Nothing
                                                    InputTypeString
                                                    ParamTypePath
                                                    True
                                                    Nothing
                                                    Nothing
                                                    Nothing
                                                    Nothing
                                                    Nothing),
                                               InputKey
                                                 (InputInfo
                                                    "rev"
                                                    Nothing
                                                    InputTypeDouble
                                                    ParamTypeQuery
                                                    False
                                                    Nothing
                                                    Nothing
                                                    Nothing
                                                    Nothing
                                                    Nothing),
                                               InputKey
                                                 (InputInfo
                                                    "access_token"
                                                    Nothing
                                                    InputTypeString
                                                    ParamTypeVariable
                                                    True
                                                    Nothing
                                                    Nothing
                                                    Nothing
                                                    Nothing
                                                    Nothing)]
                                              (Just
                                                 "\n\
                                                 \      try {\n\
                                                 \      response.object = {};\n\
                                                 \      response.object.content =\n\
                                                 \      y.rest(request.url)\n\
                                                 \      .header('Authorization', 'Bearer ' + access_token)\n\
                                                 \      .get().response;\n\
                                                 \      } catch(err) {\n\
                                                 \      response.object = { 'result':'failure', 'error': err };\n\
                                                 \      }\n\
                                                 \      \n\
                                                 \      ")
                                              Nothing)]))
                                  . Data.TH.Object.toObject))
                              $ input_ak0KF);
              case Data.Aeson.fromJSON value_ak0KG of
                Data.Aeson.Success output_ak0KH ->
                  do { return . Just $ output_ak0KH }
                Data.Aeson.Error _ ->
                  do { (Control.Monad.IO.Class.liftIO
                           $
                             (System.Log.Logger.errorM
                                ("YQL." ++ "dropbox.files")
                                "Could not decode response body"));
                          return Nothing } }
dropboxFilesPut ::
  forall s m a. (Control.Monad.IO.Class.MonadIO m,
                 Control.Monad.Catch.MonadThrow m,
                 Data.State.YQL.YQLState s) =>
  YQLSettings
  -> InputDropboxFilesPut
     -> Control.Monad.Trans.API.APIT s m (Maybe OutputDropboxFilesPut)
dropboxFilesPut
  = \ _ input_ak0KI
      -> do { value_ak0KJ <- ((Control.Monad.IO.Class.liftIO
                               .
                                 ((YQL.runYQL
                                     (OpenDataTable
                                        Nothing
                                        Nothing
                                        Nothing
                                        (Meta
                                           (Just
                                              "\n\
                                              \      Fabian Bergmark\n\
                                              \    ")
                                           Nothing
                                           (Just
                                              "\n\
                                              \      https://www.dropbox.com/developers/core/docs\n\
                                              \    ")
                                           Nothing
                                           [])
                                        Nothing
                                        [SelectBinding
                                           (Select
                                              Nothing
                                              (Just ProductJSON)
                                              Nothing
                                              (Just
                                                 "\n\
                                                 \          https://api-content.dropbox.com/1/files_put/{root}/{path}\n\
                                                 \        ")
                                              [InputKey
                                                 (InputInfo
                                                    "root"
                                                    Nothing
                                                    InputTypeString
                                                    ParamTypePath
                                                    True
                                                    (Just "auto")
                                                    Nothing
                                                    Nothing
                                                    Nothing
                                                    Nothing),
                                               InputKey
                                                 (InputInfo
                                                    "path"
                                                    Nothing
                                                    InputTypeString
                                                    ParamTypePath
                                                    True
                                                    Nothing
                                                    Nothing
                                                    Nothing
                                                    Nothing
                                                    Nothing),
                                               InputKey
                                                 (InputInfo
                                                    "param"
                                                    Nothing
                                                    InputTypeString
                                                    ParamTypeQuery
                                                    False
                                                    Nothing
                                                    Nothing
                                                    Nothing
                                                    Nothing
                                                    Nothing),
                                               InputKey
                                                 (InputInfo
                                                    "content"
                                                    Nothing
                                                    InputTypeString
                                                    ParamTypeVariable
                                                    True
                                                    Nothing
                                                    Nothing
                                                    Nothing
                                                    Nothing
                                                    Nothing),
                                               InputKey
                                                 (InputInfo
                                                    "access_token"
                                                    Nothing
                                                    InputTypeString
                                                    ParamTypeVariable
                                                    True
                                                    Nothing
                                                    Nothing
                                                    Nothing
                                                    Nothing
                                                    Nothing)]
                                              (Just
                                                 "\n\
                                                 \      try {\n\
                                                 \      response.object =\n\
                                                 \      y.rest(request.url)\n\
                                                 \      .header('Authorization', 'Bearer ' + access_token)\n\
                                                 \      .post(content).response;\n\
                                                 \      } catch(err) {\n\
                                                 \      response.object = {'result':'failure', 'error': err};\n\
                                                 \      }\n\
                                                 \      \n\
                                                 \      ")
                                              Nothing)]))
                                  . Data.TH.Object.toObject))
                              $ input_ak0KI);
              case Data.Aeson.fromJSON value_ak0KJ of
                Data.Aeson.Success output_ak0KK -> do { ((return . Just) $ output_ak0KK) }
                Data.Aeson.Error _ ->
                  do { (Control.Monad.IO.Class.liftIO
                           $
                             (System.Log.Logger.errorM
                                ("YQL." ++ "dropbox.files.put")
                                "Could not decode response body"));
                          return Nothing } }
dropboxMetadata ::
  forall s m a. (Control.Monad.IO.Class.MonadIO m,
                 Control.Monad.Catch.MonadThrow m,
                 Data.State.YQL.YQLState s) =>
  YQLSettings
  -> InputDropboxMetadata
     -> Control.Monad.Trans.API.APIT s m (Maybe OutputDropboxMetadata)
dropboxMetadata
  = \ _ input_ak0KL
      -> do { value_ak0KM <- ((Control.Monad.IO.Class.liftIO
                               .
                                 ((YQL.runYQL
                                     (OpenDataTable
                                        Nothing
                                        Nothing
                                        Nothing
                                        (Meta
                                           (Just
                                              "\n\
                                              \      Fabian Bergmark\n\
                                              \    ")
                                           Nothing
                                           (Just
                                              "\n\
                                              \      https://www.dropbox.com/developers/core/docs\n\
                                              \    ")
                                           Nothing
                                           [])
                                        Nothing
                                        [SelectBinding
                                           (Select
                                              Nothing
                                              (Just ProductJSON)
                                              Nothing
                                              (Just
                                                 "\n\
                                                 \          https://api.dropbox.com/1/metadata/{root}/{path}\n\
                                                 \        ")
                                              [InputKey
                                                 (InputInfo
                                                    "path"
                                                    Nothing
                                                    InputTypeString
                                                    ParamTypePath
                                                    True
                                                    (Just "auto")
                                                    Nothing
                                                    Nothing
                                                    Nothing
                                                    Nothing),
                                               InputKey
                                                 (InputInfo
                                                    "root"
                                                    Nothing
                                                    InputTypeString
                                                    ParamTypePath
                                                    False
                                                    (Just "dropbox")
                                                    Nothing
                                                    Nothing
                                                    Nothing
                                                    Nothing),
                                               InputKey
                                                 (InputInfo
                                                    "file_limit"
                                                    Nothing
                                                    InputTypeDouble
                                                    ParamTypeQuery
                                                    False
                                                    Nothing
                                                    Nothing
                                                    Nothing
                                                    Nothing
                                                    Nothing),
                                               InputKey
                                                 (InputInfo
                                                    "hash"
                                                    Nothing
                                                    InputTypeString
                                                    ParamTypeQuery
                                                    False
                                                    Nothing
                                                    Nothing
                                                    Nothing
                                                    Nothing
                                                    Nothing),
                                               InputKey
                                                 (InputInfo
                                                    "list"
                                                    Nothing
                                                    InputTypeBool
                                                    ParamTypeQuery
                                                    False
                                                    Nothing
                                                    Nothing
                                                    Nothing
                                                    Nothing
                                                    Nothing),
                                               InputKey
                                                 (InputInfo
                                                    "include_deleted"
                                                    Nothing
                                                    InputTypeBool
                                                    ParamTypeQuery
                                                    False
                                                    Nothing
                                                    Nothing
                                                    Nothing
                                                    Nothing
                                                    Nothing),
                                               InputKey
                                                 (InputInfo
                                                    "rev"
                                                    Nothing
                                                    InputTypeDouble
                                                    ParamTypeQuery
                                                    False
                                                    Nothing
                                                    Nothing
                                                    Nothing
                                                    Nothing
                                                    Nothing),
                                               InputKey
                                                 (InputInfo
                                                    "locale"
                                                    Nothing
                                                    InputTypeString
                                                    ParamTypeQuery
                                                    False
                                                    Nothing
                                                    Nothing
                                                    Nothing
                                                    Nothing
                                                    Nothing),
                                               InputKey
                                                 (InputInfo
                                                    "include_media_info"
                                                    Nothing
                                                    InputTypeBool
                                                    ParamTypeQuery
                                                    False
                                                    Nothing
                                                    Nothing
                                                    Nothing
                                                    Nothing
                                                    Nothing),
                                               InputKey
                                                 (InputInfo
                                                    "access_token"
                                                    Nothing
                                                    InputTypeString
                                                    ParamTypeVariable
                                                    True
                                                    Nothing
                                                    Nothing
                                                    Nothing
                                                    Nothing
                                                    Nothing)]
                                              (Just
                                                 "\n\
                                                 \      try {\n\
                                                 \      response.object =\n\
                                                 \      y.rest(request.url)\n\
                                                 \      .header('Authorization', 'Bearer ' + access_token)\n\
                                                 \      .get().response;\n\
                                                 \      } catch(err) {\n\
                                                 \      response.object = { 'result':'failure', 'error': err };\n\
                                                 \      }\n\
                                                 \      \n\
                                                 \      ")
                                              Nothing)]))
                                  . Data.TH.Object.toObject))
                              $ input_ak0KL);
              case Data.Aeson.fromJSON value_ak0KM of
                Data.Aeson.Success output_ak0KN ->
                  do { ((return . Just)
                           $ output_ak0KN) }
                Data.Aeson.Error _ ->
                  do { (Control.Monad.IO.Class.liftIO
                           $
                             (System.Log.Logger.errorM
                                ("YQL." ++ "dropbox.metadata")
                                "Could not decode response body"));
                          return Nothing } }
facebookGraphUserFeed ::
  forall s m a. (Control.Monad.IO.Class.MonadIO m,
                 Control.Monad.Catch.MonadThrow m,
                 Data.State.YQL.YQLState s) =>
  YQLSettings
  -> InputFacebookGraphUserFeed
     -> Control.Monad.Trans.API.APIT s m (Maybe OutputFacebookGraphUserFeed)
facebookGraphUserFeed
  = \ _ input_ak0KO
      -> do { value_ak0KP <- ((Control.Monad.IO.Class.liftIO
                               .
                                 ((YQL.runYQL
                                     (OpenDataTable
                                        Nothing
                                        Nothing
                                        Nothing
                                        (Meta
                                           (Just
                                              "\n\
                                              \      Fabian Bergmark\n\
                                              \    ")
                                           Nothing
                                           (Just
                                              "\n\
                                              \      https://developers.facebook.com/docs/graph-api/reference/v2.2/user/feed\n\
                                              \    ")
                                           Nothing
                                           [])
                                        Nothing
                                        [SelectBinding
                                           (Select
                                              Nothing
                                              (Just ProductJSON)
                                              Nothing
                                              (Just
                                                 "\n\
                                                 \          https://graph.facebook.com/v2.2/{user_id}/feed\n\
                                                 \        ")
                                              [InputKey
                                                 (InputInfo
                                                    "user_id"
                                                    Nothing
                                                    InputTypeString
                                                    ParamTypePath
                                                    True
                                                    Nothing
                                                    Nothing
                                                    Nothing
                                                    Nothing
                                                    Nothing),
                                               InputKey
                                                 (InputInfo
                                                    "access_token"
                                                    Nothing
                                                    InputTypeString
                                                    ParamTypeQuery
                                                    True
                                                    Nothing
                                                    Nothing
                                                    Nothing
                                                    Nothing
                                                    Nothing)]
                                              Nothing
                                              Nothing)]))
                                  . Data.TH.Object.toObject))
                              $ input_ak0KO);
              case Data.Aeson.fromJSON value_ak0KP of
                Data.Aeson.Success output_ak0KQ ->
                  do { ((return . Just)
                           $ output_ak0KQ) }
                Data.Aeson.Error _ ->
                  do { (Control.Monad.IO.Class.liftIO
                           $
                             (System.Log.Logger.errorM
                                ("YQL." ++ "facebook.graph.user.feed")
                                "Could not decode response body"));
                          return Nothing } }
facebookGraphUserFeedPost ::
  forall s m a. (Control.Monad.IO.Class.MonadIO m,
                 Control.Monad.Catch.MonadThrow m,
                 Data.State.YQL.YQLState s) =>
  YQLSettings
  -> InputFacebookGraphUserFeedPost
     -> Control.Monad.Trans.API.APIT s m (Maybe OutputFacebookGraphUserFeedPost)
facebookGraphUserFeedPost
  = \ _ input_ak0KR
      -> do { value_ak0KS <- ((Control.Monad.IO.Class.liftIO
                               .
                                 ((YQL.runYQL
                                     (OpenDataTable
                                        Nothing
                                        Nothing
                                        Nothing
                                        (Meta
                                           (Just
                                              "\n\
                                              \      Fabian Bergmark\n\
                                              \    ")
                                           Nothing
                                           (Just
                                              "\n\
                                              \      https://developers.facebook.com/docs/graph-api/reference/v2.2/user/feed\n\
                                              \    ")
                                           Nothing
                                           [])
                                        Nothing
                                        [SelectBinding
                                           (Select
                                              Nothing
                                              (Just ProductJSON)
                                              Nothing
                                              (Just
                                                 "\n\
                                                 \          https://graph.facebook.com/v2.2/{user_id}/feed\n\
                                                 \        ")
                                              [InputKey
                                                 (InputInfo
                                                    "user_id"
                                                    Nothing
                                                    InputTypeString
                                                    ParamTypePath
                                                    True
                                                    Nothing
                                                    Nothing
                                                    Nothing
                                                    Nothing
                                                    Nothing),
                                               InputKey
                                                 (InputInfo
                                                    "access_token"
                                                    Nothing
                                                    InputTypeString
                                                    ParamTypeQuery
                                                    True
                                                    Nothing
                                                    Nothing
                                                    Nothing
                                                    Nothing
                                                    Nothing),
                                               InputKey
                                                 (InputInfo
                                                    "message"
                                                    Nothing
                                                    InputTypeString
                                                    ParamTypeVariable
                                                    False
                                                    Nothing
                                                    Nothing
                                                    Nothing
                                                    Nothing
                                                    Nothing),
                                               InputKey
                                                 (InputInfo
                                                    "link"
                                                    Nothing
                                                    InputTypeString
                                                    ParamTypeVariable
                                                    False
                                                    Nothing
                                                    Nothing
                                                    Nothing
                                                    Nothing
                                                    Nothing),
                                               InputKey
                                                 (InputInfo
                                                    "actions"
                                                    Nothing
                                                    InputTypeString
                                                    ParamTypeVariable
                                                    False
                                                    Nothing
                                                    Nothing
                                                    Nothing
                                                    Nothing
                                                    Nothing),
                                               InputKey
                                                 (InputInfo
                                                    "place"
                                                    Nothing
                                                    InputTypeString
                                                    ParamTypeVariable
                                                    False
                                                    Nothing
                                                    Nothing
                                                    Nothing
                                                    Nothing
                                                    Nothing),
                                               InputKey
                                                 (InputInfo
                                                    "tags"
                                                    Nothing
                                                    InputTypeString
                                                    ParamTypeVariable
                                                    False
                                                    Nothing
                                                    Nothing
                                                    Nothing
                                                    Nothing
                                                    Nothing),
                                               InputKey
                                                 (InputInfo
                                                    "privacy"
                                                    Nothing
                                                    InputTypeString
                                                    ParamTypeVariable
                                                    False
                                                    Nothing
                                                    Nothing
                                                    Nothing
                                                    Nothing
                                                    Nothing),
                                               InputKey
                                                 (InputInfo
                                                    "object_attachment"
                                                    Nothing
                                                    InputTypeString
                                                    ParamTypeVariable
                                                    False
                                                    Nothing
                                                    Nothing
                                                    Nothing
                                                    Nothing
                                                    Nothing)]
                                              (Just
                                                 "\n\
                                                 \      var data =\n\
                                                 \      { message: message,\n\
                                                 \      link: link,\n\
                                                 \      actions: actions,\n\
                                                 \      place: place,\n\
                                                 \      tags: tags,\n\
                                                 \      privacy: privacy,\n\
                                                 \      object_attachment: object_attachment };\n\
                                                 \      try {\n\
                                                 \      response.object =\n\
                                                 \      y.rest(request.url)\n\
                                                 \      .contentType('application/x-www-form-urlencoded; charset=UTF8')\n\
                                                 \      .post(request.querystring(data)).response;\n\
                                                 \      } catch(err) {\n\
                                                 \      response.object = {'result':'failure', 'error': err};\n\
                                                 \      }\n\
                                                 \      \n\
                                                 \      ")
                                              Nothing)]))
                                  . Data.TH.Object.toObject))
                              $ input_ak0KR);
              case Data.Aeson.fromJSON value_ak0KS of
                Data.Aeson.Success output_ak0KT ->
                  do { ((return . Just)
                           $ output_ak0KT) }
                Data.Aeson.Error _ ->
                  do { (Control.Monad.IO.Class.liftIO
                           $
                             (System.Log.Logger.errorM
                                ("YQL." ++ "facebook.graph.user.feed.post")
                                "Could not decode response body"));
                          return Nothing } }
facebookGraphUserFriendlists ::
  forall s m a. (Control.Monad.IO.Class.MonadIO m,
                 Control.Monad.Catch.MonadThrow m,
                 Data.State.YQL.YQLState s) =>
  YQLSettings
  -> InputFacebookGraphUserFriendlists
     -> Control.Monad.Trans.API.APIT s m (Maybe OutputFacebookGraphUserFriendlists)
facebookGraphUserFriendlists
  = \ _ input_ak0KU
      -> do { value_ak0KV <- ((Control.Monad.IO.Class.liftIO
                               .
                                 ((YQL.runYQL
                                     (OpenDataTable
                                        Nothing
                                        Nothing
                                        Nothing
                                        (Meta
                                           (Just
                                              "\n\
                                              \      Fabian Bergmark\n\
                                              \    ")
                                           Nothing
                                           (Just
                                              "\n\
                                              \      https://developers.facebook.com/docs/graph-api/reference/v2.2/user/friendlists\n\
                                              \    ")
                                           Nothing
                                           [])
                                        Nothing
                                        [SelectBinding
                                           (Select
                                              Nothing
                                              (Just ProductJSON)
                                              Nothing
                                              (Just
                                                 "\n\
                                                 \          https://graph.facebook.com/v2.2/{user_id}/friendlists\n\
                                                 \        ")
                                              [InputKey
                                                 (InputInfo
                                                    "user_id"
                                                    Nothing
                                                    InputTypeString
                                                    ParamTypePath
                                                    True
                                                    Nothing
                                                    Nothing
                                                    Nothing
                                                    Nothing
                                                    Nothing),
                                               InputKey
                                                 (InputInfo
                                                    "access_token"
                                                    Nothing
                                                    InputTypeString
                                                    ParamTypeQuery
                                                    True
                                                    Nothing
                                                    Nothing
                                                    Nothing
                                                    Nothing
                                                    Nothing)]
                                              Nothing
                                              Nothing)]))
                                  . Data.TH.Object.toObject))
                              $ input_ak0KU);
              case Data.Aeson.fromJSON value_ak0KV of
                Data.Aeson.Success output_ak0KW ->
                  do { ((return . Just)
                           $ output_ak0KW) }
                Data.Aeson.Error _ ->
                  do { (Control.Monad.IO.Class.liftIO
                           $
                             (System.Log.Logger.errorM
                                ("YQL." ++ "facebook.graph.user.friendlists")
                                "Could not decode response body"));
                          return Nothing } }
facebookGraphUserFriends ::
  forall s m a. (Control.Monad.IO.Class.MonadIO m,
                 Control.Monad.Catch.MonadThrow m,
                 Data.State.YQL.YQLState s) =>
  YQLSettings
  -> InputFacebookGraphUserFriends
     -> Control.Monad.Trans.API.APIT s m (Maybe OutputFacebookGraphUserFriends)
facebookGraphUserFriends
  = \ _ input_ak0KX
      -> do { value_ak0KY <- ((Control.Monad.IO.Class.liftIO
                               .
                                 ((YQL.runYQL
                                     (OpenDataTable
                                        Nothing
                                        Nothing
                                        Nothing
                                        (Meta
                                           (Just
                                              "\n\
                                              \      Fabian Bergmark\n\
                                              \    ")
                                           Nothing
                                           (Just
                                              "\n\
                                              \      https://developers.facebook.com/docs/graph-api/reference/v2.2/user/friends\n\
                                              \    ")
                                           Nothing
                                           [])
                                        Nothing
                                        [SelectBinding
                                           (Select
                                              Nothing
                                              (Just ProductJSON)
                                              Nothing
                                              (Just
                                                 "\n\
                                                 \          https://graph.facebook.com/v2.2/{user_id}/friends\n\
                                                 \        ")
                                              [InputKey
                                                 (InputInfo
                                                    "user_id"
                                                    Nothing
                                                    InputTypeString
                                                    ParamTypePath
                                                    True
                                                    Nothing
                                                    Nothing
                                                    Nothing
                                                    Nothing
                                                    Nothing),
                                               InputKey
                                                 (InputInfo
                                                    "access_token"
                                                    Nothing
                                                    InputTypeString
                                                    ParamTypeQuery
                                                    True
                                                    Nothing
                                                    Nothing
                                                    Nothing
                                                    Nothing
                                                    Nothing)]
                                              Nothing
                                              Nothing)]))
                                  . Data.TH.Object.toObject))
                              $ input_ak0KX);
              case Data.Aeson.fromJSON value_ak0KY of
                Data.Aeson.Success output_ak0KZ
                  -> do { ((return . Just)
                           $ output_ak0KZ) }
                Data.Aeson.Error _
                  -> do { (Control.Monad.IO.Class.liftIO
                           $
                             (System.Log.Logger.errorM
                                ("YQL." ++ "facebook.graph.user.friends")
                                "Could not decode response body"));
                          return Nothing } }
facebookGraphUserInbox ::
  forall s m a. (Control.Monad.IO.Class.MonadIO m,
                 Control.Monad.Catch.MonadThrow m,
                 Data.State.YQL.YQLState s) =>
  YQLSettings
  -> InputFacebookGraphUserInbox
     -> Control.Monad.Trans.API.APIT s m (Maybe OutputFacebookGraphUserInbox)
facebookGraphUserInbox
  = \ _ input_ak0L0
      -> do { value_ak0L1 <- ((Control.Monad.IO.Class.liftIO
                               .
                                 ((YQL.runYQL
                                     (OpenDataTable
                                        Nothing
                                        Nothing
                                        Nothing
                                        (Meta
                                           (Just
                                              "\n\
                                              \      Fabian Bergmark\n\
                                              \    ")
                                           Nothing
                                           (Just
                                              "\n\
                                              \      https://developers.facebook.com/docs/graph-api/reference/v2.2/user/inbox\n\
                                              \    ")
                                           Nothing
                                           [])
                                        Nothing
                                        [SelectBinding
                                           (Select
                                              Nothing
                                              (Just ProductJSON)
                                              Nothing
                                              (Just
                                                 "\n\
                                                 \          https://graph.facebook.com/v2.2/{user_id}/inbox\n\
                                                 \        ")
                                              [InputKey
                                                 (InputInfo
                                                    "user_id"
                                                    Nothing
                                                    InputTypeString
                                                    ParamTypePath
                                                    True
                                                    Nothing
                                                    Nothing
                                                    Nothing
                                                    Nothing
                                                    Nothing),
                                               InputKey
                                                 (InputInfo
                                                    "access_token"
                                                    Nothing
                                                    InputTypeString
                                                    ParamTypeQuery
                                                    True
                                                    Nothing
                                                    Nothing
                                                    Nothing
                                                    Nothing
                                                    Nothing)]
                                              Nothing
                                              Nothing)]))
                                  . Data.TH.Object.toObject))
                              $ input_ak0L0);
              case Data.Aeson.fromJSON value_ak0L1 of
                Data.Aeson.Success output_ak0L2
                  -> do { ((return . Just)
                           $ output_ak0L2) }
                Data.Aeson.Error _
                  -> do { (Control.Monad.IO.Class.liftIO
                           $
                             (System.Log.Logger.errorM
                                ("YQL." ++ "facebook.graph.user.inbox")
                                "Could not decode response body"));
                          return Nothing } }
facebookGraphUserLinks ::
  forall s m a. (Control.Monad.IO.Class.MonadIO m,
                 Control.Monad.Catch.MonadThrow m,
                 Data.State.YQL.YQLState s) =>
  YQLSettings
  -> InputFacebookGraphUserLinks
     -> Control.Monad.Trans.API.APIT s m (Maybe OutputFacebookGraphUserLinks)
facebookGraphUserLinks
  = \ _ input_ak0L3
      -> do { value_ak0L4 <- ((Control.Monad.IO.Class.liftIO
                               .
                                 ((YQL.runYQL
                                     (OpenDataTable
                                        Nothing
                                        Nothing
                                        Nothing
                                        (Meta
                                           (Just
                                              "\n\
                                              \      Fabian Bergmark\n\
                                              \    ")
                                           Nothing
                                           (Just
                                              "\n\
                                              \      https://developers.facebook.com/docs/graph-api/reference/v2.2/user/feed\n\
                                              \    ")
                                           Nothing
                                           [])
                                        Nothing
                                        [SelectBinding
                                           (Select
                                              Nothing
                                              (Just ProductJSON)
                                              Nothing
                                              (Just
                                                 "\n\
                                                 \          https://graph.facebook.com/v2.2/{user_id}/links\n\
                                                 \        ")
                                              [InputKey
                                                 (InputInfo
                                                    "user_id"
                                                    Nothing
                                                    InputTypeString
                                                    ParamTypePath
                                                    True
                                                    Nothing
                                                    Nothing
                                                    Nothing
                                                    Nothing
                                                    Nothing),
                                               InputKey
                                                 (InputInfo
                                                    "access_token"
                                                    Nothing
                                                    InputTypeString
                                                    ParamTypeQuery
                                                    True
                                                    Nothing
                                                    Nothing
                                                    Nothing
                                                    Nothing
                                                    Nothing)]
                                              Nothing
                                              Nothing)]))
                                  . Data.TH.Object.toObject))
                              $ input_ak0L3);
              case Data.Aeson.fromJSON value_ak0L4 of
                Data.Aeson.Success output_ak0L5
                  -> do { ((return . Just)
                           $ output_ak0L5) }
                Data.Aeson.Error _
                  -> do { (Control.Monad.IO.Class.liftIO
                           $
                             (System.Log.Logger.errorM
                                ("YQL." ++ "facebook.graph.user.links")
                                "Could not decode response body"));
                          return Nothing } }
facebookGraphUserPhotos ::
  forall s m a. (Control.Monad.IO.Class.MonadIO m,
                 Control.Monad.Catch.MonadThrow m,
                 Data.State.YQL.YQLState s) =>
  YQLSettings
  -> InputFacebookGraphUserPhotos
     -> Control.Monad.Trans.API.APIT s m (Maybe OutputFacebookGraphUserPhotos)
facebookGraphUserPhotos
  = \ _ input_ak0L6
      -> do { value_ak0L7 <- ((Control.Monad.IO.Class.liftIO
                               .
                                 ((YQL.runYQL
                                     (OpenDataTable
                                        Nothing
                                        Nothing
                                        Nothing
                                        (Meta
                                           (Just
                                              "\n\
                                              \      Fabian Bergmark\n\
                                              \    ")
                                           Nothing
                                           (Just
                                              "\n\
                                              \      https://developers.facebook.com/docs/graph-api/reference/v2.2/user/photos\n\
                                              \    ")
                                           Nothing
                                           [])
                                        Nothing
                                        [SelectBinding
                                           (Select
                                              Nothing
                                              (Just ProductJSON)
                                              Nothing
                                              (Just
                                                 "\n\
                                                 \          https://graph.facebook.com/v2.2/{user_id}/photos\n\
                                                 \        ")
                                              [InputKey
                                                 (InputInfo
                                                    "user_id"
                                                    Nothing
                                                    InputTypeString
                                                    ParamTypePath
                                                    True
                                                    Nothing
                                                    Nothing
                                                    Nothing
                                                    Nothing
                                                    Nothing),
                                               InputKey
                                                 (InputInfo
                                                    "access_token"
                                                    Nothing
                                                    InputTypeString
                                                    ParamTypeQuery
                                                    True
                                                    Nothing
                                                    Nothing
                                                    Nothing
                                                    Nothing
                                                    Nothing)]
                                              Nothing
                                              Nothing)]))
                                  . Data.TH.Object.toObject))
                              $ input_ak0L6);
              case Data.Aeson.fromJSON value_ak0L7 of
                Data.Aeson.Success output_ak0L8
                  -> do { ((return . Just)
                           $ output_ak0L8) }
                Data.Aeson.Error _
                  -> do { (Control.Monad.IO.Class.liftIO
                           $
                             (System.Log.Logger.errorM
                                ("YQL." ++ "facebook.graph.user.photos")
                                "Could not decode response body"));
                          return Nothing } }
facebookGraphUserPhotosuploaded ::
  forall s m a. (Control.Monad.IO.Class.MonadIO m,
                 Control.Monad.Catch.MonadThrow m,
                 Data.State.YQL.YQLState s) =>
  YQLSettings
  -> InputFacebookGraphUserPhotosuploaded
     -> Control.Monad.Trans.API.APIT s m (Maybe OutputFacebookGraphUserPhotosuploaded)
facebookGraphUserPhotosuploaded
  = \ _ input_ak0L9
      -> do { value_ak0La <- ((Control.Monad.IO.Class.liftIO
                               .
                                 ((YQL.runYQL
                                     (OpenDataTable
                                        Nothing
                                        Nothing
                                        Nothing
                                        (Meta
                                           (Just
                                              "\n\
                                              \      Fabian Bergmark\n\
                                              \    ")
                                           Nothing
                                           (Just
                                              "\n\
                                              \      https://developers.facebook.com/docs/graph-api/reference/user/photos/uploaded\n\
                                              \    ")
                                           Nothing
                                           ["\n\
                                            \      SELECT * FROM {table} WHERE user_id=\"me\" AND access_token=\"CAAFUtF57FWIBABsDzU4Te7HDwHZBxZCB2gKYlVZAfg3qFaYxqHCq7E2YygHDOqZC3wrYDciK0tdDI1kgECAlblWFHZBjbG3qaNWj8MZAXPfnkInwvIPMmikuOOJrXoClqqcWDZAL7WWpoShEGc0JChHXao2FBsGmhsmOnycnNBomZAm3Hnzq8X1qXpR6A6ll3loWp51YXJ3VvAZDZD\"\n\
                                            \    "])
                                        Nothing
                                        [SelectBinding
                                           (Select
                                              Nothing
                                              (Just ProductJSON)
                                              Nothing
                                              (Just
                                                 "\n\
                                                 \          https://graph.facebook.com/{user_id}/photos/uploaded\n\
                                                 \        ")
                                              [InputKey
                                                 (InputInfo
                                                    "user_id"
                                                    Nothing
                                                    InputTypeString
                                                    ParamTypePath
                                                    True
                                                    Nothing
                                                    Nothing
                                                    Nothing
                                                    Nothing
                                                    Nothing),
                                               InputKey
                                                 (InputInfo
                                                    "access_token"
                                                    Nothing
                                                    InputTypeString
                                                    ParamTypeQuery
                                                    True
                                                    Nothing
                                                    Nothing
                                                    Nothing
                                                    Nothing
                                                    Nothing)]
                                              Nothing
                                              Nothing)]))
                                  . Data.TH.Object.toObject))
                              $ input_ak0L9);
              case Data.Aeson.fromJSON value_ak0La of
                Data.Aeson.Success output_ak0Lb
                  -> do { ((return . Just)
                           $ output_ak0Lb) }
                Data.Aeson.Error _
                  -> do { (Control.Monad.IO.Class.liftIO
                           $
                             (System.Log.Logger.errorM
                                ("YQL." ++ "facebook.graph.user.photosuploaded")
                                "Could not decode response body"));
                          return Nothing } }
facebookGraphUserPokes ::
  forall s m a. (Control.Monad.IO.Class.MonadIO m,
                 Control.Monad.Catch.MonadThrow m,
                 Data.State.YQL.YQLState s) =>
  YQLSettings
  -> InputFacebookGraphUserPokes
     -> Control.Monad.Trans.API.APIT s m (Maybe OutputFacebookGraphUserPokes)
facebookGraphUserPokes
  = \ _ input_ak0Lc
      -> do { value_ak0Ld <- ((Control.Monad.IO.Class.liftIO
                               .
                                 ((YQL.runYQL
                                     (OpenDataTable
                                        Nothing
                                        Nothing
                                        Nothing
                                        (Meta
                                           (Just
                                              "\n\
                                              \      Fabian Bergmark\n\
                                              \    ")
                                           Nothing
                                           (Just
                                              "\n\
                                              \      https://developers.facebook.com/docs/graph-api/v2.2/reference/user/pokes\n\
                                              \    ")
                                           Nothing
                                           [])
                                        Nothing
                                        [SelectBinding
                                           (Select
                                              Nothing
                                              (Just ProductJSON)
                                              Nothing
                                              (Just
                                                 "\n\
                                                 \          https://graph.facebook.com/v2.2/{user_id}/pokes\n\
                                                 \        ")
                                              [InputKey
                                                 (InputInfo
                                                    "user_id"
                                                    Nothing
                                                    InputTypeString
                                                    ParamTypePath
                                                    True
                                                    Nothing
                                                    Nothing
                                                    Nothing
                                                    Nothing
                                                    Nothing),
                                               InputKey
                                                 (InputInfo
                                                    "access_token"
                                                    Nothing
                                                    InputTypeString
                                                    ParamTypeQuery
                                                    True
                                                    Nothing
                                                    Nothing
                                                    Nothing
                                                    Nothing
                                                    Nothing)]
                                              Nothing
                                              Nothing)]))
                                  . Data.TH.Object.toObject))
                              $ input_ak0Lc);
              case Data.Aeson.fromJSON value_ak0Ld of
                Data.Aeson.Success output_ak0Le
                  -> do { ((return . Just)
                           $ output_ak0Le) }
                Data.Aeson.Error _
                  -> do { (Control.Monad.IO.Class.liftIO
                           $
                             (System.Log.Logger.errorM
                                ("YQL." ++ "facebook.graph.user.pokes")
                                "Could not decode response body"));
                          return Nothing } }
facebookGraphUserPosts ::
  forall s m a. (Control.Monad.IO.Class.MonadIO m,
                 Control.Monad.Catch.MonadThrow m,
                 Data.State.YQL.YQLState s) =>
  YQLSettings
  -> InputFacebookGraphUserPosts
     -> Control.Monad.Trans.API.APIT s m (Maybe OutputFacebookGraphUserPosts)
facebookGraphUserPosts
  = \ _ input_ak0Lf
      -> do { value_ak0Lg <- ((Control.Monad.IO.Class.liftIO
                               .
                                 ((YQL.runYQL
                                     (OpenDataTable
                                        Nothing
                                        Nothing
                                        Nothing
                                        (Meta
                                           (Just
                                              "\n\
                                              \      Fabian Bergmark\n\
                                              \    ")
                                           Nothing
                                           (Just
                                              "\n\
                                              \      https://developers.facebook.com/docs/graph-api/reference/v2.2/user/feed\n\
                                              \    ")
                                           Nothing
                                           [])
                                        Nothing
                                        [SelectBinding
                                           (Select
                                              Nothing
                                              (Just ProductJSON)
                                              Nothing
                                              (Just
                                                 "\n\
                                                 \          https://graph.facebook.com/v2.2/{user_id}/posts\n\
                                                 \        ")
                                              [InputKey
                                                 (InputInfo
                                                    "user_id"
                                                    Nothing
                                                    InputTypeString
                                                    ParamTypePath
                                                    True
                                                    Nothing
                                                    Nothing
                                                    Nothing
                                                    Nothing
                                                    Nothing),
                                               InputKey
                                                 (InputInfo
                                                    "access_token"
                                                    Nothing
                                                    InputTypeString
                                                    ParamTypeQuery
                                                    True
                                                    Nothing
                                                    Nothing
                                                    Nothing
                                                    Nothing
                                                    Nothing)]
                                              Nothing
                                              Nothing)]))
                                  . Data.TH.Object.toObject))
                              $ input_ak0Lf);
              case Data.Aeson.fromJSON value_ak0Lg of
                Data.Aeson.Success output_ak0Lh
                  -> do { ((return . Just)
                           $ output_ak0Lh) }
                Data.Aeson.Error _
                  -> do { (Control.Monad.IO.Class.liftIO
                           $
                             (System.Log.Logger.errorM
                                ("YQL." ++ "facebook.graph.user.posts")
                                "Could not decode response body"));
                          return Nothing } }
facebookGraphUserStatuses ::
  forall s m a. (Control.Monad.IO.Class.MonadIO m,
                 Control.Monad.Catch.MonadThrow m,
                 Data.State.YQL.YQLState s) =>
  YQLSettings
  -> InputFacebookGraphUserStatuses
     -> Control.Monad.Trans.API.APIT s m (Maybe OutputFacebookGraphUserStatuses)
facebookGraphUserStatuses
  = \ _ input_ak0Li
      -> do { value_ak0Lj <- ((Control.Monad.IO.Class.liftIO
                               .
                                 ((YQL.runYQL
                                     (OpenDataTable
                                        Nothing
                                        Nothing
                                        Nothing
                                        (Meta
                                           (Just
                                              "\n\
                                              \      Fabian Bergmark\n\
                                              \    ")
                                           Nothing
                                           (Just
                                              "\n\
                                              \      https://developers.facebook.com/docs/graph-api/reference/2.2/user/feed\n\
                                              \    ")
                                           Nothing
                                           [])
                                        Nothing
                                        [SelectBinding
                                           (Select
                                              Nothing
                                              (Just ProductJSON)
                                              Nothing
                                              (Just
                                                 "\n\
                                                 \          https://graph.facebook.com/v2.2/{user_id}/statuses\n\
                                                 \        ")
                                              [InputKey
                                                 (InputInfo
                                                    "user_id"
                                                    Nothing
                                                    InputTypeString
                                                    ParamTypePath
                                                    True
                                                    Nothing
                                                    Nothing
                                                    Nothing
                                                    Nothing
                                                    Nothing),
                                               InputKey
                                                 (InputInfo
                                                    "access_token"
                                                    Nothing
                                                    InputTypeString
                                                    ParamTypeQuery
                                                    True
                                                    Nothing
                                                    Nothing
                                                    Nothing
                                                    Nothing
                                                    Nothing)]
                                              Nothing
                                              Nothing)]))
                                  . Data.TH.Object.toObject))
                              $ input_ak0Li);
              case Data.Aeson.fromJSON value_ak0Lj of
                Data.Aeson.Success output_ak0Lk
                  -> do { ((return . Just)
                           $ output_ak0Lk) }
                Data.Aeson.Error _
                  -> do { (Control.Monad.IO.Class.liftIO
                           $
                             (System.Log.Logger.errorM
                                ("YQL." ++ "facebook.graph.user.statuses")
                                "Could not decode response body"));
                          return Nothing } }
facebookGraphUserTagged ::
  forall s m a. (Control.Monad.IO.Class.MonadIO m,
                 Control.Monad.Catch.MonadThrow m,
                 Data.State.YQL.YQLState s) =>
  YQLSettings
  -> InputFacebookGraphUserTagged
     -> Control.Monad.Trans.API.APIT s m (Maybe OutputFacebookGraphUserTagged)
facebookGraphUserTagged
  = \ _ input_ak0Ll
      -> do { value_ak0Lm <- ((Control.Monad.IO.Class.liftIO
                               .
                                 ((YQL.runYQL
                                     (OpenDataTable
                                        Nothing
                                        Nothing
                                        Nothing
                                        (Meta
                                           (Just
                                              "\n\
                                              \      Fabian Bergmark\n\
                                              \    ")
                                           Nothing
                                           (Just
                                              "\n\
                                              \      https://developers.facebook.com/docs/graph-api/reference/v2.2/user/feed\n\
                                              \    ")
                                           Nothing
                                           [])
                                        Nothing
                                        [SelectBinding
                                           (Select
                                              Nothing
                                              (Just ProductJSON)
                                              Nothing
                                              (Just
                                                 "\n\
                                                 \          https://graph.facebook.com/v2.2/{user_id}/tagged\n\
                                                 \        ")
                                              [InputKey
                                                 (InputInfo
                                                    "user_id"
                                                    Nothing
                                                    InputTypeString
                                                    ParamTypePath
                                                    True
                                                    Nothing
                                                    Nothing
                                                    Nothing
                                                    Nothing
                                                    Nothing),
                                               InputKey
                                                 (InputInfo
                                                    "access_token"
                                                    Nothing
                                                    InputTypeString
                                                    ParamTypeQuery
                                                    True
                                                    Nothing
                                                    Nothing
                                                    Nothing
                                                    Nothing
                                                    Nothing)]
                                              Nothing
                                              Nothing)]))
                                  . Data.TH.Object.toObject))
                              $ input_ak0Ll);
              case Data.Aeson.fromJSON value_ak0Lm of
                Data.Aeson.Success output_ak0Ln
                  -> do { ((return . Just)
                           $ output_ak0Ln) }
                Data.Aeson.Error _
                  -> do { (Control.Monad.IO.Class.liftIO
                           $
                             (System.Log.Logger.errorM
                                ("YQL." ++ "facebook.graph.user.tagged")
                                "Could not decode response body"));
                          return Nothing } }
krisinformationFeed ::
  forall s m a. (Control.Monad.IO.Class.MonadIO m,
                 Control.Monad.Catch.MonadThrow m,
                 Data.State.YQL.YQLState s) =>
  YQLSettings
  -> InputKrisinformationFeed
     -> Control.Monad.Trans.API.APIT s m (Maybe OutputKrisinformationFeed)
krisinformationFeed
  = \ _ input_ak0Lo
      -> do { value_ak0Lp <- ((Control.Monad.IO.Class.liftIO
                               .
                                 ((YQL.runYQL
                                     (OpenDataTable
                                        Nothing
                                        Nothing
                                        Nothing
                                        (Meta
                                           (Just "Fabian Bergmark")
                                           Nothing
                                           (Just
                                              "http://www.krisinformation.se/web/Pages/Page____73795.aspx")
                                           Nothing
                                           ["select * from {table}"])
                                        Nothing
                                        [SelectBinding
                                           (Select
                                              Nothing
                                              (Just ProductJSON)
                                              Nothing
                                              (Just
                                                 "http://api.krisinformation.se/v1/feed?format=json")
                                              []
                                              Nothing
                                              Nothing)]))
                                  . Data.TH.Object.toObject))
                              $ input_ak0Lo);
              case Data.Aeson.fromJSON value_ak0Lp of
                Data.Aeson.Success output_ak0Lq
                  -> do { ((return . Just)
                           $ output_ak0Lq) }
                Data.Aeson.Error _
                  -> do { (Control.Monad.IO.Class.liftIO
                           $
                             (System.Log.Logger.errorM
                                ("YQL." ++ "krisinformation.feed")
                                "Could not decode response body"));
                          return Nothing } }
smhiPmp ::
  forall s m a. (Control.Monad.IO.Class.MonadIO m,
                 Control.Monad.Catch.MonadThrow m,
                 Data.State.YQL.YQLState s) =>
  YQLSettings
  -> InputSmhiPmp
     -> Control.Monad.Trans.API.APIT s m (Maybe OutputSmhiPmp)
smhiPmp
  = \ _ input_ak0Lr
      -> do { value_ak0Ls <- ((Control.Monad.IO.Class.liftIO
                               .
                                 ((YQL.runYQL
                                     (OpenDataTable
                                        Nothing
                                        Nothing
                                        Nothing
                                        (Meta
                                           (Just "Fabian Bergmark")
                                           Nothing
                                           (Just
                                              "\n\
                                              \      http://www.smhi.se/klimatdata/Oppna-data/Meteorologiska-data/api-for-vaderprognosdata-1.34233\n\
                                              \    ")
                                           Nothing
                                           ["select * from {table} where lat=\"58.59\" and lon=\"16.18\""])
                                        Nothing
                                        [SelectBinding
                                           (Select
                                              Nothing
                                              (Just ProductJSON)
                                              Nothing
                                              (Just
                                                 "http://opendata-download-metfcst.smhi.se/api/category/pmp1.5g/version/1/geopoint/lat/{lat}/lon/{lon}/data.json")
                                              [InputKey
                                                 (InputInfo
                                                    "lat"
                                                    Nothing
                                                    InputTypeString
                                                    ParamTypePath
                                                    True
                                                    Nothing
                                                    Nothing
                                                    Nothing
                                                    Nothing
                                                    Nothing),
                                               InputKey
                                                 (InputInfo
                                                    "lon"
                                                    Nothing
                                                    InputTypeString
                                                    ParamTypePath
                                                    True
                                                    Nothing
                                                    Nothing
                                                    Nothing
                                                    Nothing
                                                    Nothing)]
                                              (Just
                                                 "\n\
                                                 \      console.log(request.url);\n\
                                                 \      var data = request.get().response;\n\
                                                 \      //console.log(data);\n\
                                                 \      response.object = data;\n\
                                                 \      \n\
                                                 \      ")
                                              Nothing)]))
                                  . Data.TH.Object.toObject))
                              $ input_ak0Lr);
              case Data.Aeson.fromJSON value_ak0Ls of
                Data.Aeson.Success output_ak0Lt
                  -> do { ((return . Just)
                           $ output_ak0Lt) }
                Data.Aeson.Error _
                  -> do { (Control.Monad.IO.Class.liftIO
                           $
                             (System.Log.Logger.errorM
                                ("YQL." ++ "smhi.pmp") "Could not decode response body"));
                          return Nothing } }
