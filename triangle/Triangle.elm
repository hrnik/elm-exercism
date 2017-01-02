module Triangle exposing (..)

import Set


version : Int
version =
    2


type Triangle
    = Equilateral
    | Isosceles
    | Scalene


type CheckTriangleType
    = Normal
    | Degenerate
    | NonValidLength


triangleKind : Float -> Float -> Float -> Result String Triangle
triangleKind a b c =
    case checkTriangle a b c of
        Degenerate ->
            Result.Err "Violates inequality"

        NonValidLength ->
            Result.Err "Invalid lengths"

        Normal ->
            case uniqueMemberCount [ a, b, c ] of
                1 ->
                    Result.Ok Equilateral

                2 ->
                    Result.Ok Isosceles

                3 ->
                    Result.Ok Scalene

                _ ->
                    Result.Err "Error"


uniqueMemberCount : List Float -> Int
uniqueMemberCount list =
    Set.size <| Set.fromList list


checkTriangle : Float -> Float -> Float -> CheckTriangleType
checkTriangle a b c =
    if List.any (\x -> x <= 0) [ a, b, c ] then
        NonValidLength
    else if not (a + b >= c && a + c >= b && c + b >= a) then
        Degenerate
    else
        Normal
