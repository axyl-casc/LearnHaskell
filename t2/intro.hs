sum []     = 0 
sum (x:xs) = x + (sum xs)

print sum [1,2,3,4,5,6,7,8,9]

prod []     = 0 
prod (x:xs) = x * (prod xs)

print sum [1,2,3,4,5,6,7,8,9]

scaleBy :: Int -> [a] -> [a]

