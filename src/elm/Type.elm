module Type exposing (Flags, Model, Msg(..))

import Browser
import Browser.Navigation as Navigation
import Url



-- Main Messages


type Msg
    = OnUrlRequest Browser.UrlRequest
    | OnUrlChange Url.Url



-- Main Flags


type alias Flags =
    ()



-- Main Model


type alias Model =
    { key : Navigation.Key
    , url : Url.Url
    }
