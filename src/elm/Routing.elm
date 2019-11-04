module Routing exposing (..)

import Url
import Url.Parser as Parser



-- Main Routing


type Route
    = NotFound
    | Home



-- Route Matching


matchers : Parser.Parser (Route -> a) a
matchers =
    Parser.oneOf
        [ Parser.map Home Parser.top
        ]



-- Route Parser


parseUrl : Url.Url -> Route
parseUrl url =
    case Parser.parse matchers url of
        Just route ->
            route

        Nothing ->
            NotFound



-- Path Creator


pathFor : Route -> String
pathFor route =
    case route of
        Home ->
            "/"

        NotFound ->
            "/not-found"
