# Difference Between `fold`, `map`, and `filter`

## Introduction
Functional programming provides powerful tools for working with collections of data. Three commonly used functions are `fold`, `map`, and `filter`. Each serves a different purpose:

- **`map`** applies a function to each element in a list, producing a new list.
- **`filter`** selects elements from a list based on a predicate.
- **`fold`** (also known as `foldr` or `foldl`) aggregates elements into a single result using an accumulator.

## `map`

`map` applies a given function to each element in a collection and returns a new collection with transformed elements.

### Example
```haskell
numbers = [1, 2, 3, 4, 5]
squared = map (^2) numbers
-- Output: [1, 4, 9, 16, 25]
```

### Key Characteristics
- Does **not** modify the original list.
- Always returns a list.
- Useful for transforming data.

## `filter`

`filter` applies a predicate (a function that returns `True` or `False`) to a collection and returns a new collection containing only the elements that satisfy the predicate.

### Example
```haskell
numbers = [1, 2, 3, 4, 5]
evenNumbers = filter even numbers
-- Output: [2, 4]
```

### Key Characteristics
- Returns a collection containing only elements that satisfy the condition.
- Does **not** modify the original list.
- Useful for extracting elements that meet a certain condition.

## `fold` (Reduce)

`fold` (often implemented as `foldr` or `foldl`) takes a collection, an initial value, and a function that combines elements. It processes the list into a single accumulated result.

### Example
```haskell
numbers = [1, 2, 3, 4, 5]
sumResult = foldl (+) 0 numbers
-- Output: 15
```

### Key Characteristics
- Aggregates elements into a single value.
- Requires an initial accumulator value.
- Useful for computing sums, products, and other cumulative results.

## Comparison Table

| Function | Purpose | Output | Modifies Original? |
|----------|---------|--------|--------------------|
| `map`    | Transforms elements | New collection | No |
| `filter` | Selects elements    | New collection | No |
| `fold`   | Aggregates elements | Single value   | No |

## Conclusion
Understanding the differences between `map`, `filter`, and `fold` is essential for writing clean, functional-style code. Each serves a unique purpose:
- Use **`map`** when you need to transform each element.
- Use **`filter`** when you need to extract specific elements.
- Use **`fold`** when you need to accumulate a single result from a collection.
