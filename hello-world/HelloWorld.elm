module HelloWorld exposing (..)


helloWorld : Maybe String -> String
helloWorld name =
    case name of
        Nothing ->
            hello "World"

        Just name ->
            hello name


hello : String -> String
hello phrase =
    "Hello, " ++ phrase ++ "!"
