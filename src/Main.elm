module Main exposing (..)

import Assets exposing (..)
import Browser
import Dict exposing (..)
import Element exposing (..)
import Element.Background
import Element.Border as Border
import Element.Events exposing (onClick)
import Element.Font as Font


type Tab
    = First
    | Second


type Msg
    = UserSelectedTab Tab


type alias Model =
    Tab


update : Msg -> Model -> Model
update (UserSelectedTab t) _ =
    t


main : Program () Model Msg
main =
    Browser.sandbox
        { init = First
        , view = view
        , update = update
        }


view selectedTab =
    let
        view_now =
            case selectedTab of
                First ->
                    view_cours

                Second ->
                    view_simulation
    in
    Element.layout
        [ width fill
        , height fill
        , scrollbarY
        , padding 1
        , Element.Background.color (Element.rgb 0.8 0.8 0.8)
        ]
        (Element.column
            [ width fill
            , Element.padding 10
            ]
            ([ row [ centerY ]
                [ tabEl First selectedTab
                , tabEl Second selectedTab
                ]
             ]
                ++ view_now
            )
        )


view_simulation =
    [ el
        [ padding 30
        , Font.size 48
        , alignTop
        , centerX
        ]
        (text "Documents à télécharger")
    , godotlink "assets/godot/composition_air/godot.html" "Composition de l'air"
    , godotlink "assets/godot/equilibre_equation/godot.html" "Équilibre équation"
    , godotlink "assets/godot/univers/godot.html" "Univers"
    ]


view_cours =
    [ el
        [ padding 30
        , Font.size 48
        , alignTop
        , centerX
        ]
        (text "Documents à télécharger")
    , myrow
        [ mycol
            [ minititle "STI2D"
            , chap "chapitre 1"
            , view_ref_tuple_simple a2022_1STI2Dchap1
            , chap "chapitre 2"
            , view_ref_tuple_simple a2022_1STI2Dchap2
            , chap "chapitre 3"
            , view_ref_tuple_simple a2022_1STI2Dchap3
            ]
        , mycol
            [ minititle "1GEN"
            , chap "chapitre 1"
            , view_ref_tuple_simple a2022_1Genchap1
            , chap "chapitre 2"
            , view_ref_tuple_simple a2022_1Genchap2
            ]
        ]
    ]


tabEl : Tab -> Tab -> Element Msg
tabEl tab selectedTab =
    let
        isSelected =
            tab == selectedTab

        padOffset =
            if isSelected then
                0

            else
                2

        borderWidths =
            if isSelected then
                { left = 2, top = 2, right = 2, bottom = 0 }

            else
                { bottom = 2, top = 0, left = 0, right = 0 }

        corners =
            if isSelected then
                { topLeft = 6, topRight = 6, bottomLeft = 0, bottomRight = 0 }

            else
                { topLeft = 0, topRight = 0, bottomLeft = 0, bottomRight = 0 }
    in
    el
        [ Border.widthEach borderWidths
        , Border.roundEach corners
        , Border.color (rgb255 0x72 0x9F 0xCF)
        , onClick <| UserSelectedTab tab
        ]
    <|
        el
            [ centerX
            , centerY
            , paddingEach { left = 30, right = 30, top = 10 + padOffset, bottom = 10 - padOffset }
            ]
        <|
            text <|
                case tab of
                    First ->
                        "Cours"

                    Second ->
                        "Simulations"


myrow x =
    Element.row
        [ width fill
        , alignTop

        --, height fill
        , Element.spacing 60
        ]
        x


mycol x =
    Element.column
        [ alignTop
        , width fill

        --  , height fill
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
        [ Font.size 48
        , Font.center
        , Font.size 30
        , Element.centerX
        ]
        (text x)


chap x =
    el
        [ Font.size 25
        , Element.centerX
        , alignTop
        ]
        (text x)


title x =
    paragraph
        [ Font.size 48
        , alignTop
        , Font.center
        , Element.centerX
        , width fill
        , height fill
        , padding 10
        ]
        [ text
            x
        ]


view_ref_tuple_simple : List ( String, String ) -> Element.Element msg
view_ref_tuple_simple list =
    List.map tuple_to_link list |> mycol


tuple_to_link : ( String, String ) -> Element.Element msg
tuple_to_link tuple =
    download [ Font.color (rgb 0.1 0.1 1) ]
        { url = Tuple.second tuple
        , label = text (Tuple.first tuple)
        }


godotlink : String -> String -> Element.Element msg
godotlink url label =
    newTabLink
        [ padding 15
        , Font.color <| rgb 0.1 0.1 1
        , Border.width 2
        , Border.rounded 6
        , Border.color (rgb255 255 0 0)

        -- , Element.Background.color <| rgb255 50 50 50
        ]
        { url = url
        , label =
            text label
        }
