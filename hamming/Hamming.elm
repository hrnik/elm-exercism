module Hamming exposing (..)


distance : String -> String -> Maybe Int
distance firstDNA secondDNA =
    if String.length firstDNA /= String.length secondDNA then
        Nothing
    else
        List.map2 (/=) (String.toList firstDNA) (String.toList secondDNA)
            |> List.filter identity
            |> List.length
            |> Just
