module Listing2_7

||| Calculate the average length of words in a string.
||| @str a string containing words separated by whitespace.
average : (str : String) -> Double
average str = answer where
  word_count : String -> Nat
  word_count str = length (words str)
  word_lengths : List String -> List Nat
  word_lengths strs = map length strs
  answer = 
    let num_words = word_count str in
    let total_length = sum (word_lengths (words str)) in
    cast total_length / cast num_words
