module View exposing (view)

import Browser exposing (Document)
import Html
import Type exposing (Model, Msg)



-- Main View Function


view : Model -> Document Msg
view _ =
    { title = "Homepage"
    , body =
        [ Html.text "Hello Elm"
        ]
    }
