module SumOfMultiples exposing (..)

import Set


sumOfMultiples : List Int -> Int -> Int
sumOfMultiples multiples number =
    List.map (\x -> listMultiple x number) multiples
        |> List.concat
        |> unicArray
        |> List.sum


listMultiple : Int -> Int -> List Int
listMultiple multiple number =
    List.range 1 (number - 1)
        |> List.filter (\x -> x % multiple == 0)


unicArray : List comparable -> List comparable
unicArray arr =
    arr
        |> Set.fromList
        |> Set.toList
