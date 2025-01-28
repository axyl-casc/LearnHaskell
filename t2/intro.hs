square :: Int -> Int
square x = x * x

L =  [1,2,3,4,5,6,7,8,9]

eg = sum L
sum [] = 0
sum (x:xs) = x + (sum xs)
eg2 = sum L
