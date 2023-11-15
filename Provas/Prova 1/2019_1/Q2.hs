-- Q2
localizar :: String -> String -> Int
localizar x y = local x y 0
       where local [] _ _ = 0
             local a b index | a == ( take ( length a ) b) = ( index + 1 )
                             | tail b == [] = 0
                             | otherwise = local a ( tail b ) ( index + 1 )
