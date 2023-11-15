isSorted :: Ord t => [t] -> Bool
isSorted [] = True -- Quando for vazia, é ordenada ou não? 
isSorted (x:[]) = True
isSorted (x:y:xs) | x <= y = isSorted (y:xs)
                  | otherwise = False

bSort :: Ord t => [t] -> [t]
bSort [] = []
bSort (x:[]) = (x:[])
bSort (x:xs) | isSorted (x:xs) = (x:xs) 
             | otherwise = bSort (brSort (x:xs))

brSort :: Ord t => [t] -> [t]
brSort [] = []
brSort (x:[]) = (x:[])
brSort (x:y:xs) | x > y = brSort (y:x:xs)
                | otherwise = x:(brSort (y:xs))














