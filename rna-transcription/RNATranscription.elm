module RNATranscription exposing (..)


toRNA : String -> Result Char String
toRNA dnk =
    if String.all isMember dnk then
        dnk
            |> String.map dnkToRna
            |> Result.Ok
    else
        case
            String.toList dnk
                |> List.filter (\x -> not (isMember x))
                |> List.head
        of
            Just a ->
                Result.Err a

            Nothing ->
                Result.Err ' '


dnkToRna : Char -> Char
dnkToRna dnk =
    case dnk of
        'C' ->
            'G'

        'G' ->
            'C'

        'T' ->
            'A'

        'A' ->
            'U'

        _ ->
            dnk


isMember : Char -> Bool
isMember char =
    List.member char [ 'G', 'C', 'A', 'T' ]
