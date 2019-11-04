module Update exposing (update)

import Browser
import Browser.Navigation as Navigation
import Type
import Url



-- Main Update Function


update : Type.Msg -> Type.Model -> ( Type.Model, Cmd Type.Msg )
update msg model =
    case msg of
        Type.OnUrlRequest urlRequest ->
            ( model
            , onUrlRequest urlRequest model.key
            )

        Type.OnUrlChange url ->
            ( model |> onUrlChange url
            , Cmd.none
            )


onUrlRequest : Browser.UrlRequest -> Navigation.Key -> Cmd Type.Msg
onUrlRequest urlRequest key =
    case urlRequest of
        Browser.Internal url ->
            Url.toString url
                |> Navigation.pushUrl key

        Browser.External url ->
            Navigation.load url


onUrlChange : Url.Url -> Type.Model -> Type.Model
onUrlChange url model =
    { model | url = url }
