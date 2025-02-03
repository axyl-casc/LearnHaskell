majorityAboveAvg :: Int -> Int -> Int -> Bool


majorityAboveAvg x y z
    | ((x + y + z) < 3*x) && ((x + y + z) < 3*y) = True
    | ((x + y + z) < 3*x) && ((x + y + z) < 3*z) = True
    | ((x + y + z) < 3*y) && ((x + y + z) < 3*z) = True
    | otherwise = False

