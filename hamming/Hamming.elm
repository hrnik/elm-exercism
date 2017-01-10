module Hamming exposing (..)


distance : String -> String -> Maybe Int
distance firstDNA secondDNA =
    if String.length firstDNA /= String.length secondDNA then
        Nothing
    else
        Just (difference (String.toList firstDNA) (String.toList secondDNA) 0)


difference : List Char -> List Char -> Int -> Int
difference firstArr secondArr acc =
    case firstArr of
        [] ->
            acc

        first :: rest ->
            if Just first /= List.head secondArr then
                difference rest (List.drop 1 secondArr) (acc + 1)
            else
                difference rest (List.drop 1 secondArr) acc
