module EncodeTest exposing (..)

import Code128
import Expect
import Samples
import Test


suite : Test.Test
suite =
    Test.describe "Code128"
        [ Test.describe "encode"
            tests
        ]


tests : List Test.Test
tests =
    Samples.samples
        |> List.indexedMap
            (\i ( a, b ) ->
                Test.test ("sample " ++ String.fromInt i ++ " \"" ++ a ++ "\"") <|
                    \_ ->
                        Code128.fromString a
                            |> Result.toMaybe
                            |> Expect.equal b
            )
