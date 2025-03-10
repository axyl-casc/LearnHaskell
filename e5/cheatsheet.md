### COMP 3649 Exercise Set 5 - Detailed Explanation

---

### Question 1

#### Explanation:
- You're asked to write a function that takes a list of integers (years) and filters out non-leap years.
- Use `filter` to select elements satisfying a predicate.
- Define a helper function `isLeapYear`.

#### Solution Strategy:
```haskell
isLeapYear :: Int -> Bool
isLeapYear y = divsBy 4 && (not (divsBy 100) || divsBy 400)
  where divsBy d = y `mod` d == 0

leapYears :: [Int] -> [Int]
leapYears ys = filter isLeapYear ys
```

---

### Question 2

#### Explanation:
You must determine if a given list has any leap years. Provide two methods:

#### a) Using the function from Question 1:
```haskell
anyLeapYears1 :: [Int] -> Bool
anyLeapYears1 ys = not (null (leapYears ys))
```

#### b) Mapping to Booleans and using a "big or":
```haskell
anyLeapYears2 :: [Int] -> Bool
anyLeapYears2 ys = or (map isLeapYear ys)
```

#### Efficiency Comparison:
- Method (b) may stop checking as soon as it finds one leap year, making it potentially more efficient.
- Method (a) evaluates the entire list to find all leap years.

---

### Question 3

#### Explanation:
Define a custom higher-order `takewhile` function:

```haskell
takewhile :: (a -> Bool) -> [a] -> [a]
takewhile _ [] = []
takewhile p (x:xs)
  | p x = x : takewhile p xs
  | otherwise = []
```

#### Example Usage:
```haskell
takewhile (<5) [1,2,1,4,5,2,3] -- [1,2,1,4]
takewhile isLetter "hello 2 u!" -- "hello"
```

---

### Question 4

#### Explanation:
The given comprehension hangs because the condition `x < 20` comes after an infinite sequence.

#### Corrected Version:
```haskell
[ x^3 | x <- takewhile (<20) fibs, even x ]
```

`takewhile` stops evaluation at the first value greater or equal to 20, thus avoiding an infinite loop.

---

### Question 5

#### Example List Comprehension:
```haskell
[x^2 | x <- [1..10], even x]
```

#### Equivalent using map and filter:
```haskell
map (^2) (filter even [1..10])
```

---

### Question 6

#### Generalized Fold:
```haskell
fold :: (a -> b -> b) -> b -> [a] -> b
fold _ v []     = v
fold f v (x:xs) = f x (fold f v xs)
```

#### Example usage:
```haskell
sum xs = fold (+) 0 xs
and xs = fold (&&) True xs
```

---

### Question 7

#### Length using fold:
```haskell
length :: [a] -> Int
length = fold (\_ n -> 1 + n) 0
```

---

### Question 8

#### Define mapTree:
```haskell
data BinTree a = Leaf | Node a (BinTree a) (BinTree a)

mapTree :: (a -> b) -> BinTree a -> BinTree b
mapTree _ Leaf = Leaf
mapTree f (Node x left right) = Node (f x) (mapTree f left) (mapTree f right)
```

#### Example Usage:
```haskell
mapTree (+1) (Node 1 (Node 2 Leaf Leaf) (Node 3 Leaf Leaf))
-- Result: Node 2 (Node 3 Leaf Leaf) (Node 4 Leaf Leaf)
```

---

