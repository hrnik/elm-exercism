module Pangram exposing (..)

import Char
import Set


isPangram : String -> Bool
isPangram phrase =
    Set.size (toLettersOnly phrase) == 26


toLettersOnly : String -> Set.Set Char
toLettersOnly phrase =
    String.toLower phrase
        |> String.filter (\x -> Char.isLower x)
        |> String.toList
        |> Set.fromList
