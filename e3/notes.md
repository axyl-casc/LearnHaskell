# Haskell Lab Guide: Guards and Essential Knowledge

## Introduction
This document explains how to use **guards** in Haskell and provides the foundational knowledge required to complete the exercises in **COMP 3649 Exercise Set 3**.

## Guards in Haskell

Guards provide an alternative way to express conditional logic in Haskell. Instead of using `if-then-else` expressions, guards allow you to define multiple conditions concisely.

### Syntax
```haskell
functionName parameters
    | condition1 = result1
    | condition2 = result2
    | otherwise = defaultResult
```

Each condition is a Boolean expression. The first one that evaluates to `True` determines the result.

### Example: Absolute Value
```haskell
absolute :: Int -> Int
absolute x
    | x < 0     = -x
    | otherwise = x
```
- If `x` is negative, return `-x`.
- Otherwise, return `x`.

### Example: Maximum of Two Numbers
```haskell
maxNum :: (Ord a) => a -> a -> a
maxNum x y
    | x > y     = x
    | otherwise = y
```

## Prelude Functions and Their Custom Implementations
The lab requires reimplementing several functions from Haskell’s **Prelude**.

### `fst` and `snd`
```haskell
fst' :: (a, b) -> a
fst' (x, _) = x

snd' :: (a, b) -> b
snd' (_, y) = y
```

### `head` and `tail`
```haskell
head' :: [a] -> a
head' [] = error "Empty list"
head' (x:_) = x

tail' :: [a] -> [a]
tail' [] = error "Empty list"
tail' (_:xs) = xs
```

### `take` and `drop`
```haskell
take' :: Int -> [a] -> [a]
take' _ [] = []
take' n (x:xs)
    | n <= 0    = []
    | otherwise = x : take' (n-1) xs

drop' :: Int -> [a] -> [a]
drop' _ [] = []
drop' n (x:xs)
    | n <= 0    = x : xs
    | otherwise = drop' (n-1) xs

```

### `unzip`
```haskell
unzip' :: [(a, b)] -> ([a], [b])
unzip' [] = ([], [])
unzip' ((a, b) : xs) = (a : as, b : bs)
    where (as, bs) = unzip' xs
```

## Implementing `reverse` in O(n)
A naive `reverse` implementation using `++` is O(n²) because concatenation takes O(n) time. Instead, we use an accumulator to achieve O(n):
```haskell
reverse' :: [a] -> [a]
reverse' xs = reverseHelper xs []
    where
        reverseHelper [] acc = acc
        reverseHelper (y:ys) acc = reverseHelper ys (y:acc)
```

## Extracting Values from `Either`
```haskell
lefts' :: [Either a b] -> [a]
lefts' [] = []
lefts' (Left x : xs) = x : lefts' xs
lefts' (_ : xs) = lefts' xs
```

## Integer Division with Quotients and Remainders
```haskell
divModList :: [Int] -> Int -> [Maybe (Int, Int)]
divModList [] _ = []
divModList (x:xs) n
    | x == 0    = Nothing : divModList xs n
    | otherwise = Just (n `div` x, n `mod` x) : divModList xs n
```

## Finding Maximum Value in a List (Using `Maybe`)
```haskell
maxMaybe :: [Int] -> Maybe Int
maxMaybe [] = Nothing
maxMaybe (x:xs) = Just (maxHelper x xs)
    where
        maxHelper current [] = current
        maxHelper current (y:ys)
            | y > current = maxHelper y ys
            | otherwise   = maxHelper current ys
```

## Polymorphic Non-Empty List Type
```haskell
data NonEmptyList a = Single a | Cons a (NonEmptyList a)
```

## Polymorphic Tree with Two or Three Subtrees
```haskell
data Tree a = Empty | Node2 a (Tree a) (Tree a) | Node3 a (Tree a) (Tree a) (Tree a)
```

### Counting Elements in the Tree
```haskell
countNodes :: Tree a -> Int
countNodes Empty = 0
countNodes (Node2 _ left right) = 1 + countNodes left + countNodes right
countNodes (Node3 _ left middle right) = 1 + countNodes left + countNodes middle + countNodes right
```

## Polymorphic Tree with Arbitrary Subtrees
```haskell
data GenTree a = EmptyTree | GenNode a [GenTree a]
```

### Counting Elements in a General Tree
```haskell
countGenTree :: GenTree a -> Int
countGenTree EmptyTree = 0
countGenTree (GenNode _ subtrees) = 1 + sum (map countGenTree subtrees)
```
