module Main exposing (..)

import Assets exposing (a5eChap1, a5eChap2, a6eChap1, a6eChap2)
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
                    ("Bienvenue sur le site de physique chimie, vous pouvez y télécharger "
                        ++ "les activités faites en classe (et autre contenu dans un futur proche (ou lointain))."
                    )
                )
            , el [ Element.padding 10 ] none
            , Element.row [ Element.spacing 50 ]
                [ Element.column [ Element.alignTop ]
                    [ --  el [ Element.padding 10 ] none,
                      el
                        [ Element.Font.size 30
                        , Element.centerX
                        ]
                        (text "6e")
                    , el
                        [ Element.Font.size 25
                        , Element.centerX
                        ]
                        (text "chapitre 1")
                    , view_ref_tuple_simple a6eChap1
                    , el
                        [ Element.Font.size 25
                        , Element.centerX
                        ]
                        (text "chapitre 2")
                    , view_ref_tuple_simple a6eChap2
                    ]
                , Element.column [ Element.alignTop ]
                    [ -- el [ Element.padding 10 ] none,
                      el
                        [ Element.Font.size 30
                        , Element.centerX
                        ]
                        (text "5e")
                    , el
                        [ Element.Font.size 25
                        , Element.centerX
                        ]
                        (text "chapitre 1")
                    , view_ref_tuple_simple a5eChap1
                    , el
                        [ Element.Font.size 25
                        , Element.centerX
                        ]
                        (text "chapitre 2")
                    , view_ref_tuple_simple a5eChap2
                    ]
                ]
            ]
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
