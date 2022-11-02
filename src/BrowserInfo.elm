module BrowserInfo exposing
    ( BrowserInfoResponsePort, GetBrowserInfoPort
    , BrowserInfo(..), decodeBrowserInfo
    )

{-| A ports package for getting information on the browser agent, version and so on.


# Ports to talk to the JS side.

@docs BrowserInfoResponsePort, GetBrowserInfoPort


# Decoder for the results.

@docs BrowserInfo, decodeBrowserInfo

-}

import Json.Decode as Decode exposing (Decoder, Value)


type BrowserInfo
    = Chrome
    | Firefox
    | Safari
    | Opera
    | Edge
    | Unknown


{-| Port to request browser info.
-}
type alias GetBrowserInfoPort msg =
    () -> Cmd msg


{-| Port to receive browser info.
-}
type alias BrowserInfoResponsePort msg =
    (Value -> msg) -> Sub msg


{-| Decode for browser info.
-}
decodeBrowserInfo : Decoder BrowserInfo
decodeBrowserInfo =
    Decode.string
        |> Decode.andThen
            (\val ->
                case val of
                    "chrome" ->
                        Decode.succeed Chrome

                    "firefox" ->
                        Decode.succeed Firefox

                    "safari" ->
                        Decode.succeed Safari

                    "opera" ->
                        Decode.succeed Opera

                    "edge" ->
                        Decode.succeed Edge

                    _ ->
                        Decode.succeed Unknown
            )
