module Main exposing (..)

import Browser exposing (Document)
import BrowserInfo exposing (BrowserInfo(..))
import Html
import Json.Decode as Decode
import Ports


main =
    Browser.document
        { init = init
        , subscriptions = subscriptions
        , update = update
        , view = view
        }


type alias Model =
    { browser : BrowserInfo }


type Msg
    = Info BrowserInfo


init : () -> ( Model, Cmd msg )
init _ =
    ( { browser = Unknown }, Ports.getBrowserInfoPort () )


subscriptions : Model -> Sub Msg
subscriptions _ =
    Ports.browserInfoResponsePort
        (Decode.decodeValue BrowserInfo.decodeBrowserInfo
            >> Result.withDefault Unknown
            >> Info
        )


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case Debug.log "msg" msg of
        Info info ->
            ( { model | browser = info }, Cmd.none )


view : Model -> Document msg
view model =
    { title = "BrowserInfo"
    , body =
        [ Debug.toString model.browser |> Html.text
        ]
    }
