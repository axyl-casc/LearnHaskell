
-- write a big and
band :: [Bool] -> Bool

band [] = True
band (b:bs)
    | b == True = band(bs)
    | b == False = b
