# COMP 3649 - Exercise Set 4

## Haskell Review

### Declaring Values
In Haskell, values are typically declared using `=`:
```haskell
x = 10  -- x is assigned the value 10
```
Lists and infinite lists can also be defined:
```haskell
nums = [1,2,3,4,5]  -- A finite list
ones = repeat 1      -- An infinite list of ones
```

### Declaring Functions
Functions in Haskell follow the form:
```haskell
square x = x * x  -- Function that squares a number
```
Functions can also be recursive:
```haskell
factorial 0 = 1
factorial n = n * factorial (n-1)
```

### Type Annotations
Haskell uses a strong, static type system. You can explicitly specify types:
```haskell
square :: Int -> Int
square x = x * x
```
Multiple arguments:
```haskell
add :: Int -> Int -> Int
add x y = x + y
```

### Default Types in Haskell
Haskell provides several built-in types:
- **Basic Types**:
  - `Int`: Fixed-precision integer
  - `Integer`: Arbitrary-precision integer
  - `Float`: Single-precision floating point
  - `Double`: Double-precision floating point
  - `Char`: Single character
  - `Bool`: Boolean (`True` or `False`)
  - `String`: A list of characters

- **Compound Types**:
  - Lists: `[1,2,3] :: [Int]`
  - Tuples: `(1, 'a', True) :: (Int, Char, Bool)`
  - Functions: `(->)`

- **Type Classes**:
  - `Num`: Numeric types (`Int`, `Float`, `Double`, etc.)
  - `Eq`: Equality types (`==`, `/=`)
  - `Ord`: Ordered types (`<`, `>`, `<=`, `>=`)
  - `Show`: Convert to string (`show` function)
  - `Read`: Parse from string (`read` function)

---

## Question 1: Using "dot dot" Notation in Haskell

### (a) A list of uppercase characters from 'H' to 'W'
```haskell
['H'..'W']
```

### (b) A list of uppercase characters from 'W' down to 'H'
```haskell
reverse ['H'..'W']
```
or
```haskell
['W', 'V'..'H']
```

### (c) An infinite list of integers incrementing by 1 and starting at 0
```haskell
[0..]
```

### (d) An infinite list of multiples of 3 starting at 0
```haskell
[0,3..]
```

---

## Question 2: Powers of Two and Recursion

### Why "dot dot" notation cannot be used for powers of two
The `..` notation in Haskell works for arithmetic sequences but cannot be used for geometric sequences like powers of two because the step size is not constant in an additive sense (it doubles each time instead of increasing by a fixed value).

### Recursive function for powers of two
```haskell
pows :: [Integer]
pows = 1 : map (*2) pows
```
This works because:
- The first element is `1`.
- Each subsequent element is obtained by multiplying the previous element by `2`.

---

## Question 3: Lazy Evaluation Reduction

We assume:
```haskell
(x:xs) !! 0 = x    -- (!!).1
(x:xs) !! n = xs !! (n-1)  -- (!!).2
```

### Given: `pows !! 3`
Reduction steps:

1. `pows !! 3`
2. `= (1 : map (*2) pows) !! 3`  (Expanding `pows`)
3. `= map (*2) pows !! (3-1)`  (Using (!!).2 with `x=1, xs=map (*2) pows, n=3`)
4. `= map (*2) pows !! 2`
5. `= (2 : map (*2) (map (*2) pows)) !! 2`  (Expanding `map (*2) pows`)
6. `= map (*2) (map (*2) pows) !! (2-1)`  (Using (!!).2 with `x=2, xs=map (*2) (map (*2) pows), n=2`)
7. `= map (*2) (map (*2) pows) !! 1`
8. `= (4 : map (*2) (map (*2) (map (*2) pows))) !! 1`  (Expanding again)
9. `= map (*2) (map (*2) (map (*2) pows)) !! (1-1)`  (Using (!!).2)
10. `= (8 : map (*2) (map (*2) (map (*2) (map (*2) pows)))) !! 0`  (Expanding again)
11. `= 8`  (Using (!!).1)

Final answer: `8`

---

# Summary of Key Takeaways

- **Dot-dot notation (`..`)** works for arithmetic sequences but not for geometric sequences.
- **Lazy evaluation strategy** follows a leftmost-outermost reduction order.
- **List comprehension pitfalls** arise from infinite inner lists blocking outer iterations.
- **α-equivalence** allows renaming of bound variables.
- **β-reduction** follows function application rules to reach normal form.

This guide should fully prepare you for Exercise Set 4 and the upcoming quiz!

