

substr :: String -> String -> Bool
substr [] [] = True
substr _ [] = False
substr (a:as) (b:bs) | take (length (a:as)) (b:bs) == (a:as) = True
                     | otherwise = (substr (a:as) bs)

