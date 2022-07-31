module HtmlData exposing (Html(..), text, node, map, div, h1, h2, h3, h4, h5, h6, p, hr, pre, blockquote, span, a, code, em, strong, i, b, u, sub, sup, br, ol, ul, li, dl, dt, dd, img, iframe, canvas, math, form, input, textarea, button, select, option, section, nav, article, aside, header, footer, address, main_, figure, figcaption, table, caption, colgroup, col, tbody, thead, tfoot, tr, td, th, fieldset, legend, label, datalist, optgroup, output, progress, meter, audio, video, source, track, embed, object, param, ins, del, small, cite, dfn, abbr, time, var, samp, kbd, s, q, mark, ruby, rt, rp, bdi, bdo, wbr, details, summary, menuitem, menu)

{-| Types to build values to represent (Html msg)

The types are intentionally fully exposed.
The helper functions exists merely to make writing them feel like elm/html et al

<https://package.elm-lang.org/packages/elm/html/latest/Html>

@docs Html, text, node, map, div, h1, h2, h3, h4, h5, h6, p, hr, pre, blockquote, span, a, code, em, strong, i, b, u, sub, sup, br, ol, ul, li, dl, dt, dd, img, iframe, canvas, math, form, input, textarea, button, select, option, section, nav, article, aside, header, footer, address, main_, figure, figcaption, table, caption, colgroup, col, tbody, thead, tfoot, tr, td, th, fieldset, legend, label, datalist, optgroup, output, progress, meter, audio, video, source, track, embed, object, param, ins, del, small, cite, dfn, abbr, time, var, samp, kbd, s, q, mark, ruby, rt, rp, bdi, bdo, wbr, details, summary, menuitem, menu

-}

import HtmlData.Attributes exposing (Attribute, href)


{-| We really don't need the type variable `msg` here, but wondering
if this makes swapping out import against existing code more possible
-}
type Html msg
    = Text String
    | Element String (List (Attribute msg)) (List (Html msg))


{-| see documentation in elm/html
-}
text : String -> Html msg
text =
    Text


{-| see documentation in elm/html
-}
node : String -> List (Attribute msg) -> List (Html msg) -> Html msg
node =
    Element


{-| see documentation in elm/html
-}
map : (a -> msg) -> Html a -> Html msg
map f htmlnode =
    case htmlnode of
        Text string ->
            Text string

        Element string attrs children ->
            Element string (List.map (HtmlData.Attributes.map f) attrs) (List.map (map f) children)


{-| see documentation in elm/html
-}
div : List (Attribute msg) -> List (Html msg) -> Html msg
div =
    Element "div"


{-| see documentation in elm/html
-}
h1 : List (Attribute msg) -> List (Html msg) -> Html msg
h1 =
    Element "h1"


{-| see documentation in elm/html
-}
h2 : List (Attribute msg) -> List (Html msg) -> Html msg
h2 =
    Element "h2"


{-| see documentation in elm/html
-}
h3 : List (Attribute msg) -> List (Html msg) -> Html msg
h3 =
    Element "h3"


{-| see documentation in elm/html
-}
h4 : List (Attribute msg) -> List (Html msg) -> Html msg
h4 =
    Element "h4"


{-| see documentation in elm/html
-}
h5 : List (Attribute msg) -> List (Html msg) -> Html msg
h5 =
    Element "h5"


{-| see documentation in elm/html
-}
h6 : List (Attribute msg) -> List (Html msg) -> Html msg
h6 =
    Element "h6"


{-| see documentation in elm/html
-}
p : List (Attribute msg) -> List (Html msg) -> Html msg
p =
    Element "p"


{-| see documentation in elm/html
-}
hr : List (Attribute msg) -> List (Html msg) -> Html msg
hr =
    Element "hr"


{-| see documentation in elm/html
-}
pre : List (Attribute msg) -> List (Html msg) -> Html msg
pre =
    Element "pre"


{-| see documentation in elm/html
-}
blockquote : List (Attribute msg) -> List (Html msg) -> Html msg
blockquote =
    Element "blockquote"


{-| see documentation in elm/html
-}
span : List (Attribute msg) -> List (Html msg) -> Html msg
span =
    Element "span"


{-| see documentation in elm/html
-}
a : List (Attribute msg) -> List (Html msg) -> Html msg
a =
    Element "a"


{-| see documentation in elm/html
-}
code : List (Attribute msg) -> List (Html msg) -> Html msg
code =
    Element "code"


{-| see documentation in elm/html
-}
em : List (Attribute msg) -> List (Html msg) -> Html msg
em =
    Element "em"


{-| see documentation in elm/html
-}
strong : List (Attribute msg) -> List (Html msg) -> Html msg
strong =
    Element "strong"


{-| see documentation in elm/html
-}
i : List (Attribute msg) -> List (Html msg) -> Html msg
i =
    Element "i"


{-| see documentation in elm/html
-}
b : List (Attribute msg) -> List (Html msg) -> Html msg
b =
    Element "b"


{-| see documentation in elm/html
-}
u : List (Attribute msg) -> List (Html msg) -> Html msg
u =
    Element "u"


{-| see documentation in elm/html
-}
sub : List (Attribute msg) -> List (Html msg) -> Html msg
sub =
    Element "sub"


{-| see documentation in elm/html
-}
sup : List (Attribute msg) -> List (Html msg) -> Html msg
sup =
    Element "sup"


{-| see documentation in elm/html
-}
br : List (Attribute msg) -> List (Html msg) -> Html msg
br =
    Element "br"


{-| see documentation in elm/html
-}
ol : List (Attribute msg) -> List (Html msg) -> Html msg
ol =
    Element "ol"


{-| see documentation in elm/html
-}
ul : List (Attribute msg) -> List (Html msg) -> Html msg
ul =
    Element "ul"


{-| see documentation in elm/html
-}
li : List (Attribute msg) -> List (Html msg) -> Html msg
li =
    Element "li"


{-| see documentation in elm/html
-}
dl : List (Attribute msg) -> List (Html msg) -> Html msg
dl =
    Element "dl"


{-| see documentation in elm/html
-}
dt : List (Attribute msg) -> List (Html msg) -> Html msg
dt =
    Element "dt"


{-| see documentation in elm/html
-}
dd : List (Attribute msg) -> List (Html msg) -> Html msg
dd =
    Element "dd"


{-| see documentation in elm/html
-}
img : List (Attribute msg) -> List (Html msg) -> Html msg
img =
    Element "img"


{-| see documentation in elm/html
-}
iframe : List (Attribute msg) -> List (Html msg) -> Html msg
iframe =
    Element "iframe"


{-| see documentation in elm/html
-}
canvas : List (Attribute msg) -> List (Html msg) -> Html msg
canvas =
    Element "canvas"


{-| see documentation in elm/html
-}
math : List (Attribute msg) -> List (Html msg) -> Html msg
math =
    Element "math"


{-| see documentation in elm/html
-}
form : List (Attribute msg) -> List (Html msg) -> Html msg
form =
    Element "form"


{-| see documentation in elm/html
-}
input : List (Attribute msg) -> List (Html msg) -> Html msg
input =
    Element "input"


{-| see documentation in elm/html
-}
textarea : List (Attribute msg) -> List (Html msg) -> Html msg
textarea =
    Element "textarea"


{-| see documentation in elm/html
-}
button : List (Attribute msg) -> List (Html msg) -> Html msg
button =
    Element "button"


{-| see documentation in elm/html
-}
select : List (Attribute msg) -> List (Html msg) -> Html msg
select =
    Element "select"


{-| see documentation in elm/html
-}
option : List (Attribute msg) -> List (Html msg) -> Html msg
option =
    Element "option"


{-| see documentation in elm/html
-}
section : List (Attribute msg) -> List (Html msg) -> Html msg
section =
    Element "section"


{-| see documentation in elm/html
-}
nav : List (Attribute msg) -> List (Html msg) -> Html msg
nav =
    Element "nav"


{-| see documentation in elm/html
-}
article : List (Attribute msg) -> List (Html msg) -> Html msg
article =
    Element "article"


{-| see documentation in elm/html
-}
aside : List (Attribute msg) -> List (Html msg) -> Html msg
aside =
    Element "aside"


{-| see documentation in elm/html
-}
header : List (Attribute msg) -> List (Html msg) -> Html msg
header =
    Element "header"


{-| see documentation in elm/html
-}
footer : List (Attribute msg) -> List (Html msg) -> Html msg
footer =
    Element "footer"


{-| see documentation in elm/html
-}
address : List (Attribute msg) -> List (Html msg) -> Html msg
address =
    Element "address"


{-| see documentation in elm/html
-}
main_ : List (Attribute msg) -> List (Html msg) -> Html msg
main_ =
    Element "main_"


{-| see documentation in elm/html
-}
figure : List (Attribute msg) -> List (Html msg) -> Html msg
figure =
    Element "figure"


{-| see documentation in elm/html
-}
figcaption : List (Attribute msg) -> List (Html msg) -> Html msg
figcaption =
    Element "figcaption"


{-| see documentation in elm/html
-}
table : List (Attribute msg) -> List (Html msg) -> Html msg
table =
    Element "table"


{-| see documentation in elm/html
-}
caption : List (Attribute msg) -> List (Html msg) -> Html msg
caption =
    Element "caption"


{-| see documentation in elm/html
-}
colgroup : List (Attribute msg) -> List (Html msg) -> Html msg
colgroup =
    Element "colgroup"


{-| see documentation in elm/html
-}
col : List (Attribute msg) -> List (Html msg) -> Html msg
col =
    Element "col"


{-| see documentation in elm/html
-}
tbody : List (Attribute msg) -> List (Html msg) -> Html msg
tbody =
    Element "tbody"


{-| see documentation in elm/html
-}
thead : List (Attribute msg) -> List (Html msg) -> Html msg
thead =
    Element "thead"


{-| see documentation in elm/html
-}
tfoot : List (Attribute msg) -> List (Html msg) -> Html msg
tfoot =
    Element "tfoot"


{-| see documentation in elm/html
-}
tr : List (Attribute msg) -> List (Html msg) -> Html msg
tr =
    Element "tr"


{-| see documentation in elm/html
-}
td : List (Attribute msg) -> List (Html msg) -> Html msg
td =
    Element "td"


{-| see documentation in elm/html
-}
th : List (Attribute msg) -> List (Html msg) -> Html msg
th =
    Element "th"


{-| see documentation in elm/html
-}
fieldset : List (Attribute msg) -> List (Html msg) -> Html msg
fieldset =
    Element "fieldset"


{-| see documentation in elm/html
-}
legend : List (Attribute msg) -> List (Html msg) -> Html msg
legend =
    Element "legend"


{-| see documentation in elm/html
-}
label : List (Attribute msg) -> List (Html msg) -> Html msg
label =
    Element "label"


{-| see documentation in elm/html
-}
datalist : List (Attribute msg) -> List (Html msg) -> Html msg
datalist =
    Element "datalist"


{-| see documentation in elm/html
-}
optgroup : List (Attribute msg) -> List (Html msg) -> Html msg
optgroup =
    Element "optgroup"


{-| see documentation in elm/html
-}
output : List (Attribute msg) -> List (Html msg) -> Html msg
output =
    Element "output"


{-| see documentation in elm/html
-}
progress : List (Attribute msg) -> List (Html msg) -> Html msg
progress =
    Element "progress"


{-| see documentation in elm/html
-}
meter : List (Attribute msg) -> List (Html msg) -> Html msg
meter =
    Element "meter"


{-| see documentation in elm/html
-}
audio : List (Attribute msg) -> List (Html msg) -> Html msg
audio =
    Element "audio"


{-| see documentation in elm/html
-}
video : List (Attribute msg) -> List (Html msg) -> Html msg
video =
    Element "video"


{-| see documentation in elm/html
-}
source : List (Attribute msg) -> List (Html msg) -> Html msg
source =
    Element "source"


{-| see documentation in elm/html
-}
track : List (Attribute msg) -> List (Html msg) -> Html msg
track =
    Element "track"


{-| see documentation in elm/html
-}
embed : List (Attribute msg) -> List (Html msg) -> Html msg
embed =
    Element "embed"


{-| see documentation in elm/html
-}
object : List (Attribute msg) -> List (Html msg) -> Html msg
object =
    Element "object"


{-| see documentation in elm/html
-}
param : List (Attribute msg) -> List (Html msg) -> Html msg
param =
    Element "param"


{-| see documentation in elm/html
-}
ins : List (Attribute msg) -> List (Html msg) -> Html msg
ins =
    Element "ins"


{-| see documentation in elm/html
-}
del : List (Attribute msg) -> List (Html msg) -> Html msg
del =
    Element "del"


{-| see documentation in elm/html
-}
small : List (Attribute msg) -> List (Html msg) -> Html msg
small =
    Element "small"


{-| see documentation in elm/html
-}
cite : List (Attribute msg) -> List (Html msg) -> Html msg
cite =
    Element "cite"


{-| see documentation in elm/html
-}
dfn : List (Attribute msg) -> List (Html msg) -> Html msg
dfn =
    Element "dfn"


{-| see documentation in elm/html
-}
abbr : List (Attribute msg) -> List (Html msg) -> Html msg
abbr =
    Element "abbr"


{-| see documentation in elm/html
-}
time : List (Attribute msg) -> List (Html msg) -> Html msg
time =
    Element "time"


{-| see documentation in elm/html
-}
var : List (Attribute msg) -> List (Html msg) -> Html msg
var =
    Element "var"


{-| see documentation in elm/html
-}
samp : List (Attribute msg) -> List (Html msg) -> Html msg
samp =
    Element "samp"


{-| see documentation in elm/html
-}
kbd : List (Attribute msg) -> List (Html msg) -> Html msg
kbd =
    Element "kbd"


{-| see documentation in elm/html
-}
s : List (Attribute msg) -> List (Html msg) -> Html msg
s =
    Element "s"


{-| see documentation in elm/html
-}
q : List (Attribute msg) -> List (Html msg) -> Html msg
q =
    Element "q"


{-| see documentation in elm/html
-}
mark : List (Attribute msg) -> List (Html msg) -> Html msg
mark =
    Element "mark"


{-| see documentation in elm/html
-}
ruby : List (Attribute msg) -> List (Html msg) -> Html msg
ruby =
    Element "ruby"


{-| see documentation in elm/html
-}
rt : List (Attribute msg) -> List (Html msg) -> Html msg
rt =
    Element "rt"


{-| see documentation in elm/html
-}
rp : List (Attribute msg) -> List (Html msg) -> Html msg
rp =
    Element "rp"


{-| see documentation in elm/html
-}
bdi : List (Attribute msg) -> List (Html msg) -> Html msg
bdi =
    Element "bdi"


{-| see documentation in elm/html
-}
bdo : List (Attribute msg) -> List (Html msg) -> Html msg
bdo =
    Element "bdo"


{-| see documentation in elm/html
-}
wbr : List (Attribute msg) -> List (Html msg) -> Html msg
wbr =
    Element "wbr"


{-| see documentation in elm/html
-}
details : List (Attribute msg) -> List (Html msg) -> Html msg
details =
    Element "details"


{-| see documentation in elm/html
-}
summary : List (Attribute msg) -> List (Html msg) -> Html msg
summary =
    Element "summary"


{-| see documentation in elm/html
-}
menuitem : List (Attribute msg) -> List (Html msg) -> Html msg
menuitem =
    Element "menuitem"


{-| see documentation in elm/html
-}
menu : List (Attribute msg) -> List (Html msg) -> Html msg
menu =
    Element "menu"
