module Listing2_1

-- In Idris, you will end up having to put a type annotation for many
-- things in a where clause, but type inference seems to work in lets.
-- But you can't define functions with let. So let and where is not just
-- a matter of style like in Haskell.
average : String -> Double
average str = answer where
  wordCount : String -> Nat
  wordCount str = length (words str)
  wordLengths : List String -> List Nat
  wordLengths strs = map length strs
  answer =
    let numWords = wordCount str in
    let totalLength = sum (wordLengths (words str)) in
    cast totalLength / cast numWords

showAverage : String -> String
showAverage str = "The average word length is: " ++ show (average str) ++ "\n" 

-- run this in the idris repl with
-- :exec main
main : IO ()
main = repl "Enter a string: " showAverage

-- Standard utility functions that are the same in Haskell
-- words : String -> List String
-- sum : Num a => List a -> a
-- length : List a -> Nat
-- length : String -> Nat
-- show : Show a => a -> String
-- map : (a -> b) -> List a -> List b

-- Specific to Idris
-- cast : Cast from to => from -> to
-- repl : String -> (String -> String) -> IO ()
