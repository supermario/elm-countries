module Main exposing (main)

import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (..)
import Countries exposing (Country)


type alias Model =
  { searchString : String
  , selectedCountry : Maybe Country
  }


type Msg
  = SelectCountry Country
  | UpdatePrefix String


model : Model
model =
  { searchString = ""
  , selectedCountry = Nothing
  }


main : Program Never Model Msg
main =
  Html.beginnerProgram
    { update = update
    , view = view
    , model = model
    }


update : Msg -> Model -> Model
update msg model =
  case msg of
    SelectCountry selected ->
      { model | selectedCountry = Just selected }

    UpdatePrefix prefix ->
      { model | searchString = prefix }


view : Model -> Html Msg
view model =
  let
    selectedCountryString =
      case model.selectedCountry of
        Just country ->
          country.name ++ " " ++ country.flag

        Nothing ->
          "No country selected"
  in
    div
      []
      [ input [ type_ "text", onInput UpdatePrefix, placeholder "Search for a country" ] []
      , h2 [] [ text selectedCountryString ]
      , viewCountryList model.searchString
      ]


viewCountryList : String -> Html Msg
viewCountryList searchString =
  div [] <|
    List.map viewCountry (Countries.search searchString)


viewCountry : Country -> Html Msg
viewCountry country =
  div
    [ onClick <| SelectCountry country ]
    [ text <| country.flag ++ " " ++ country.name ++ " " ++ "(" ++ country.code ++ ")" ]