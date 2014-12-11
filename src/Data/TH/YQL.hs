module Data.TH.YQL
       ( YQL(..)
       , YQLPipe(..) ) where

import Language.Haskell.TH

data YQL =
  YQL
  { yqlInputType  :: Type
  , yqlOutputType :: Type
  , yqlPipe       :: YQLPipe }

data YQLPipe =
  YQLPipe
  { yqlPipeName        :: Name
  , yqlPipeSignature   :: Dec
  , yqlPipeDeclaration :: Dec }
