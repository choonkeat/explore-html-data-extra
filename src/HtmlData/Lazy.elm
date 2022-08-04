module HtmlData.Lazy exposing (lazy, lazy2, lazy3, lazy4, lazy5, lazy6, lazy7, lazy8)

{-| _Almost_ compatible with [Html.Lazy](https://package.elm-lang.org/packages/elm/html/latest/Html-Lazy)

Ideally we can do

    HtmlData.Lazy.lazy viewPrime 200000

But <https://juliu.is/performant-elm-html-lazy/>

> _Html.Lazy needs to associate the cached value with a precise function, but specifying an anonymous function forces the runtime to recreate that function every time the view is invoked._

**So to use `HtmlData.Lazy`, we have to declare a composed version of the function that returns \`Html.Html msg\`, outside of the view function**

    viewPrime_elmhtml =
        viewPrime >> HtmlData.Extra.toElmHtml

Then pass it in as 2nd argument

    HtmlData.Lazy.lazy viewPrime viewPrime_elmhtml 200000

The result is that our function signature here isn't 100% identical to `Html.Lazy`, but it does work in the correctly.

  - when generating `String`, e.g. through `toTextHtml`, there is no lazy effect; the first argument function is run each time
  - when generating `Html.Html msg`, i.e. through `toElmHtml`, we hand off the 2nd argument to `Html.Lazy`

See the prime numbers section on <https://html-data.netlify.app>

@docs lazy, lazy2, lazy3, lazy4, lazy5, lazy6, lazy7, lazy8

-}

import Html
import Html.Lazy
import HtmlData exposing (Html(..))


{-| -}
lazy : (a -> Html msg) -> (a -> Html.Html msg) -> a -> Html msg
lazy fn fnHtml a =
    LazyElement
        (\_ -> fn a)
        (\_ -> Html.Lazy.lazy fnHtml a)


{-| -}
lazy2 : (a -> b -> Html msg) -> (a -> b -> Html.Html msg) -> a -> b -> Html msg
lazy2 fn fnHtml a b =
    LazyElement
        (\fnHtml_ -> fn a b)
        (\_ -> Html.Lazy.lazy2 fnHtml a b)


{-| -}
lazy3 : (a -> b -> c -> Html msg) -> (a -> b -> c -> Html.Html msg) -> a -> b -> c -> Html msg
lazy3 fn fnHtml a b c =
    LazyElement
        (\fnHtml_ -> fn a b c)
        (\_ -> Html.Lazy.lazy3 fnHtml a b c)


{-| -}
lazy4 : (a -> b -> c -> d -> Html msg) -> (a -> b -> c -> d -> Html.Html msg) -> a -> b -> c -> d -> Html msg
lazy4 fn fnHtml a b c d =
    LazyElement
        (\_ -> fn a b c d)
        (\_ -> Html.Lazy.lazy4 fnHtml a b c d)


{-| -}
lazy5 : (a -> b -> c -> d -> e -> Html msg) -> (a -> b -> c -> d -> e -> Html.Html msg) -> a -> b -> c -> d -> e -> Html msg
lazy5 fn fnHtml a b c d e =
    LazyElement
        (\_ -> fn a b c d e)
        (\_ -> Html.Lazy.lazy5 fnHtml a b c d e)


{-| -}
lazy6 : (a -> b -> c -> d -> e -> f -> Html msg) -> (a -> b -> c -> d -> e -> f -> Html.Html msg) -> a -> b -> c -> d -> e -> f -> Html msg
lazy6 fn fnHtml a b c d e f =
    LazyElement
        (\_ -> fn a b c d e f)
        (\_ -> Html.Lazy.lazy6 fnHtml a b c d e f)


{-| -}
lazy7 : (a -> b -> c -> d -> e -> f -> g -> Html msg) -> (a -> b -> c -> d -> e -> f -> g -> Html.Html msg) -> a -> b -> c -> d -> e -> f -> g -> Html msg
lazy7 fn fnHtml a b c d e f g =
    LazyElement
        (\_ -> fn a b c d e f g)
        (\_ -> Html.Lazy.lazy7 fnHtml a b c d e f g)


{-| -}
lazy8 : (a -> b -> c -> d -> e -> f -> g -> h -> Html msg) -> (a -> b -> c -> d -> e -> f -> g -> h -> Html.Html msg) -> a -> b -> c -> d -> e -> f -> g -> h -> Html msg
lazy8 fn fnHtml a b c d e f g h =
    LazyElement
        (\fnHtml_ -> fn a b c d e f g h)
        (\_ -> Html.Lazy.lazy8 fnHtml a b c d e f g h)
