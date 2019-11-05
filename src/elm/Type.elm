module Type exposing (Flags, Model, Msg(..), initial)

import Browser
import Browser.Navigation as Navigation
import Routing
import Url



-- Main Messages


type Msg
    = OnUrlRequest Browser.UrlRequest
    | OnUrlChange Url.Url
    | NavbarToggled



-- Main Flags


type alias Flags =
    ()



-- Main Model


type alias Model =
    { key : Navigation.Key
    , route : Routing.Route
    , navbarToggle : Bool
    }


initial : Navigation.Key -> Routing.Route -> Model
initial key route =
    { key = key
    , route = route
    , navbarToggle = False
    }
