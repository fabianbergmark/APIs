module TH.Schema where

generateSchemas :: [(FilePath, OpenTable)] -> IO ()
generateSchemas tables =
  sequence $ generateFFI <$> generateSchema <$> tables

generateSchema :: (FilePath, OpenTable) -> IO ()
generateSchema (fp, ot) = do
  samples = metaSampleQuery . openTableMeta $ ot
