module Main exposing (..)

import Browser
import Html
import Html.Attributes
import HtmlData exposing (..)
import HtmlData.Events exposing (..)
import HtmlData.Extra
import HtmlData.Keyed


main : Program () Int Msg
main =
    Browser.sandbox
        { init = 0
        , update = update
        , view = demo view -- wrap `view` with demo; view is standard from <https://guide.elm-lang.org>
        }


type Msg
    = Increment
    | Decrement


update : Msg -> number -> number
update msg model =
    case msg of
        Increment ->
            model + 1

        Decrement ->
            model - 1


view : Int -> Html Msg
view model =
    div []
        [ button [ onClick Decrement ] [ text "-" ]
        , div [] [ text (String.fromInt model) ]
        , button [ onClick Increment ] [ text "+" ]
        , viewList (List.sort (List.map ((+) 1 >> String.fromInt) (List.range 0 model)))
        ]


viewList : List String -> Html msg
viewList numbers =
    HtmlData.Keyed.ul []
        (List.map (\s -> ( s, viewNumber s )) numbers)


viewNumber : String -> Html msg
viewNumber string =
    li [] [ text ("Item " ++ string) ]



--


{-| This is a demo function to render the same `Html msg` node
as interactive, as a html String, and as plain text String

Note we're using Html and Html.Attributes here

-}
demo : (Int -> Html Msg) -> Int -> Html.Html Msg
demo originalView model =
    let
        renderedNode =
            originalView model

        layout =
            Html.div
                [ Html.Attributes.style "max-width" "300px"
                , Html.Attributes.style "margin" "1em auto 1em auto"
                ]

        sectionTitle s =
            Html.p [] [ Html.text s ]

        sectionCode string =
            Html.pre
                [ Html.Attributes.style "white-space" "pre-wrap"
                , Html.Attributes.style "background-color" "lightGray"
                , Html.Attributes.style "padding" "1em"
                ]
                [ Html.text string ]
    in
    layout
        [ sectionTitle "view : Model -> Html Msg"
        , HtmlData.Extra.toElmHtml renderedNode
        , sectionTitle "view -> String (text/html)"
        , sectionCode
            (HtmlData.Extra.toTextHtml HtmlData.Extra.defaultSanitizeConfig renderedNode)
        , sectionTitle "view -> String (text/plain)"
        , sectionCode
            (HtmlData.Extra.toTextPlain HtmlData.Extra.defaultTextPlainConfig renderedNode)
        , Html.a [ Html.Attributes.href "https://github.com/choonkeat/explore-html-data-extra" ] [ Html.text "github.com/choonkeat/explore-html-data-extra" ]
        ]
