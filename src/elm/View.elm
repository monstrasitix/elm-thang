module View exposing (view)

import Browser exposing (Document)
import Html
import Html.Attributes as Attribute
import Html.Events as Event
import Routing
import Type exposing (Model, Msg)



-- Main View Function


navbarLink : Html.Html Msg
navbarLink =
    Html.li [ Attribute.class "navbar-item" ]
        [ Html.a [ Attribute.href "#", Attribute.class "navbar-link" ]
            [ Html.text "Link" ]
        ]


navbarLogoColumn : Html.Html Msg
navbarLogoColumn =
    Html.div [ Attribute.class "navbar-column" ]
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


navbarMenuColumn : Html.Html Msg
navbarMenuColumn =
    Html.div [ Attribute.class "navbar-column navbar-column--desktop" ]
        [ Html.div [ Attribute.class "navbar-item" ]
            [ Html.ul [ Attribute.class "navbar-list" ]
                [ navbarLink
                , navbarLink
                , navbarLink
                ]
            ]
        ]


navbarToggleColumn : Html.Html Msg
navbarToggleColumn =
    Html.div [ Attribute.class "navbar-column navbar-column--mobile" ]
        [ Html.div [ Attribute.class "navbar-item" ]
            [ Html.button
                [ Attribute.href "#"
                , Attribute.type_ "button"
                , Attribute.class "navbar-button"
                , Event.onClick Type.NavbarToggled
                ]
                [ Html.i [ Attribute.class "fa fa-bars" ] []
                ]
            ]
        ]


navbar : Html.Html Msg
navbar =
    Html.div [ Attribute.class "navbar navbar--fixed" ]
        [ Html.div [ Attribute.class "navbar-container" ]
            [ navbarLogoColumn
            , navbarMenuColumn
            , navbarToggleColumn
            ]
        ]


header : Html.Html Msg
header =
    Html.div [ Attribute.class "header" ]
        [ Html.h1 []
            [ Html.text "Header" ]
        ]


drawer : Bool -> Html.Html Msg
drawer isOpen =
    Html.aside
        [ Attribute.class "drawer"
        , Attribute.classList [ ( "drawer--open", isOpen ) ]
        ]
        [ Html.button
            [ Attribute.href "#"
            , Attribute.type_ "button"
            , Attribute.class "drawer-button"
            , Event.onClick Type.NavbarToggled
            ]
            [ Html.i [ Attribute.class "fa fa-times" ] []
            ]
        ]


view : Model -> Document Msg
view model =
    { title = "Homepage"
    , body =
        [ drawer model.navbarToggle
        , Html.div [ Attribute.class "drawer-push" ]
            [ navbar
            , header
            ]
        ]
    }
