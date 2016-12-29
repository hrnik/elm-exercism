module Bob exposing (..)

import Char
import Regex


hey : String -> String
hey phrase =
    if phrase |> String.trim |> String.isEmpty then
        "Fine. Be that way!"
    else if isShout phrase then
        "Whoa, chill out!"
    else if isQuestion phrase then
        "Sure."
    else
        "Whatever."


isShout : String -> Bool
isShout phrase =
    removeChars phrase
        |> String.words
        |> removeAcronyms
        |> List.any isUpperString


isUpperString : String -> Bool
isUpperString phrase =
    List.all Char.isUpper (String.toList phrase)


isQuestion : String -> Bool
isQuestion phrase =
    case lastChar phrase of
        Nothing ->
            False

        Just a ->
            "?" == String.fromChar a


lastChar : String -> Maybe Char
lastChar phrase =
    List.head (List.reverse (String.toList phrase))


removeChars : String -> String
removeChars phrase =
    String.filter removeChar phrase


removeChar : Char -> Bool
removeChar char =
    not (List.member char [ '!', '?' ])


removeAcronyms : List String -> List String
removeAcronyms phrases =
    List.filter (\x -> x /= "OK") phrases
