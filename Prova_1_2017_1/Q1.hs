

ex1 = [5,6,1,2,7] :: [Int] --notSorted


isSorted :: Ord t => [t] -> Bool
isSorted [] = True -- Quando for vazia, é ordenada ou não? 
isSorted (x:[]) = True
isSorted (x:y:xs) | x <= y = isSorted (y:xs)
                  | otherwise = False



