
-- get character at index with !!


getIndex :: [a] -> Int -> a

getIndex (i:is) n
    | n == 0 = i
    | otherwise = getIndex(is) (n-1)