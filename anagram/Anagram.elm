module Anagram exposing (..)


detect : String -> List String -> List String
detect phrase words =
    List.filter (\x -> isAnagram x phrase) words


isAnagram : String -> String -> Bool
isAnagram word1 word2 =
    let
        firstWord =
            String.toLower word1

        secondWord =
            String.toLower word2
    in
        if firstWord == secondWord then
            False
        else if sortChars firstWord /= sortChars secondWord then
            False
        else
            True


sortChars : String -> List Char
sortChars phrase =
    phrase
        |> String.toList
        |> List.sort
