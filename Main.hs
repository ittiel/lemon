{-# LANGUAGE OverloadedStrings #-}

import Web.Scotty
import Data.Maybe
import Network.HTTP.Types
import Data.Text.Lazy.Encoding (decodeUtf8)



main = scotty 8080 $ do


 	post  (regex "^/(.*)$") $ do

	   	path <- param "0"
	   	b  <- body
	   	let rbody = decodeUtf8 b
	   	h <- header "Host"
	   	let host = fromJust h
	   	hd <- headers
	   	text $ mconcat [
	   		"Path: ", path, 
	   		"\nBody: ", rbody ,
	   		"\nHost: ", host
	   		]
	get  (regex "^/(.*)$") $ do

	   	path <- param "0"
	   	b  <- body
	   	let rbody = decodeUtf8 b
	   	h <- header "Host"
	   	let host = fromJust h
	   	hd <- headers
	   	text $ mconcat [
	   		"Path: ", path, 
	   		"\nBody: ", rbody ,
	   		"\nHost: ", host
	   		]