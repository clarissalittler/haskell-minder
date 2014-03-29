module Beeminder where

import Network.HTTP.Conduit
import qualified Data.ByteString.Lazy as L
import Control.Monad.State

type UserName = String
type AuthToken = String

base = "https://www.beeminder.com/api/v1/"
 
type Beeminder a = StateT BeeState IO a

data BeeState = BeeState UserName AuthToken

data Goal = Goal

{- here let's keep this link for reference https://www.beeminder.com/api -}

{- uhh for how we'll be doing username and authtoken let's just let it be passed in however people want? Instead, let's just have it so that the state-running term takes both of those as arguments because that seems easier  -}

evalBee :: Beeminder a -> UserName -> AuthToken -> IO a
evalBee b u a = evalStateT b (BeeState u a)