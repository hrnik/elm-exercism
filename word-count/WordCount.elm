module WordCount exposing (..)

import Dict exposing (Dict)
import Char


wordCount : String -> Dict String Int
wordCount phrase =
    prepareString phrase
        |> String.words
        |> List.map (\x -> ( x, (wordContain (prepareString phrase) x) ))
        |> Dict.fromList


wordContain : String -> String -> Int
wordContain phrase word =
    String.words phrase
        |> List.filter (\x -> x == word)
        |> List.length


prepareString : String -> String
prepareString phrase =
    String.toLower phrase
        |> String.words
        |> List.map (\x -> wordWithoutPunctuation x)
        |> String.join " "


wordWithoutPunctuation : String -> String
wordWithoutPunctuation word =
    String.filter (\x -> Char.isLower x || Char.isDigit x) word
