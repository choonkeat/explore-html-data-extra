module HtmlData.Keyed exposing (node, ol, ul)

{-|

@docs node, ol, ul

-}

import HtmlData exposing (Html(..))
import HtmlData.Attributes exposing (Attribute)


{-| See documentation on elm/html
-}
node :
    String
    -> List (Attribute msg)
    -> List ( String, Html msg )
    -> Html msg
node name attrs children =
    KeyedElement name attrs children


{-| See documentation on elm/html
-}
ol : List (Attribute msg) -> List ( String, Html msg ) -> Html msg
ol =
    KeyedElement "ol"


{-| See documentation on elm/html
-}
ul : List (Attribute msg) -> List ( String, Html msg ) -> Html msg
ul =
    KeyedElement "ul"
