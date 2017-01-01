module Raindrops exposing (..)


raindrops : Int -> String
raindrops number =
    let
        result =
            String.join "" (List.map (\x -> x number) [ factor3ToString, factor5ToString, factor7ToString ])
    in
        if String.isEmpty result then
            toString number
        else
            result


factor3ToString : Int -> String
factor3ToString number =
    factorToString number 3 "Pling"


factor5ToString : Int -> String
factor5ToString number =
    factorToString number 5 "Plang"


factor7ToString : Int -> String
factor7ToString number =
    factorToString number 7 "Plong"


factorToString : Int -> Int -> String -> String
factorToString number divide phrase =
    if rem number divide == 0 then
        phrase
    else
        ""
