

--sum []     = 0 
--sum (x:xs) = x + (sum xs)


--prod []     = 0 
--prod (x:xs) = x * (prod xs)


scaleBy :: Int -> [Int] -> [Int]

scaleBy a [] = []

scaleBy s (n:ns) = (n * s) : (scaleBy s ns)
