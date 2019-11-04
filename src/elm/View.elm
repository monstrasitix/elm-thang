module View exposing (view)

import Browser exposing (Document)
import Html
import Html.Attributes as Attribute
import Routing
import Type exposing (Model, Msg)



-- Main View Function


view : Model -> Document Msg
view model =
    { title = "Homepage"
    , body =
        [ Html.nav []
            [ Html.a [ Attribute.href "/" ] [ Html.text "Home" ]
            , Html.a [ Attribute.href "/random" ] [ Html.text "Other" ]
            ]
        , Html.div []
            [ case model.route of
                Routing.Home ->
                    Html.text "Home"

                Routing.NotFound ->
                    Html.text "Not found"
            ]
        ]
    }
