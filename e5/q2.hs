
isLeapYear :: Int -> Bool

isLeapYear y = divsBy 4 && (not (divsBy 100) || divsBy 400)
    where divsBy d = y `mod` d == 0

onlyLeapYear :: [Int] -> [Int]
onlyLeapYear [] = []
onlyLeapYear (y:ys)
    | isLeapYear y = y:(onlyLeapYear ys)
    | otherwise = onlyLeapYear ys



-- a
hasLeapYear :: [Int] -> Bool
hasLeapYear (y:ys)
    | null (onlyLeapYear (y:ys)) = False
    | otherwise = True

-- b
