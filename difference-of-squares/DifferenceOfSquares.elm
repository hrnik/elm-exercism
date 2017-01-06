module DifferenceOfSquares exposing (..)


difference : Int -> Int
difference number =
    squareOfSum number - sumOfSquares number


squareOfSum : Int -> Int
squareOfSum number =
    rangeToNumber number
        |> List.sum
        |> sqr


sumOfSquares : Int -> Int
sumOfSquares number =
    rangeToNumber number
        |> List.map (\x -> sqr x)
        |> List.sum


sqr : Int -> Int
sqr number =
    number ^ 2


rangeToNumber : Int -> List Int
rangeToNumber number =
    List.range 1 number
