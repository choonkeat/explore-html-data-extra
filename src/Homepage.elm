module Homepage exposing (..)

{-| Note we're using Html and Html.Attributes here
-}

import Html exposing (..)
import Html.Attributes exposing (..)
import HtmlData
import HtmlData.Extra


{-| This is a demo function to render the same `HtmlData.Html msg` node as

1.  as interactive element
2.  as html String
3.  as plain text String

-}
demo : HtmlData.Html msg -> (model -> HtmlData.Html msg) -> model -> Html msg
demo lazyElement originalView model =
    let
        renderedNode =
            originalView model

        layout =
            div
                [ style "max-width" "1000px"
                , style "margin" "0 auto 0 auto"
                , style "padding" "0.5em 0.5em"
                ]

        sectionTitle s =
            p [] [ text s ]
    in
    layout
        [ node "style"
            []
            [ text """
            code {
                white-space: nowrap;
                background-color: #dddddd;
                padding: 0.2em 0.5em;
            }
            pre {
                white-space: pre-wrap;
                background-color: #dddddd;
                padding: 1em;
                word-break: break-word;
            }

            .container {
                display: flex;
                flex-wrap: wrap;
            }
            .container > li {
                max-width: 300px;
                list-style: none;
                padding-right: 1em;
            }
            """
            ]
        , div []
            [ text "Given "
            , a
                [ href "https://github.com/choonkeat/explore-html-data-extra/blob/4f2d6597c682b56351a4d02432eb61ea8eda625e/src/Main.elm#L36"
                ]
                [ code [] [ text "view" ]
                ]
            , text " is a "
            , a
                [ href "https://package.elm-lang.org/packages/choonkeat/html-data/latest/HtmlData#Html"
                ]
                [ code [] [ text "HtmlData.Html msg" ]
                ]
            ]
        , ol
            [ class "container" ]
            [ li [ style "margin-top" "2em" ]
                [ a
                    [ href "https://package.elm-lang.org/packages/choonkeat/html-data-extra/latest/HtmlData-Extra#toElmHtml"
                    ]
                    [ code [] [ text "toElmHtml view" ] ]
                , text " returns "
                , a
                    [ href "https://package.elm-lang.org/packages/elm/html/latest/Html#Html"
                    ]
                    [ code [] [ text "Html msg" ]
                    ]
                , text " a regular elm/html value. It's interactive, like normal, able to update our "
                , code [] [ text "Model" ]
                , div
                    [ style "margin-top" "2em"
                    , style "border" "0.5px dashed black"
                    , style "padding" "1em"
                    ]
                    [ HtmlData.Extra.toElmHtml renderedNode
                    ]
                ]
            , li [ style "margin-top" "2em" ]
                [ a
                    [ href "https://package.elm-lang.org/packages/choonkeat/html-data-extra/latest/HtmlData-Extra#toTextHtml"
                    ]
                    [ code [] [ text "toTextHtml view" ] ]
                , text " returns "
                , code [] [ text "String" ]
                , text " html value; useful for server side rendering."
                , pre []
                    [ text
                        (HtmlData.Extra.toTextHtml renderedNode)
                    ]
                ]
            , li [ style "margin-top" "2em" ]
                [ a
                    [ href "https://package.elm-lang.org/packages/choonkeat/html-data-extra/latest/HtmlData-Extra#toTextPlain"
                    ]
                    [ code [] [ text "toTextPlain view" ] ]
                , text " returns "
                , code [] [ text "String" ]
                , text " plain text with a textual layout that mimics html;"
                , text " useful for text/plain emails or console output!"
                , pre []
                    [ text
                        (HtmlData.Extra.toTextPlain HtmlData.Extra.defaultTextPlainConfig renderedNode)
                    ]
                ]
            ]
        , h2 [] [ text "HtmlData.Lazy" ]
        , div [] [ HtmlData.Extra.toElmHtml lazyElement ]
        , p []
            [ a [ href "https://github.com/choonkeat/explore-html-data-extra" ] [ text "github.com/choonkeat/explore-html-data-extra" ]
            ]
        ]
