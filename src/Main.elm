module Main exposing (..)

import Assets exposing (..)
import Dict exposing (..)
import Element exposing (..)
import Element.Background
import Element.Border as Border
import Element.Font as Font


main =
    Element.layout
        [ width fill
        , height fill
        , scrollbarY
        , Element.Background.color (Element.rgb 0.8 0.8 0.8)
        ]
        (Element.column
            [ width fill
            , height fill
            , Element.padding 20
            , Element.width Element.shrink
            ]
            [ el [ Font.size 20 ]
                (text
                    "Site ressource physique chimie"
                )
            , el [ Element.padding 10 ] none
            , title "2022-23"
            , myrow
                [ mycol
                    [ minititle "STI2D"
                    , chap "chapitre 1"
                    , view_ref_tuple_simple a20221STI2Dchap1
                    , chap "chapitre 2"
                    , view_ref_tuple_simple a20221STI2Dchap2
                    ]
                , mycol
                    [ minititle "1GEN"
                    , chap "chapitre 1"
                    , view_ref_tuple_simple a20221Genchap1
                    ]
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
    Element.row
        [ width fill
        , height fill
        , Element.spacing 60
        ]
        x


mycol x =
    Element.column
        [ Element.alignTop
        , width fill
        , height fill
        , padding 5
        , spacing 5
        , Font.size 16
        , Border.width 2
        , Border.rounded 6
        , Border.color (rgb255 0x72 0x9F 0xCF)
        ]
        x


minititle x =
    el
        [ Font.size 30
        , Element.centerX
        ]
        (text x)


chap x =
    el
        [ Font.size 25
        , Element.centerX
        ]
        (text x)


title x =
    paragraph [ Font.size 40, Element.centerX, width fill, height fill ]
        [ text
            x
        ]


view_ref_tuple_simple : List ( String, String ) -> Element.Element msg
view_ref_tuple_simple list =
    List.map tuple_to_link list |> mycol


tuple_to_link : ( String, String ) -> Element.Element msg
tuple_to_link tuple =
    download [ Font.color (Element.rgb 0.1 0.1 1) ]
        { url = Tuple.second tuple
        , label = text (Tuple.first tuple)
        }
