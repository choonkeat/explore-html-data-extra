module Main exposing (..)

import Browser
import Homepage
import HtmlData exposing (..)
import HtmlData.Attributes exposing (..)
import HtmlData.Events exposing (..)
import HtmlData.Extra
import HtmlData.Keyed
import HtmlData.Lazy
import Json.Encode


main : Program () Int Msg
main =
    Browser.sandbox
        { init = 4
        , update = update
        , view =
            Homepage.demo
                -- pass our HtmlData.Lazy demo separately to avoid wasting cpu on toTextHtml toTextPlain
                -- which does not do any memoizing
                (HtmlData.Lazy.lazy viewPrime viewPrime_elmhtml 200000)
                -- wrap `view` with demo; view is standard from <https://guide.elm-lang.org>
                view
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
        [ p []
            [ b [] [ text "Manually empty the values of each input below" ]
            , text ", then click "
            , code [] [ text "+" ]
            , text " button to get count >= 10 and see what "
            , a [ href "https://guide.elm-lang.org/optimization/keyed.html" ] [ text "HtmlData.Keyed" ]
            , text " is about"
            ]
        , div []
            [ button [ onClick Decrement ] [ text "-" ]
            , div [] [ text ("Count = " ++ String.fromInt model) ]
            , button [ onClick Increment ] [ text "+" ]
            ]
        , p []
            [ text "Alphabetical sort: "
            , text (Debug.toString sortedStrings)
            ]
        , viewList sortedStrings
        ]


viewList : List String -> Html msg
viewList sortedStrings =
    div []
        [ div []
            [ h2 [] [ text "Default" ]
            , ol []
                (List.map viewNumber sortedStrings)
            ]
        , div []
            [ h2 [] [ text "Keyed" ]
            , HtmlData.Keyed.ol []
                (List.map (\s -> ( s, viewNumber s )) sortedStrings)
            ]
        , div [ style "clear" "both" ] []
        ]


viewNumber : String -> Html msg
viewNumber string =
    li []
        [ input
            [ property "defaultValue" (Json.Encode.string string)
            ]
            []
        , text (" defaultValue = " ++ string)
        ]



-- Example for Lazy from https://juliu.is/performant-elm-html-lazy/


sieve : Int -> List Int
sieve limit =
    let
        numbers =
            List.range 2 limit

        last =
            limit
                |> toFloat
                |> sqrt
                |> round

        isMultiple n m =
            n /= m && modBy m n == 0
    in
    List.range 2 last
        |> List.foldl
            (\current result ->
                List.filter
                    (\elem -> not (isMultiple elem current))
                    result
            )
            numbers


viewPrime : Int -> Html Msg
viewPrime limit =
    text
        ("There are "
            ++ String.fromInt (sieve limit |> List.length)
            ++ " prime numbers between between 2 and "
            ++ String.fromInt limit
        )


{-| Ideally we can do

    HtmlData.Lazy.lazy viewPrime 200000

But..

> Html.Lazy needs to associate the cached value with a precise function, but specifying an anonymous function forces the runtime to recreate that function every time the view is invoked.
> <https://juliu.is/performant-elm-html-lazy/>

So we have to declare a pre-composed version of the function that returns `Html.Html msg`, outside of the view function, then pass it in as 2nd argument

    viewPrime_elmhtml =
        viewPrime >> HtmlData.Extra.toElmHtml

    HtmlData.Lazy.lazy viewPrime_elmhtml viewPrime 200000

The result is that our function signature here isn't 100% identical to Html.Lazy, but it does work in the correct manner.

  - when generating `String`, e.g. through `toTextHtml`, there is no lazy effect; the first argument function is run each time
  - when generating `Html.Html msg`, i.e. through `toElmHtml`, we hand off the 2nd argument to `Html.Lazy`

-}
viewPrime_elmhtml =
    viewPrime >> HtmlData.Extra.toElmHtml
