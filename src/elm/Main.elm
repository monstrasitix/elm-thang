module Main exposing (main)

import Browser
import Browser.Navigation as Navigation
import Routing
import Subscriptions exposing (subscriptions)
import Type exposing (Flags, Model, Msg)
import Update exposing (update)
import Url
import View exposing (view)



-- Initialization


init : Flags -> Url.Url -> Navigation.Key -> ( Model, Cmd Msg )
init flags url key =
    ( Type.Model key (Routing.parseUrl url)
    , Cmd.none
    )



-- Main


main : Program Flags Model Msg
main =
    Browser.application
        { init = init
        , view = view
        , update = update
        , subscriptions = subscriptions
        , onUrlRequest = Type.OnUrlRequest
        , onUrlChange = Type.OnUrlChange
        }
