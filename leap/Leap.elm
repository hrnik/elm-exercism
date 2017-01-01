module Leap exposing (..)


isLeapYear : Int -> Bool
isLeapYear year =
    if rem year 4 == 0 then
        if rem year 100 == 0 && rem year 400 /= 0 then
            False
        else
            True
    else
        False
