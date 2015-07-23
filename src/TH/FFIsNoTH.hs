{-# LANGUAGE TemplateHaskell #-}

module TH.FFIsNoTH where

import Control.Monad.Trans.API (runAPIT)
import Data.Settings.YQL
import Data.State.YQL
import FFI.Types ()
import TH.APIsNoTH
import TH.YQLsNoTH
import TH.FFI

import Control.Applicative ((<$>))
import Foreign.Storable
import Foreign.Marshal.Utils (new)
import GHC.Ptr

data State
  = State

instance YQLState State where

-- Src/TH/FFIs.hs:(15,3)-(26,14): Splicing declarations
dropboxFiles_ffi ::
  Ptr Data.Settings.YQL.YQLSettings
  -> Ptr InputDropboxFiles
     -> IO (Ptr (Maybe OutputDropboxFiles))
dropboxFiles_ffi =
  (\ pipe_a4Vtv ptrSettings_a4Vtw ptrInput_a4Vtx -> do
      settings_a4Vty <- peek ptrSettings_a4Vtw
      input_a4Vtz <- peek ptrInput_a4Vtx;
      let action_a4VtA = pipe_a4Vtv settings_a4Vty input_a4Vtz;
      ret_a4VtB <- fst <$> (runAPIT State action_a4VtA)
      new ret_a4VtB) dropboxFiles
foreign export ccall "dropboxFiles_ffi" dropboxFiles_ffi
  :: Ptr Data.Settings.YQL.YQLSettings
     -> Ptr InputDropboxFiles
        -> IO (Ptr (Maybe OutputDropboxFiles))
dropboxFilesPut_ffi ::
  Ptr Data.Settings.YQL.YQLSettings
  -> Ptr InputDropboxFilesPut
     -> IO (Ptr (Maybe OutputDropboxFilesPut))
dropboxFilesPut_ffi
  = (\ pipe_a4VtC ptrSettings_a4VtD ptrInput_a4VtE -> do
        settings_a4VtF <- peek ptrSettings_a4VtD
        input_a4VtG <- peek ptrInput_a4VtE
        let action_a4VtH = pipe_a4VtC settings_a4VtF input_a4VtG
        ret_a4VtI <- fst <$> (runAPIT State action_a4VtH)
        new ret_a4VtI) dropboxFilesPut
foreign export ccall "dropboxFilesPut_ffi" dropboxFilesPut_ffi
  :: Ptr Data.Settings.YQL.YQLSettings
     -> Ptr InputDropboxFilesPut
        -> IO (Ptr (Maybe OutputDropboxFilesPut))
dropboxMetadata_ffi ::
  Ptr Data.Settings.YQL.YQLSettings
  -> Ptr InputDropboxMetadata
     -> IO (Ptr (Maybe OutputDropboxMetadata))
dropboxMetadata_ffi
  = (\ pipe_a4VtJ ptrSettings_a4VtK ptrInput_a4VtL -> do
    settings_a4VtM <- peek ptrSettings_a4VtK;
    input_a4VtN <- peek ptrInput_a4VtL;
    let action_a4VtO = pipe_a4VtJ settings_a4VtM input_a4VtN;
    ret_a4VtP <- fst <$> (runAPIT State action_a4VtO)
    new ret_a4VtP) dropboxMetadata
foreign export ccall "dropboxMetadata_ffi" dropboxMetadata_ffi
  :: Ptr Data.Settings.YQL.YQLSettings
     -> Ptr InputDropboxMetadata
        -> IO (Ptr (Maybe OutputDropboxMetadata))
facebookGraphUserFeed_ffi ::
  Ptr Data.Settings.YQL.YQLSettings
  -> Ptr InputFacebookGraphUserFeed
     -> IO (Ptr (Maybe OutputFacebookGraphUserFeed))
facebookGraphUserFeed_ffi
  = (\ pipe_a4VtQ ptrSettings_a4VtR ptrInput_a4VtS -> do
        settings_a4VtT <- peek ptrSettings_a4VtR;
        input_a4VtU <- peek ptrInput_a4VtS;
        let action_a4VtV = pipe_a4VtQ settings_a4VtT input_a4VtU;
        ret_a4VtW <- fst <$> (runAPIT State action_a4VtV)
        new ret_a4VtW) facebookGraphUserFeed
foreign export ccall "facebookGraphUserFeed_ffi" facebookGraphUserFeed_ffi
  :: Ptr Data.Settings.YQL.YQLSettings
     -> Ptr InputFacebookGraphUserFeed
        -> IO (Ptr (Maybe OutputFacebookGraphUserFeed))
facebookGraphUserFeedPost_ffi ::
  Ptr Data.Settings.YQL.YQLSettings
  -> Ptr InputFacebookGraphUserFeedPost
     -> IO (Ptr (Maybe OutputFacebookGraphUserFeedPost))
facebookGraphUserFeedPost_ffi
  = (\ pipe_a4VtX ptrSettings_a4VtY ptrInput_a4VtZ -> do
    settings_a4Vu0 <- peek ptrSettings_a4VtY;
    input_a4Vu1 <- peek ptrInput_a4VtZ;
    let action_a4Vu2 = pipe_a4VtX settings_a4Vu0 input_a4Vu1;
    ret_a4Vu3 <- fst <$> (runAPIT State action_a4Vu2)
    new ret_a4Vu3) facebookGraphUserFeedPost
foreign export ccall "facebookGraphUserFeedPost_ffi" facebookGraphUserFeedPost_ffi
  :: Ptr Data.Settings.YQL.YQLSettings
     -> Ptr InputFacebookGraphUserFeedPost
        -> IO (Ptr (Maybe OutputFacebookGraphUserFeedPost))
facebookGraphUserFriendlists_ffi ::
  Ptr Data.Settings.YQL.YQLSettings
  -> Ptr InputFacebookGraphUserFriendlists
     -> IO (Ptr (Maybe OutputFacebookGraphUserFriendlists))
facebookGraphUserFriendlists_ffi
  = (\ pipe_a4Vu4 ptrSettings_a4Vu5 ptrInput_a4Vu6 -> do
        settings_a4Vu7 <- peek ptrSettings_a4Vu5;
        input_a4Vu8 <- peek ptrInput_a4Vu6;
        let action_a4Vu9 = pipe_a4Vu4 settings_a4Vu7 input_a4Vu8;
        ret_a4Vua <- fst <$> (runAPIT State action_a4Vu9)
        new ret_a4Vua)
      facebookGraphUserFriendlists
foreign export ccall "facebookGraphUserFriendlists_ffi" facebookGraphUserFriendlists_ffi
  :: Ptr Data.Settings.YQL.YQLSettings
     -> Ptr InputFacebookGraphUserFriendlists
        -> IO (Ptr (Maybe OutputFacebookGraphUserFriendlists))
facebookGraphUserFriends_ffi ::
  Ptr Data.Settings.YQL.YQLSettings
  -> Ptr InputFacebookGraphUserFriends
     -> IO (Ptr (Maybe OutputFacebookGraphUserFriends))
facebookGraphUserFriends_ffi
  = (\ pipe_a4Vub ptrSettings_a4Vuc ptrInput_a4Vud -> do
        settings_a4Vue <- peek ptrSettings_a4Vuc;
        input_a4Vuf <- peek ptrInput_a4Vud;
        let action_a4Vug = pipe_a4Vub settings_a4Vue input_a4Vuf;
        ret_a4Vuh <- fst <$> (runAPIT State action_a4Vug)
        new ret_a4Vuh) facebookGraphUserFriends
foreign export ccall "facebookGraphUserFriends_ffi" facebookGraphUserFriends_ffi
  :: Ptr Data.Settings.YQL.YQLSettings
     -> Ptr InputFacebookGraphUserFriends
        -> IO (Ptr (Maybe OutputFacebookGraphUserFriends))
facebookGraphUserInbox_ffi ::
  Ptr Data.Settings.YQL.YQLSettings
  -> Ptr InputFacebookGraphUserInbox
     -> IO (Ptr (Maybe OutputFacebookGraphUserInbox))
facebookGraphUserInbox_ffi
  = (\ pipe_a4Vui ptrSettings_a4Vuj ptrInput_a4Vuk -> do
        settings_a4Vul <- peek ptrSettings_a4Vuj;
        input_a4Vum <- peek ptrInput_a4Vuk;
        let action_a4Vun = pipe_a4Vui settings_a4Vul input_a4Vum;
        ret_a4Vuo <- fst <$> (runAPIT State action_a4Vun)
        new ret_a4Vuo) facebookGraphUserInbox
foreign export ccall "facebookGraphUserInbox_ffi" facebookGraphUserInbox_ffi
  :: Ptr Data.Settings.YQL.YQLSettings
     -> Ptr InputFacebookGraphUserInbox
        -> IO (Ptr (Maybe OutputFacebookGraphUserInbox))
facebookGraphUserLinks_ffi ::
  Ptr Data.Settings.YQL.YQLSettings
  -> Ptr InputFacebookGraphUserLinks
     -> IO (Ptr (Maybe OutputFacebookGraphUserLinks))
facebookGraphUserLinks_ffi
  = (\ pipe_a4Vup ptrSettings_a4Vuq ptrInput_a4Vur -> do
        settings_a4Vus <- peek ptrSettings_a4Vuq;
        input_a4Vut <- peek ptrInput_a4Vur;
        let action_a4Vuu = pipe_a4Vup settings_a4Vus input_a4Vut;
        ret_a4Vuv <- fst <$> (runAPIT State action_a4Vuu)
        new ret_a4Vuv) facebookGraphUserLinks
foreign export ccall "facebookGraphUserLinks_ffi" facebookGraphUserLinks_ffi
  :: Ptr Data.Settings.YQL.YQLSettings
     -> Ptr InputFacebookGraphUserLinks
        -> IO (Ptr (Maybe OutputFacebookGraphUserLinks))
facebookGraphUserPhotos_ffi ::
  Ptr Data.Settings.YQL.YQLSettings
  -> Ptr InputFacebookGraphUserPhotos
     -> IO (Ptr (Maybe OutputFacebookGraphUserPhotos))
facebookGraphUserPhotos_ffi
  = (\ pipe_a4Vuw ptrSettings_a4Vux ptrInput_a4Vuy -> do
        settings_a4Vuz <- peek ptrSettings_a4Vux;
        input_a4VuA <- peek ptrInput_a4Vuy;
        let action_a4VuB = pipe_a4Vuw settings_a4Vuz input_a4VuA;
        ret_a4VuC <- fst <$> (runAPIT State action_a4VuB)
        new ret_a4VuC) facebookGraphUserPhotos
foreign export ccall "facebookGraphUserPhotos_ffi" facebookGraphUserPhotos_ffi
  :: Ptr Data.Settings.YQL.YQLSettings
     -> Ptr InputFacebookGraphUserPhotos
        -> IO (Ptr (Maybe OutputFacebookGraphUserPhotos))
facebookGraphUserPhotosuploaded_ffi ::
  Ptr Data.Settings.YQL.YQLSettings
  -> Ptr InputFacebookGraphUserPhotosuploaded
     -> IO (Ptr (Maybe OutputFacebookGraphUserPhotosuploaded))
facebookGraphUserPhotosuploaded_ffi
  = (\ pipe_a4VuD ptrSettings_a4VuE ptrInput_a4VuF -> do
        settings_a4VuG <- peek ptrSettings_a4VuE;
        input_a4VuH <- peek ptrInput_a4VuF;
        let action_a4VuI = pipe_a4VuD settings_a4VuG input_a4VuH;
        ret_a4VuJ <- fst <$> (runAPIT State action_a4VuI)
        new ret_a4VuJ) facebookGraphUserPhotosuploaded
foreign export ccall "facebookGraphUserPhotosuploaded_ffi" facebookGraphUserPhotosuploaded_ffi
  :: Ptr Data.Settings.YQL.YQLSettings
     -> Ptr InputFacebookGraphUserPhotosuploaded
        -> IO (Ptr (Maybe OutputFacebookGraphUserPhotosuploaded))
facebookGraphUserPokes_ffi ::
  Ptr Data.Settings.YQL.YQLSettings
  -> Ptr InputFacebookGraphUserPokes
     -> IO (Ptr (Maybe OutputFacebookGraphUserPokes))
facebookGraphUserPokes_ffi
  = (\ pipe_a4VuK ptrSettings_a4VuL ptrInput_a4VuM -> do
        settings_a4VuN <- peek ptrSettings_a4VuL;
        input_a4VuO <- peek ptrInput_a4VuM;
        let action_a4VuP = pipe_a4VuK settings_a4VuN input_a4VuO;
        ret_a4VuQ <- fst <$> (runAPIT State action_a4VuP)
        new ret_a4VuQ) facebookGraphUserPokes
foreign export ccall "facebookGraphUserPokes_ffi" facebookGraphUserPokes_ffi
  :: Ptr Data.Settings.YQL.YQLSettings
     -> Ptr InputFacebookGraphUserPokes
        -> IO (Ptr (Maybe OutputFacebookGraphUserPokes))
facebookGraphUserPosts_ffi ::
  Ptr Data.Settings.YQL.YQLSettings
  -> Ptr InputFacebookGraphUserPosts
     -> IO (Ptr (Maybe OutputFacebookGraphUserPosts))
facebookGraphUserPosts_ffi
  = (\ pipe_a4VuR ptrSettings_a4VuS ptrInput_a4VuT -> do
        settings_a4VuU <- peek ptrSettings_a4VuS;
        input_a4VuV <- peek ptrInput_a4VuT;
        let action_a4VuW = pipe_a4VuR settings_a4VuU input_a4VuV;
        ret_a4VuX <- fst <$> (runAPIT State action_a4VuW)
        new ret_a4VuX) facebookGraphUserPosts
foreign export ccall "facebookGraphUserPosts_ffi" facebookGraphUserPosts_ffi
  :: Ptr Data.Settings.YQL.YQLSettings
     -> Ptr InputFacebookGraphUserPosts
        -> IO (Ptr (Maybe OutputFacebookGraphUserPosts))
facebookGraphUserStatuses_ffi ::
  Ptr Data.Settings.YQL.YQLSettings
  -> Ptr InputFacebookGraphUserStatuses
     -> IO (Ptr (Maybe OutputFacebookGraphUserStatuses))
facebookGraphUserStatuses_ffi
  = (\ pipe_a4VuY ptrSettings_a4VuZ ptrInput_a4Vv0 -> do
        settings_a4Vv1 <- peek ptrSettings_a4VuZ;
        input_a4Vv2 <- peek ptrInput_a4Vv0;
        let action_a4Vv3 = pipe_a4VuY settings_a4Vv1 input_a4Vv2;
        ret_a4Vv4 <- fst <$> (runAPIT State action_a4Vv3)
        new ret_a4Vv4) facebookGraphUserStatuses
foreign export ccall "facebookGraphUserStatuses_ffi" facebookGraphUserStatuses_ffi
  :: Ptr Data.Settings.YQL.YQLSettings
     -> Ptr InputFacebookGraphUserStatuses
        -> IO (Ptr (Maybe OutputFacebookGraphUserStatuses))
facebookGraphUserTagged_ffi ::
  Ptr Data.Settings.YQL.YQLSettings
  -> Ptr InputFacebookGraphUserTagged
     -> IO (Ptr (Maybe OutputFacebookGraphUserTagged))
facebookGraphUserTagged_ffi
  = (\ pipe_a4Vv5 ptrSettings_a4Vv6 ptrInput_a4Vv7 -> do
        settings_a4Vv8 <- peek ptrSettings_a4Vv6;
        input_a4Vv9 <- peek ptrInput_a4Vv7;
        let action_a4Vva = pipe_a4Vv5 settings_a4Vv8 input_a4Vv9;
        ret_a4Vvb <- fst <$> (runAPIT State action_a4Vva)
        new ret_a4Vvb) facebookGraphUserTagged
foreign export ccall "facebookGraphUserTagged_ffi" facebookGraphUserTagged_ffi
  :: Ptr Data.Settings.YQL.YQLSettings
     -> Ptr InputFacebookGraphUserTagged
        -> IO (Ptr (Maybe OutputFacebookGraphUserTagged))
krisinformationFeed_ffi ::
  Ptr Data.Settings.YQL.YQLSettings
  -> Ptr InputKrisinformationFeed
     -> IO (Ptr (Maybe OutputKrisinformationFeed))
krisinformationFeed_ffi
  = (\ pipe_a4Vvc ptrSettings_a4Vvd ptrInput_a4Vve -> do
        settings_a4Vvf <- peek ptrSettings_a4Vvd;
        input_a4Vvg <- peek ptrInput_a4Vve;
        let action_a4Vvh = pipe_a4Vvc settings_a4Vvf input_a4Vvg;
        ret_a4Vvi <- fst <$> (runAPIT State action_a4Vvh)
        new ret_a4Vvi) krisinformationFeed
foreign export ccall "krisinformationFeed_ffi" krisinformationFeed_ffi
  :: Ptr Data.Settings.YQL.YQLSettings
     -> Ptr InputKrisinformationFeed
        -> IO (Ptr (Maybe OutputKrisinformationFeed))
smhiPmp_ffi ::
  Ptr Data.Settings.YQL.YQLSettings
  -> Ptr InputSmhiPmp
     -> IO (Ptr (Maybe OutputSmhiPmp))
smhiPmp_ffi
  = (\ pipe_a4Vvj ptrSettings_a4Vvk ptrInput_a4Vvl -> do
        settings_a4Vvm <- peek ptrSettings_a4Vvk;
        input_a4Vvn <- peek ptrInput_a4Vvl;
        let action_a4Vvo = pipe_a4Vvj settings_a4Vvm input_a4Vvn;
        ret_a4Vvp <- fst <$> (runAPIT State action_a4Vvo)
        new ret_a4Vvp) smhiPmp
foreign export ccall "smhiPmp_ffi" smhiPmp_ffi
  :: Ptr Data.Settings.YQL.YQLSettings
     -> Ptr InputSmhiPmp
        -> IO (Ptr (Maybe OutputSmhiPmp))
