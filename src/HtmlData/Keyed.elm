module HtmlData.Keyed exposing (node, ol, ul)

{-| See documentation of [Html.Keyed](https://package.elm-lang.org/packages/elm/html/latest/Html-Keyed)

@docs node, ol, ul

-}

import HtmlData exposing (Html(..))
import HtmlData.Attributes exposing (Attribute)


{-| -}
node :
    String
    -> List (Attribute msg)
    -> List ( String, Html msg )
    -> Html msg
node name attrs children =
    KeyedElement name attrs children


{-| -}
ol : List (Attribute msg) -> List ( String, Html msg ) -> Html msg
ol =
    KeyedElement "ol"


{-| -}
ul : List (Attribute msg) -> List ( String, Html msg ) -> Html msg
ul =
    KeyedElement "ul"
