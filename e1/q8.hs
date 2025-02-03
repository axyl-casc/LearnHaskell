

repl :: Int -> a -> [a]

repl n x
    | n > 0 = x:repl (n-1) x
    | otherwise = []
