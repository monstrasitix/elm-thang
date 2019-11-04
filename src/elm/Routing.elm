module Routing exposing (..)

import Url
import Url.Parser as Parser


type Route
    = NotFoundRoute
    | HomeRoute


matchers : Parser.Parser (Route -> a) a
matchers =
    Parser.oneOf
        [ Parser.map HomeRoute Parser.top
        ]


parseUrl : Url.Url -> Route
parseUrl url =
    case Parser.parse matchers url of
        Just route ->
            route

        Nothing ->
            NotFoundRoute


pathFor : Route -> String
pathFor route =
    case route of
        HomeRoute ->
            "/"

        NotFoundRoute ->
            "/not-found"
