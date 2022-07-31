module HtmlData.Attributes exposing
    ( Attribute(..), accept, acceptCharset, accesskey, action, align, alt, attribute, autocomplete, autofocus, autoplay, checked, cite, class, classList, cols, colspan, contenteditable, contextmenu, controls, coords, datetime, default, dir, disabled, download, draggable, dropzone, enctype, for, form, headers, height, hidden, href, hreflang, id, ismap, itemprop, kind, lang, list, loop, manifest, map, max, maxlength, media, method, min, minlength, multiple, name, novalidate, pattern, ping, placeholder, poster, preload, pubdate, readonly, rel, required, reversed, rows, rowspan, sandbox, scope, selected, shape, size, spellcheck, src, srcdoc, srclang, start, step, style, tabindex, target, title, type_, usemap, value, width, wrap
    , EventListener(..)
    )

{-| Types to build values to represent Html

The types are intentionally fully exposed.
The helper functions exists merely to make writing them feel like elm/html et al

<https://package.elm-lang.org/packages/elm/html/latest/Html-Attributes>

@docs Attribute, accept, acceptCharset, accesskey, action, align, alt, attribute, autocomplete, autofocus, autoplay, checked, cite, class, classList, cols, colspan, contenteditable, contextmenu, controls, coords, datetime, default, dir, disabled, download, draggable, dropzone, enctype, for, form, headers, height, hidden, href, hreflang, id, ismap, itemprop, kind, lang, list, loop, manifest, map, max, maxlength, media, method, min, minlength, multiple, name, novalidate, pattern, ping, placeholder, poster, preload, pubdate, readonly, rel, required, reversed, rows, rowspan, sandbox, scope, selected, shape, size, spellcheck, src, srcdoc, srclang, start, step, style, tabindex, target, title, type_, usemap, value, width, wrap

-}

import Json.Decode


{-| We really don't need the type variable `msg` here, but wondering
if this makes swapping out import against existing code more possible
-}
type Attribute msg
    = Attribute String String
    | NoAttribute
    | EventListener (EventListener msg)


type EventListener msg
    = On String (Json.Decode.Decoder msg)
    | OnInput (String -> msg)
    | OnCheck (Bool -> msg)
    | StopPropagationOn String (Json.Decode.Decoder ( msg, Bool ))
    | PreventDefaultOn String (Json.Decode.Decoder ( msg, Bool ))
    | Custom String (Json.Decode.Decoder { message : msg, stopPropagation : Bool, preventDefault : Bool })


{-| see documentation on elm/html
-}
style : String -> String -> Attribute msg
style k v =
    Attribute "style" (k ++ ":" ++ v)


{-| see documentation on elm/html
-}
attribute : String -> String -> Attribute msg
attribute =
    Attribute


{-| see documentation on elm/html
-}
classList : List ( String, Bool ) -> Attribute msg
classList tuples =
    tuples
        |> List.filter Tuple.second
        |> List.map Tuple.first
        |> String.join " "
        |> Attribute "class"


{-| see documentation on elm/html
-}
class : String -> Attribute msg
class =
    Attribute "class"


{-| see documentation on elm/html
-}
map : (a -> msg) -> Attribute a -> Attribute msg
map f attr =
    case attr of
        Attribute k v ->
            Attribute k v

        NoAttribute ->
            NoAttribute

        EventListener l ->
            EventListener (Debug.todo "mapEventListener")


{-| see documentation on elm/html
-}
id : String -> Attribute msg
id =
    Attribute "id"


{-| see documentation on elm/html
-}
title : String -> Attribute msg
title =
    Attribute "title"


{-| see documentation on elm/html
-}
hidden : Bool -> Attribute msg
hidden bool =
    if bool then
        Attribute "hidden" ""

    else
        NoAttribute


{-| see documentation on elm/html
-}
type_ : String -> Attribute msg
type_ =
    Attribute "type"


{-| see documentation on elm/html
-}
value : String -> Attribute msg
value =
    Attribute "value"


{-| see documentation on elm/html
-}
checked : Bool -> Attribute msg
checked bool =
    if bool then
        Attribute "checked" ""

    else
        NoAttribute


{-| see documentation on elm/html
-}
placeholder : String -> Attribute msg
placeholder =
    Attribute "placeholder"


{-| see documentation on elm/html
-}
selected : Bool -> Attribute msg
selected bool =
    if bool then
        Attribute "selected" ""

    else
        NoAttribute


{-| see documentation on elm/html
-}
accept : String -> Attribute msg
accept =
    Attribute "accept"


{-| see documentation on elm/html
-}
acceptCharset : String -> Attribute msg
acceptCharset =
    Attribute "acceptCharset"


{-| see documentation on elm/html
-}
action : String -> Attribute msg
action =
    Attribute "action"


{-| see documentation on elm/html
-}
autocomplete : Bool -> Attribute msg
autocomplete bool =
    if bool then
        Attribute "autocomplete" ""

    else
        NoAttribute


{-| see documentation on elm/html
-}
autofocus : Bool -> Attribute msg
autofocus bool =
    if bool then
        Attribute "autofocus" ""

    else
        NoAttribute


{-| see documentation on elm/html
-}
disabled : Bool -> Attribute msg
disabled bool =
    if bool then
        Attribute "disabled" ""

    else
        NoAttribute


{-| see documentation on elm/html
-}
enctype : String -> Attribute msg
enctype =
    Attribute "enctype"


{-| see documentation on elm/html
-}
list : String -> Attribute msg
list =
    Attribute "list"


{-| see documentation on elm/html
-}
maxlength : Int -> Attribute msg
maxlength i =
    Attribute "maxlength" (String.fromInt i)


{-| see documentation on elm/html
-}
minlength : Int -> Attribute msg
minlength i =
    Attribute "minlength" (String.fromInt i)


{-| see documentation on elm/html
-}
method : String -> Attribute msg
method =
    Attribute "method"


{-| see documentation on elm/html
-}
multiple : Bool -> Attribute msg
multiple bool =
    if bool then
        Attribute "multiple" ""

    else
        NoAttribute


{-| see documentation on elm/html
-}
name : String -> Attribute msg
name =
    Attribute "name"


{-| see documentation on elm/html
-}
novalidate : Bool -> Attribute msg
novalidate bool =
    if bool then
        Attribute "novalidate" ""

    else
        NoAttribute


{-| see documentation on elm/html
-}
pattern : String -> Attribute msg
pattern =
    Attribute "pattern"


{-| see documentation on elm/html
-}
readonly : Bool -> Attribute msg
readonly bool =
    if bool then
        Attribute "readonly" ""

    else
        NoAttribute


{-| see documentation on elm/html
-}
required : Bool -> Attribute msg
required bool =
    if bool then
        Attribute "required" ""

    else
        NoAttribute


{-| see documentation on elm/html
-}
size : Int -> Attribute msg
size i =
    Attribute "size" (String.fromInt i)


{-| see documentation on elm/html
-}
for : String -> Attribute msg
for =
    Attribute "for"


{-| see documentation on elm/html
-}
form : String -> Attribute msg
form =
    Attribute "form"


{-| see documentation on elm/html
-}
max : String -> Attribute msg
max =
    Attribute "max"


{-| see documentation on elm/html
-}
min : String -> Attribute msg
min =
    Attribute "min"


{-| see documentation on elm/html
-}
step : String -> Attribute msg
step =
    Attribute "step"


{-| see documentation on elm/html
-}
cols : Int -> Attribute msg
cols i =
    Attribute "cols" (String.fromInt i)


{-| see documentation on elm/html
-}
rows : Int -> Attribute msg
rows i =
    Attribute "rows" (String.fromInt i)


{-| see documentation on elm/html
-}
wrap : String -> Attribute msg
wrap =
    Attribute "wrap"


{-| see documentation on elm/html
-}
href : String -> Attribute msg
href =
    Attribute "href"


{-| see documentation on elm/html
-}
target : String -> Attribute msg
target =
    Attribute "target"


{-| see documentation on elm/html
-}
download : String -> Attribute msg
download =
    Attribute "download"


{-| see documentation on elm/html
-}
hreflang : String -> Attribute msg
hreflang =
    Attribute "hreflang"


{-| see documentation on elm/html
-}
media : String -> Attribute msg
media =
    Attribute "media"


{-| see documentation on elm/html
-}
ping : String -> Attribute msg
ping =
    Attribute "ping"


{-| see documentation on elm/html
-}
rel : String -> Attribute msg
rel =
    Attribute "rel"


{-| see documentation on elm/html
-}
ismap : Bool -> Attribute msg
ismap bool =
    if bool then
        Attribute "ismap" ""

    else
        NoAttribute


{-| see documentation on elm/html
-}
usemap : String -> Attribute msg
usemap =
    Attribute "usemap"


{-| see documentation on elm/html
-}
shape : String -> Attribute msg
shape =
    Attribute "shape"


{-| see documentation on elm/html
-}
coords : String -> Attribute msg
coords =
    Attribute "coords"


{-| see documentation on elm/html
-}
src : String -> Attribute msg
src =
    Attribute "src"


{-| see documentation on elm/html
-}
height : Int -> Attribute msg
height i =
    Attribute "height" (String.fromInt i)


{-| see documentation on elm/html
-}
width : Int -> Attribute msg
width i =
    Attribute "width" (String.fromInt i)


{-| see documentation on elm/html
-}
alt : String -> Attribute msg
alt =
    Attribute "alt"


{-| see documentation on elm/html
-}
autoplay : Bool -> Attribute msg
autoplay bool =
    if bool then
        Attribute "autoplay" ""

    else
        NoAttribute


{-| see documentation on elm/html
-}
controls : Bool -> Attribute msg
controls bool =
    if bool then
        Attribute "controls" ""

    else
        NoAttribute


{-| see documentation on elm/html
-}
loop : Bool -> Attribute msg
loop bool =
    if bool then
        Attribute "loop" ""

    else
        NoAttribute


{-| see documentation on elm/html
-}
preload : String -> Attribute msg
preload =
    Attribute "preload"


{-| see documentation on elm/html
-}
poster : String -> Attribute msg
poster =
    Attribute "poster"


{-| see documentation on elm/html
-}
default : Bool -> Attribute msg
default bool =
    if bool then
        Attribute "default" ""

    else
        NoAttribute


{-| see documentation on elm/html
-}
kind : String -> Attribute msg
kind =
    Attribute "kind"


{-| see documentation on elm/html
-}
srclang : String -> Attribute msg
srclang =
    Attribute "srclang"


{-| see documentation on elm/html
-}
sandbox : String -> Attribute msg
sandbox =
    Attribute "sandbox"


{-| see documentation on elm/html
-}
srcdoc : String -> Attribute msg
srcdoc =
    Attribute "srcdoc"


{-| see documentation on elm/html
-}
reversed : Bool -> Attribute msg
reversed bool =
    if bool then
        Attribute "reversed" ""

    else
        NoAttribute


{-| see documentation on elm/html
-}
start : Int -> Attribute msg
start i =
    Attribute "start" (String.fromInt i)


{-| see documentation on elm/html
-}
align : String -> Attribute msg
align =
    Attribute "align"


{-| see documentation on elm/html
-}
colspan : Int -> Attribute msg
colspan i =
    Attribute "colspan" (String.fromInt i)


{-| see documentation on elm/html
-}
rowspan : Int -> Attribute msg
rowspan i =
    Attribute "rowspan" (String.fromInt i)


{-| see documentation on elm/html
-}
headers : String -> Attribute msg
headers =
    Attribute "headers"


{-| see documentation on elm/html
-}
scope : String -> Attribute msg
scope =
    Attribute "scope"


{-| see documentation on elm/html
-}
accesskey : Char -> Attribute msg
accesskey c =
    Attribute "accesskey" (String.fromChar c)


{-| see documentation on elm/html
-}
contenteditable : Bool -> Attribute msg
contenteditable bool =
    if bool then
        Attribute "contenteditable" ""

    else
        NoAttribute


{-| see documentation on elm/html
-}
contextmenu : String -> Attribute msg
contextmenu =
    Attribute "contextmenu"


{-| see documentation on elm/html
-}
dir : String -> Attribute msg
dir =
    Attribute "dir"


{-| see documentation on elm/html
-}
draggable : String -> Attribute msg
draggable =
    Attribute "draggable"


{-| see documentation on elm/html
-}
dropzone : String -> Attribute msg
dropzone =
    Attribute "dropzone"


{-| see documentation on elm/html
-}
itemprop : String -> Attribute msg
itemprop =
    Attribute "itemprop"


{-| see documentation on elm/html
-}
lang : String -> Attribute msg
lang =
    Attribute "lang"


{-| see documentation on elm/html
-}
spellcheck : Bool -> Attribute msg
spellcheck bool =
    if bool then
        Attribute "spellcheck" ""

    else
        NoAttribute


{-| see documentation on elm/html
-}
tabindex : Int -> Attribute msg
tabindex i =
    Attribute "tabindex" (String.fromInt i)


{-| see documentation on elm/html
-}
cite : String -> Attribute msg
cite =
    Attribute "cite"


{-| see documentation on elm/html
-}
datetime : String -> Attribute msg
datetime =
    Attribute "datetime"


{-| see documentation on elm/html
-}
pubdate : String -> Attribute msg
pubdate =
    Attribute "pubdate"


{-| see documentation on elm/html
-}
manifest : String -> Attribute msg
manifest =
    Attribute "manifest"
