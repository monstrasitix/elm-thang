module View exposing (view)

import Browser exposing (Document)
import Html
import Html.Attributes as Attribute
import Routing
import Type exposing (Model, Msg)



-- Main View Function


navbarLink : Html.Html Msg
navbarLink =
    Html.li [ Attribute.class "navbar-item" ]
        [ Html.a [ Attribute.href "#", Attribute.class "navbar-link" ]
            [ Html.text "Link" ]
        ]


navbar : Html.Html Msg
navbar =
    Html.div [ Attribute.class "navbar" ]
        [ Html.div [ Attribute.class "navbar-container" ]
            [ Html.div [ Attribute.class "navbar-column" ]
                [ Html.div [ Attribute.class "navbar-item" ]
                    [ Html.a [ Attribute.href "#", Attribute.class "navbar-link" ]
                        [ Html.img
                            [ Attribute.src "../assets/images/logo.png"
                            , Attribute.class "navbar-logo"
                            ]
                            []
                        ]
                    ]
                ]
            , Html.div [ Attribute.class "navbar-column navbar-column--desktop" ]
                [ Html.div [ Attribute.class "navbar-item" ]
                    [ Html.ul [ Attribute.class "navbar-list" ]
                        [ navbarLink
                        , navbarLink
                        , navbarLink
                        ]
                    ]
                ]
            , Html.div [ Attribute.class "navbar-column navbar-column--mobile" ]
                [ Html.div [ Attribute.class "navbar-item" ]
                    [ Html.button
                        [ Attribute.href "#"
                        , Attribute.type_ "button"
                        , Attribute.class "navbar-button"
                        ]
                        [ Html.i [ Attribute.class "fa fa-bars" ] []
                        ]
                    ]
                ]
            ]
        ]


view : Model -> Document Msg
view model =
    { title = "Homepage"
    , body =
        [ navbar
        ]
    }
