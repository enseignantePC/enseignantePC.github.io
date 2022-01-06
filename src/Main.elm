module Main exposing (..)

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
                    , view_ref_tuple_simple activite6echap1
                    , el
                        [ Element.Font.size 25
                        , Element.centerX
                        ]
                        (text "chapitre 2")
                    , view_ref_tuple_simple activite6echap2
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
                    , view_ref_tuple_simple activite5echap1
                    , el
                        [ Element.Font.size 25
                        , Element.centerX
                        ]
                        (text "chapitre 2")
                    , view_ref_tuple_simple activite5echap2
                    ]
                ]
            ]
        )


activite5echap1 =
    [ ( "activité 1", "./assets/5e/chap1/activités/activité1/act1.pdf" )
    , ( "activité 2", "./assets/5e/chap1/activités/activité2/act2.pdf" )
    , ( "activité 3", "./assets/5e/chap1/activités/activité3/act3.pdf" )
    , ( "activité 4", "./assets/5e/chap1/activités/activité4/act4.pdf" )
    , ( "activité 5", "./assets/5e/chap1/activités/activité5/act5.pdf" )
    , ( "Cours", "./assets/5e/chap1/cours.pdf" )
    ]


activite5echap2 =
    [ ( "activité 1", "./assets/5e/chap2/activités/activité1/act1.pdf" )
    , ( "activité 2", "./assets/5e/chap2/activités/activité2/act2.pdf" )
    , ( "activité 3", "./assets/5e/chap2/activités/activité3/act3.pdf" )
    , ( "activité 4", "./assets/5e/chap2/activités/activité4/act4.pdf" )
    , ( "tache complexe", "./assets/5e/chap2/activités/tache_complexe/tache_complexe.pdf" )
    , ( "Cours", "./assets/5e/chap2/cours.pdf" )
    ]


activite6echap1 =
    [ ( "activité 1", "./assets/6e/chap1/activités/activité1/act1.pdf" )
    , ( "activité 2", "./assets/6e/chap1/activités/activité2/act2.pdf" )
    , ( "activité 3", "./assets/6e/chap1/activités/activité3/act3.pdf" )
    , ( "activité 4", "./assets/6e/chap1/activités/activité4/act4.pdf" )
    , ( "Cours", "./assets/6e/chap1/cours.pdf" )
    ]


activite6echap2 =
    [ ( "activité 1", "./assets/6e/chap2/activités/activité1/act1.pdf" )
    , ( "activité 2", "./assets/6e/chap2/activités/activité2/act2.pdf" )
    , ( "activité 3", "./assets/6e/chap2/activités/activité3/act3.pdf" )
    , ( "Cours", "./assets/6e/chap2/cours.pdf" )
    ]


view_ref_tuple_simple : List ( String, String ) -> Element.Element msg
view_ref_tuple_simple list =
    List.map tuple_to_link list |> Element.column [ Element.padding 10 ]


tuple_to_link : ( String, String ) -> Element.Element msg
tuple_to_link tuple =
    download [ Element.Font.color (Element.rgb 0.1 0.1 1) ]
        { url = Tuple.second tuple
        , label = text (Tuple.first tuple)
        }
