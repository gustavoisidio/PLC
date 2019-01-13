
locate :: Eq t => t -> [t] -> Int
locate _ [] = -1
locate element (x:xs) | (elem element (x:xs)) == False = -1
                      | element == x = 0
                      | otherwise = 1 + (locate element xs) 
 





