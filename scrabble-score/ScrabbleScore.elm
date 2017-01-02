module ScrabbleScore exposing (..)

import Char


type alias CharValue =
    { letter : Char, value : Int }


type alias CharsValue =
    { value : Int, letters : List Char }


scoreWord : String -> Int
scoreWord phrase =
    phrase
        |> String.toList
        |> List.map (\x -> getValueByChar getCharsValue x)
        |> List.sum


getValueByChar : List CharValue -> Char -> Int
getValueByChar listCV letter =
    case List.head <| List.filter (\x -> x.letter == (Char.toUpper letter)) listCV of
        Nothing ->
            0

        Just a ->
            a.value


getCharsValue : List CharValue
getCharsValue =
    List.concat <|
        List.map
            (\x -> List.map (\y -> CharValue y x.value) x.letters)
            [ CharsValue 1 [ 'A', 'E', 'I', 'O', 'U', 'L', 'N', 'R', 'S', 'T' ]
            , CharsValue 2 [ 'D', 'G' ]
            , CharsValue 3 [ 'B', 'C', 'M', 'P' ]
            , CharsValue 4 [ 'F', 'H', 'V', 'W', 'Y' ]
            , CharsValue 5 [ 'K' ]
            , CharsValue 8 [ 'J', 'X' ]
            , CharsValue 10 [ 'Q', 'Z' ]
            ]
