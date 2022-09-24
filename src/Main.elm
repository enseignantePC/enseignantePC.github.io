module Main exposing (..)

import Assets exposing (a5eChap1, a5eChap2, a6eChap1, a6eChap2, a20221Gen)
import Dict exposing (..)
import Element exposing (download, el, link, none, text)
import Element.Background
import Element.Font


main =
    Element.layout [ Element.Background.color (Element.rgb 0.8 0.8 0.8) ]
        (Element.column
            [ Element.padding 20, Element.width Element.shrink ]
            [ el [ Element.Font.size 20 ]
                (text
                    "Site ressource physique chimie"
                )
            , el [ Element.padding 10 ] none
            , title "2022-23"
            , myrow
                [ mycol [ minititle "STI2D" ]
                , mycol [ minititle "1GEN",chap "chapitre 1", view_ref_tuple_simple a20221Gen]
                ]
            , title "2021-22"
            , myrow
                [ mycol
                    [ minititle "6e"
                    , chap "chapitre 1"
                    , view_ref_tuple_simple a6eChap1
                    , chap "chapitre 2"
                    , view_ref_tuple_simple a6eChap2
                    ]
                , mycol
                    [ minititle "5e"
                    , chap "chapitre 1"
                    , view_ref_tuple_simple a5eChap1
                    , chap "chapitre 2"
                    , view_ref_tuple_simple a5eChap2
                    ]
                ]
            ]
        )


myrow x =
    Element.row [ Element.spacing 50 ] x


mycol x =
    Element.column [ Element.alignTop ] x


minititle x =
    el
        [ Element.Font.size 30
        , Element.centerX
        ]
        (text x)


chap x =
    el
        [ Element.Font.size 25
        , Element.centerX
        ]
        (text x)


title x =
    el [ Element.Font.size 40, Element.centerX ]
        (text
            x
        )


view_ref_tuple_simple : List ( String, String ) -> Element.Element msg
view_ref_tuple_simple list =
    List.map tuple_to_link list |> Element.column [ Element.padding 10 ]


tuple_to_link : ( String, String ) -> Element.Element msg
tuple_to_link tuple =
    download [ Element.Font.color (Element.rgb 0.1 0.1 1) ]
        { url = Tuple.second tuple
        , label = text (Tuple.first tuple)
        }
