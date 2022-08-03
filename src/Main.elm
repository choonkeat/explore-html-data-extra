module Main exposing (..)

import Browser
import Homepage
import HtmlData exposing (..)
import HtmlData.Attributes exposing (..)
import HtmlData.Events exposing (..)
import HtmlData.Extra
import HtmlData.Keyed


main : Program () Int Msg
main =
    Browser.sandbox
        { init = 0
        , update = update
        , view = Homepage.demo view -- wrap `view` with demo; view is standard from <https://guide.elm-lang.org>
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
    let
        sortedStrings =
            List.range 0 model
                -- so 0 to 0 is an empty list
                |> List.drop 1
                -- so we have opportunities to insert stuff between stuff
                |> List.map String.fromInt
                |> List.sort
    in
    div [ name "hello\">" ]
        [ button [ onClick Decrement ] [ text "-" ]
        , div [] [ text (String.fromInt model) ]
        , button [ onClick Increment ] [ text "+" ]
        , yourview model
        , viewList sortedStrings
        , p []
            [ text "New node is yellow, old nodes fade, to show off "
            , code [] [ text "HtmlData.Keyed" ]
            , text " working properly. Try adding more than 10 items!"
            ]
        ]


viewList : List String -> Html msg
viewList sortedStrings =
    let
        totalCount =
            List.length sortedStrings
    in
    HtmlData.Keyed.ol []
        (List.map (\s -> ( s, viewNumber totalCount s )) sortedStrings)


viewNumber : Int -> String -> Html msg
viewNumber totalCount string =
    let
        cssName =
            if String.fromInt totalCount == string then
                "current"

            else
                "past"
    in
    li [ class cssName ] [ text ("Item " ++ string) ]



--


yourview : Int -> Html msg
yourview num =
    div []
        [ if modBy 2 num == 0 then
            strong [] [ text "Get even" ]

          else
            em [] [ text "That's odd" ]
        ]
