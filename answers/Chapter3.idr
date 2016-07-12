import Data.Vect

-- 3.2.4
my_length : List a -> Nat
my_length [] = 0
my_length (x :: xs) = 1 + my_length xs

my_reverse : List a -> List a
my_reverse [] = []
my_reverse (x :: xs) = my_reverse xs ++ [x]

my_map : (a -> b) -> List a -> List b
my_map f [] = []
my_map f (x :: xs) = f x :: my_map f xs

my_map' : (a -> b) -> Vect n a -> Vect n b
my_map' f [] = []
my_map' f (x :: xs) = f x :: my_map' f xs



-- 3.3.3
empties : Vect m (Vect 0 a)
empties {m = Z} = []
empties {m = S k} = [] :: empties

transpose_mat : Vect n (Vect m a) -> Vect m (Vect n a)
transpose_mat [] = empties
transpose_mat ([] :: rs) = []
transpose_mat m@((c :: cs) :: rs) =
  let col1 = map head m in
  let rest = map tail m in
  col1 :: transpose_mat rest

addMatrix : Num a => Vect n (Vect m a) -> Vect n (Vect m a) -> Vect n (Vect m a)
addMatrix xs ys = zipWith (zipWith (+)) xs ys

multRow : Num a => Vect o (Vect m a) -> Vect m a -> Vect o a
multRow m2' row = map (sum . zipWith (*) row) m2'

multMatrix : Num a => Vect n (Vect m a) -> Vect m (Vect o a) -> Vect n (Vect o a)
multMatrix m1 m2 = map (multRow (transpose_mat m2)) m1
