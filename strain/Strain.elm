module Strain exposing (..)


keep : (a -> Bool) -> List a -> List a
keep predicat array =
    filter predicat array True


discard : (a -> Bool) -> List a -> List a
discard predicat array =
    filter predicat array False


filter : (a -> Bool) -> List a -> Bool -> List a
filter predicat array filterSave =
    case array of
        [] ->
            []

        first :: rest ->
            if (predicat first) == filterSave then
                first :: (filter predicat rest filterSave)
            else
                filter predicat rest filterSave
