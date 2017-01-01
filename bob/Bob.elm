module Bob exposing (..)

import Char


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
    String.toUpper phrase == phrase && String.any Char.isUpper phrase


isQuestion : String -> Bool
isQuestion phrase =
    String.endsWith "?" phrase


lastChar : String -> Maybe Char
lastChar phrase =
    List.head (List.reverse (String.toList phrase))
