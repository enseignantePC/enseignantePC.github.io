module Main exposing (..)

import Element exposing (download, el, link, none, text)
import Element.Background
import Element.Font


main =
    Element.layout [ Element.Background.color (Element.rgb 0.8 0.8 0.8) ]
        (Element.column
            [ Element.padding 20 ]
            [ el [ Element.Font.size 20 ]
                (text
                    ("Bienvenue sur le site de physique chimie, vous pouvez y télécharger "
                        ++ "les activités faites en classe (et autre contenu dans un futur proche (ou lointain))."
                    )
                )
            , el [ Element.padding 10 ] none
            , el [ Element.Font.size 30 ] (text "6e")
            , el [ Element.Font.size 25 ] (text "chapitre 1")
            , make_ref_list chap1_6e activite6echap1
                |> view_ref_list_simple
            , el [ Element.Font.size 25 ] (text "chapitre 2")
            , make_ref_list chap2_6e activite6echap2
                |> view_ref_list_simple
            , el [ Element.Font.size 30 ] (text "5e")
            , el [ Element.Font.size 25 ] (text "chapitre 1")
            , make_ref_list chap1_5e activite5echap1
                |> view_ref_list_simple
            , el [ Element.Font.size 25 ] (text "chapitre 2")
            , make_ref_list chap2_5e activite5echap2
                |> view_ref_list_simple
            ]
        )


chap1_5e : String
chap1_5e =
    "./assets/5e/chap1/activités/"


chap2_5e : String
chap2_5e =
    "./assets/5e/chap2/activités/"


chap1_6e : String
chap1_6e =
    "./assets/6e/chap1/activités/"


chap2_6e : String
chap2_6e =
    "./assets/6e/chap2/activités/"


activite5echap1 : List String
activite5echap1 =
    [ "activité1/act1.pdf"
    , "activité2/act2.pdf"
    , "activité3/act3.pdf"
    , "activité4/act4.pdf"
    , "activité5/act5.pdf"
    ]


activite5echap2 : List String
activite5echap2 =
    [ "activité1/act1.pdf"
    , "activité2/act2.pdf"
    , "activité3/act3.pdf"
    , "activité4/act4.pdf"
    , "tache_complexe/tache_complexe.pdf"
    ]


activite6echap1 : List String
activite6echap1 =
    [ "activité1/act1.pdf"
    , "activité2/act2.pdf"
    , "activité3/act3.pdf"
    , "activité4/act4.pdf"
    ]


activite6echap2 : List String
activite6echap2 =
    [ "activité1/act1.pdf"
    , "activité2/act2.pdf"
    , "activité3/act3.pdf"
    ]


add_prefix : String -> String -> String
add_prefix prefix cont =
    prefix ++ cont


make_ref_list : String -> List String -> List String
make_ref_list chapitre activites =
    activites
        |> List.map (add_prefix chapitre)



-- view_ref_list_simple : List String -> el


view_ref_list_simple list =
    List.map string_to_link list |> Element.column [ Element.padding 10 ]


string_to_link : String -> Element.Element msg
string_to_link str =
    download [ Element.Font.color (Element.rgb 0.1 0.1 1) ]
        { url = str
        , label = text str
        }



-- content : el


content =
    make_ref_list chap1_5e activite5echap1
        |> view_ref_list_simple
