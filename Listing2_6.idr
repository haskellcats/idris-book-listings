module Listing2_6

-- sometimes the explicit type sig for functions in a where aren't needed

pythagoras : Double -> Double -> Double
pythagoras x y = sqrt (square x + square y) where
  square x = x * x
