word_lengths : List String -> List Nat
word_lengths [] = []
word_lengths (word :: words) = length word :: word_lengths words

xor : Bool -> Bool -> Bool
xor False y = y
xor True y = not y

isEven : Nat -> Bool
isEven Z = True
isEven (S k) = not (isEven k)
