
module Main exposing (..)

import Browser
import Html exposing (..)
import Html.Attributes exposing (href)
main =
  Browser.sandbox { init = init, update = update, view = view }

init =
  div [] []

update msg msg2 =
  div [] []


view x =
  div []
    [ h1 [] [ text "Ce site internet" ]
      , text "Ce site internet est une plateforme avec plusieurs simulations de physique chimie."
      , h2 [] [text "Niveau 4e"]
      , a [ href "assets/4e/cours/4e.zip" ] [ text "Télécharger le cours"]
      , br [] []
      , a [ href "assets/4e/chimie/godot.html" ] [ text "Équilibrer des équations chimiques"]
      , br [] []
      , a [ href "assets/4e/act1/godot_html.html" ] [ text "Activité 1: Que contient notre univers?"]
    ]
