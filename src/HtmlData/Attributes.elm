module HtmlData.Attributes exposing (Attribute(..), EventListener(..), accept, acceptCharset, accesskey, action, align, alt, attribute, autocomplete, autofocus, autoplay, checked, cite, class, classList, cols, colspan, contenteditable, contextmenu, controls, coords, datetime, default, dir, disabled, download, draggable, dropzone, enctype, for, form, headers, height, hidden, href, hreflang, id, ismap, itemprop, kind, lang, list, loop, manifest, map, max, maxlength, media, method, min, minlength, multiple, name, novalidate, pattern, ping, placeholder, poster, preload, pubdate, readonly, rel, required, reversed, rows, rowspan, sandbox, scope, selected, shape, size, spellcheck, src, srcdoc, srclang, start, step, style, tabindex, target, title, type_, usemap, value, width, wrap)

{-| Types to build values to represent Html

The types are intentionally fully exposed.
The helper functions exists merely to make writing them feel like elm/html et al

<https://package.elm-lang.org/packages/elm/html/latest/Html-Attributes>

@docs Attribute, EventListener, accept, acceptCharset, accesskey, action, align, alt, attribute, autocomplete, autofocus, autoplay, checked, cite, class, classList, cols, colspan, contenteditable, contextmenu, controls, coords, datetime, default, dir, disabled, download, draggable, dropzone, enctype, for, form, headers, height, hidden, href, hreflang, id, ismap, itemprop, kind, lang, list, loop, manifest, map, max, maxlength, media, method, min, minlength, multiple, name, novalidate, pattern, ping, placeholder, poster, preload, pubdate, readonly, rel, required, reversed, rows, rowspan, sandbox, scope, selected, shape, size, spellcheck, src, srcdoc, srclang, start, step, style, tabindex, target, title, type_, usemap, value, width, wrap

-}

import Json.Decode


{-| We really don't need the type variable `msg` here, but wondering
if this makes swapping out import against existing code more possible
-}
type Attribute msg
    = Attribute String String
    | NoAttribute
    | EventListener (EventListener msg)


{-| Stores declarations for [Html.Events](https://package.elm-lang.org/packages/elm/html/latest/Html-Events)
-}
type EventListener msg
    = On String (Json.Decode.Decoder msg)
    | OnInput (String -> msg)
    | OnCheck (Bool -> msg)
    | StopPropagationOn String (Json.Decode.Decoder ( msg, Bool ))
    | PreventDefaultOn String (Json.Decode.Decoder ( msg, Bool ))
    | Custom String (Json.Decode.Decoder { message : msg, stopPropagation : Bool, preventDefault : Bool })


{-| See documentation on elm/html
-}
style : String -> String -> Attribute msg
style k v =
    Attribute "style" (k ++ ":" ++ v)


{-| See documentation on elm/html
-}
attribute : String -> String -> Attribute msg
attribute =
    Attribute


{-| See documentation on elm/html
-}
classList : List ( String, Bool ) -> Attribute msg
classList tuples =
    tuples
        |> List.filter Tuple.second
        |> List.map Tuple.first
        |> String.join " "
        |> Attribute "class"


{-| See documentation on elm/html
-}
class : String -> Attribute msg
class =
    Attribute "class"


{-| See documentation on elm/html
-}
map : (a -> msg) -> Attribute a -> Attribute msg
map f attr =
    case attr of
        Attribute k v ->
            Attribute k v

        NoAttribute ->
            NoAttribute

        EventListener l ->
            EventListener (mapEventListener f l)


mapEventListener : (a -> b) -> EventListener a -> EventListener b
mapEventListener f listener =
    case listener of
        On s d ->
            On s (Json.Decode.map f d)

        OnInput msg ->
            OnInput (msg >> f)

        OnCheck msg ->
            OnCheck (msg >> f)

        StopPropagationOn s d ->
            StopPropagationOn s (Json.Decode.map (Tuple.mapFirst f) d)

        PreventDefaultOn s d ->
            PreventDefaultOn s (Json.Decode.map (Tuple.mapFirst f) d)

        Custom s d ->
            Custom s
                (Json.Decode.map
                    (\a ->
                        { message = f a.message
                        , stopPropagation = a.stopPropagation
                        , preventDefault = a.preventDefault
                        }
                    )
                    d
                )


{-| See documentation on elm/html
-}
id : String -> Attribute msg
id =
    Attribute "id"


{-| See documentation on elm/html
-}
title : String -> Attribute msg
title =
    Attribute "title"


{-| See documentation on elm/html
-}
hidden : Bool -> Attribute msg
hidden bool =
    if bool then
        Attribute "hidden" ""

    else
        NoAttribute


{-| See documentation on elm/html
-}
type_ : String -> Attribute msg
type_ =
    Attribute "type"


{-| See documentation on elm/html
-}
value : String -> Attribute msg
value =
    Attribute "value"


{-| See documentation on elm/html
-}
checked : Bool -> Attribute msg
checked bool =
    if bool then
        Attribute "checked" ""

    else
        NoAttribute


{-| See documentation on elm/html
-}
placeholder : String -> Attribute msg
placeholder =
    Attribute "placeholder"


{-| See documentation on elm/html
-}
selected : Bool -> Attribute msg
selected bool =
    if bool then
        Attribute "selected" ""

    else
        NoAttribute


{-| See documentation on elm/html
-}
accept : String -> Attribute msg
accept =
    Attribute "accept"


{-| See documentation on elm/html
-}
acceptCharset : String -> Attribute msg
acceptCharset =
    Attribute "acceptCharset"


{-| See documentation on elm/html
-}
action : String -> Attribute msg
action =
    Attribute "action"


{-| See documentation on elm/html
-}
autocomplete : Bool -> Attribute msg
autocomplete bool =
    if bool then
        Attribute "autocomplete" ""

    else
        NoAttribute


{-| See documentation on elm/html
-}
autofocus : Bool -> Attribute msg
autofocus bool =
    if bool then
        Attribute "autofocus" ""

    else
        NoAttribute


{-| See documentation on elm/html
-}
disabled : Bool -> Attribute msg
disabled bool =
    if bool then
        Attribute "disabled" ""

    else
        NoAttribute


{-| See documentation on elm/html
-}
enctype : String -> Attribute msg
enctype =
    Attribute "enctype"


{-| See documentation on elm/html
-}
list : String -> Attribute msg
list =
    Attribute "list"


{-| See documentation on elm/html
-}
maxlength : Int -> Attribute msg
maxlength i =
    Attribute "maxlength" (String.fromInt i)


{-| See documentation on elm/html
-}
minlength : Int -> Attribute msg
minlength i =
    Attribute "minlength" (String.fromInt i)


{-| See documentation on elm/html
-}
method : String -> Attribute msg
method =
    Attribute "method"


{-| See documentation on elm/html
-}
multiple : Bool -> Attribute msg
multiple bool =
    if bool then
        Attribute "multiple" ""

    else
        NoAttribute


{-| See documentation on elm/html
-}
name : String -> Attribute msg
name =
    Attribute "name"


{-| See documentation on elm/html
-}
novalidate : Bool -> Attribute msg
novalidate bool =
    if bool then
        Attribute "novalidate" ""

    else
        NoAttribute


{-| See documentation on elm/html
-}
pattern : String -> Attribute msg
pattern =
    Attribute "pattern"


{-| See documentation on elm/html
-}
readonly : Bool -> Attribute msg
readonly bool =
    if bool then
        Attribute "readonly" ""

    else
        NoAttribute


{-| See documentation on elm/html
-}
required : Bool -> Attribute msg
required bool =
    if bool then
        Attribute "required" ""

    else
        NoAttribute


{-| See documentation on elm/html
-}
size : Int -> Attribute msg
size i =
    Attribute "size" (String.fromInt i)


{-| See documentation on elm/html
-}
for : String -> Attribute msg
for =
    Attribute "for"


{-| See documentation on elm/html
-}
form : String -> Attribute msg
form =
    Attribute "form"


{-| See documentation on elm/html
-}
max : String -> Attribute msg
max =
    Attribute "max"


{-| See documentation on elm/html
-}
min : String -> Attribute msg
min =
    Attribute "min"


{-| See documentation on elm/html
-}
step : String -> Attribute msg
step =
    Attribute "step"


{-| See documentation on elm/html
-}
cols : Int -> Attribute msg
cols i =
    Attribute "cols" (String.fromInt i)


{-| See documentation on elm/html
-}
rows : Int -> Attribute msg
rows i =
    Attribute "rows" (String.fromInt i)


{-| See documentation on elm/html
-}
wrap : String -> Attribute msg
wrap =
    Attribute "wrap"


{-| See documentation on elm/html
-}
href : String -> Attribute msg
href =
    Attribute "href"


{-| See documentation on elm/html
-}
target : String -> Attribute msg
target =
    Attribute "target"


{-| See documentation on elm/html
-}
download : String -> Attribute msg
download =
    Attribute "download"


{-| See documentation on elm/html
-}
hreflang : String -> Attribute msg
hreflang =
    Attribute "hreflang"


{-| See documentation on elm/html
-}
media : String -> Attribute msg
media =
    Attribute "media"


{-| See documentation on elm/html
-}
ping : String -> Attribute msg
ping =
    Attribute "ping"


{-| See documentation on elm/html
-}
rel : String -> Attribute msg
rel =
    Attribute "rel"


{-| See documentation on elm/html
-}
ismap : Bool -> Attribute msg
ismap bool =
    if bool then
        Attribute "ismap" ""

    else
        NoAttribute


{-| See documentation on elm/html
-}
usemap : String -> Attribute msg
usemap =
    Attribute "usemap"


{-| See documentation on elm/html
-}
shape : String -> Attribute msg
shape =
    Attribute "shape"


{-| See documentation on elm/html
-}
coords : String -> Attribute msg
coords =
    Attribute "coords"


{-| See documentation on elm/html
-}
src : String -> Attribute msg
src =
    Attribute "src"


{-| See documentation on elm/html
-}
height : Int -> Attribute msg
height i =
    Attribute "height" (String.fromInt i)


{-| See documentation on elm/html
-}
width : Int -> Attribute msg
width i =
    Attribute "width" (String.fromInt i)


{-| See documentation on elm/html
-}
alt : String -> Attribute msg
alt =
    Attribute "alt"


{-| See documentation on elm/html
-}
autoplay : Bool -> Attribute msg
autoplay bool =
    if bool then
        Attribute "autoplay" ""

    else
        NoAttribute


{-| See documentation on elm/html
-}
controls : Bool -> Attribute msg
controls bool =
    if bool then
        Attribute "controls" ""

    else
        NoAttribute


{-| See documentation on elm/html
-}
loop : Bool -> Attribute msg
loop bool =
    if bool then
        Attribute "loop" ""

    else
        NoAttribute


{-| See documentation on elm/html
-}
preload : String -> Attribute msg
preload =
    Attribute "preload"


{-| See documentation on elm/html
-}
poster : String -> Attribute msg
poster =
    Attribute "poster"


{-| See documentation on elm/html
-}
default : Bool -> Attribute msg
default bool =
    if bool then
        Attribute "default" ""

    else
        NoAttribute


{-| See documentation on elm/html
-}
kind : String -> Attribute msg
kind =
    Attribute "kind"


{-| See documentation on elm/html
-}
srclang : String -> Attribute msg
srclang =
    Attribute "srclang"


{-| See documentation on elm/html
-}
sandbox : String -> Attribute msg
sandbox =
    Attribute "sandbox"


{-| See documentation on elm/html
-}
srcdoc : String -> Attribute msg
srcdoc =
    Attribute "srcdoc"


{-| See documentation on elm/html
-}
reversed : Bool -> Attribute msg
reversed bool =
    if bool then
        Attribute "reversed" ""

    else
        NoAttribute


{-| See documentation on elm/html
-}
start : Int -> Attribute msg
start i =
    Attribute "start" (String.fromInt i)


{-| See documentation on elm/html
-}
align : String -> Attribute msg
align =
    Attribute "align"


{-| See documentation on elm/html
-}
colspan : Int -> Attribute msg
colspan i =
    Attribute "colspan" (String.fromInt i)


{-| See documentation on elm/html
-}
rowspan : Int -> Attribute msg
rowspan i =
    Attribute "rowspan" (String.fromInt i)


{-| See documentation on elm/html
-}
headers : String -> Attribute msg
headers =
    Attribute "headers"


{-| See documentation on elm/html
-}
scope : String -> Attribute msg
scope =
    Attribute "scope"


{-| See documentation on elm/html
-}
accesskey : Char -> Attribute msg
accesskey c =
    Attribute "accesskey" (String.fromChar c)


{-| See documentation on elm/html
-}
contenteditable : Bool -> Attribute msg
contenteditable bool =
    if bool then
        Attribute "contenteditable" ""

    else
        NoAttribute


{-| See documentation on elm/html
-}
contextmenu : String -> Attribute msg
contextmenu =
    Attribute "contextmenu"


{-| See documentation on elm/html
-}
dir : String -> Attribute msg
dir =
    Attribute "dir"


{-| See documentation on elm/html
-}
draggable : String -> Attribute msg
draggable =
    Attribute "draggable"


{-| See documentation on elm/html
-}
dropzone : String -> Attribute msg
dropzone =
    Attribute "dropzone"


{-| See documentation on elm/html
-}
itemprop : String -> Attribute msg
itemprop =
    Attribute "itemprop"


{-| See documentation on elm/html
-}
lang : String -> Attribute msg
lang =
    Attribute "lang"


{-| See documentation on elm/html
-}
spellcheck : Bool -> Attribute msg
spellcheck bool =
    if bool then
        Attribute "spellcheck" ""

    else
        NoAttribute


{-| See documentation on elm/html
-}
tabindex : Int -> Attribute msg
tabindex i =
    Attribute "tabindex" (String.fromInt i)


{-| See documentation on elm/html
-}
cite : String -> Attribute msg
cite =
    Attribute "cite"


{-| See documentation on elm/html
-}
datetime : String -> Attribute msg
datetime =
    Attribute "datetime"


{-| See documentation on elm/html
-}
pubdate : String -> Attribute msg
pubdate =
    Attribute "pubdate"


{-| See documentation on elm/html
-}
manifest : String -> Attribute msg
manifest =
    Attribute "manifest"
