module Accumulate exposing (..)


accumulate : (a -> b) -> List a -> List b
accumulate fun list =
    List.foldr (\x acc -> fun x :: acc) [] list
