{-# LANGUAGE DeriveGeneric #-}
{-# LANGUAGE OverloadedStrings #-}


module Main where

import Data.Monoid ((<>))
import Data.Aeson (FromJSON, ToJSON)
import GHC.Generics
import Web.Scotty

import Data.Maybe
import Network.HTTP.Types
import Data.Text.Lazy.Encoding (decodeUtf8)
import Data.Text.Internal.Lazy



data Response = Response { path :: String, host :: String, headers :: String } deriving (Show, Generic)
instance ToJSON Response
instance FromJSON Response


main = do
  putStrLn "Starting Server..."
  scotty 8080 $ do

   	post  (regex "^/(.*)$") $ do

   		rhost <- header "Host"
   		rpath <- param "0"
   		rheaders <- headers
	   	
		let res = Response { path = rpath, host = rhost, headers = rheaders}
	   	json (res)

