### Pattern Matching in Haskell

Pattern matching is a fundamental feature in Haskell that allows you to deconstruct data structures and bind variables to their components. It makes it easy to define functions by cases and to process complex data types in a clear and expressive way.

#### Basic Syntax

Pattern matching is typically used in function definitions, case expressions, and `let` bindings. The general form is:

```haskell
functionName pattern1 pattern2 = expression
```

#### Examples

**Pattern matching on tuples:**
```haskell
addPair :: (Int, Int) -> Int
addPair (x, y) = x + y
```
This function takes a pair of integers and returns their sum.

**Pattern matching on lists:**
```haskell
head' :: [a] -> a
head' (x:_) = x
```
This function returns the first element of a list. The pattern `(x:_)` matches a non-empty list, binding `x` to the head and ignoring the tail.

**Pattern matching on custom data types:**
```haskell
data Shape = Circle Float | Rectangle Float Float

area :: Shape -> Float
area (Circle r) = pi * r * r
area (Rectangle w h) = w * h
```
This function calculates the area of different shapes.

#### Advantages
- **Clarity**: Functions can be written in a case-by-case style, making them easier to read and reason about.
- **Safety**: Encourages exhaustive handling of data types, helping to prevent runtime errors.
- **Decomposition**: Easily extract and bind components of complex data structures.

#### Notes
- Patterns can be nested for deeper matching.
- The wildcard pattern `_` ignores parts of the data you don't care about.
- Pattern matching can be combined with guards for additional conditions.

#### Conclusion
Pattern matching in Haskell is a powerful way to destructure and analyze data. It supports clear, concise function definitions and is an essential part of writing idiomatic Haskell code.

