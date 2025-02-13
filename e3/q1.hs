

import Prelude hiding (fst, snd, head, tail, take, drop, unzip, concat)

fst :: [a] -> a
fst (x:xs) = x

snd :: [a] -> a
snd (x:xs) = fst xs

head :: [a] -> a
head (x:xs) = x

tail :: [a] -> a
tail (x:xs)
    | null xs = x
    | otherwise = tail xs

take :: Int -> [a] -> [a]
take n (x:xs)
    | n > 0 = x:take (n - 1) xs
    | otherwise = []

drop :: Int -> [a] -> [a]
drop n (x:xs)
    | n > 0 = drop (n-1) xs
    | otherwise = xs

unzip :: [(a, b)] -> ([a], [b])
unzip [] = ([], [])
unzip ((a, b) : xs) = (a : as, b : bs)
  where (as, bs) = unzip xs

concat :: [[a]] -> [a]
