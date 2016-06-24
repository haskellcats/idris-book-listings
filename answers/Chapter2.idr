module Chapter2

palindrome : String -> Bool
palindrome str = str == reverse str

question3 : String -> Bool
question3 = palindrome . toLower

question4 : String -> Bool
question4 str with (length str `isLTE` 10)
  | Yes lte  = False
  | No contr = question3 str

question5 : Nat -> String -> Bool
question5 threshold str with (length str `isLTE` threshold)
  | Yes lte  = False
  | No contr = question3 str

question4' : String -> Bool
question4' = question5 10

counts : String -> (Nat, Nat)
counts str = (length (words str), length str)

topTen : Ord a => List a -> List a
topTen = Prelude.List.take 10 . reverse . sort

overLength : Nat -> List String -> Nat
overLength threshold = length . filter ((> threshold) . length)

question9A : IO ()
question9A = repl "Enter a word: " check where
  check str = if palindrome str
    then "Yep, palindrome.\n"
    else "Not a palindrome.\n"

question9B : IO ()
question9B = repl "Enter a sentence: " crunch where
  crunch str =
    let (wordCount, charCount) = counts str in
    unlines ["Words: " ++ show wordCount, "Chars: " ++ show charCount, ""]



---- Alternate implementations for palindrome

||| S combinator
S : (a -> b -> c) -> (a -> b) -> a -> c
S f g x = f x (g x)

-- using the S combinator
palindrome' : String -> Bool
palindrome' = S (==) reverse

-- S is the proper <*> for functions... though it's not declared in idris prelude
Functor (\t => a -> t) where
  map = (.)

Applicative (\t => a -> t) where
  pure = const
  (<*>) = S

-- using <*>
palindrome'' : String -> Bool
palindrome'' = (==) <*> reverse
