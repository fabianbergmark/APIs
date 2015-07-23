import Data.Settings.YQL
import Data.State.YQL
import Control.Monad.Trans.API
import TH.APIsNoTH
import TH.YQLsNoTH

data S = S

instance YQLState S where

main = do
  let input = InputSmhiPmp "58.59" "16.18"
  (mOut, _) <- runAPIT S $ smhiPmp YQLSettings input
  case mOut of
   Just out -> do
     forM (outputSmhiPmpTimeseries out) $ \ts -> do
       let vt = outputSmhiPmpTimeseriesValidTime ts
           t = outputSmhiPmpTimeseriesT ts
       putStrLn (vt ++ ": " ++ (show t))
