clearData :: String -> [(Int, String, String, Double)]
clearData x = makeTuples splitString
      where makeTuples [] = []
            makeTuples m = (read (m!!0), m!!1, m!!2, read (m!!3)) : makeTuples (drop 4 m)
            splitString = words [if i==';' then ' ' else i | i <- x] 
                        --      map (\x -> case x of ';' -> ' '; _ -> x) x

xSquare :: Int -> Int
xSquare x = x * x

clear' :: Char -> Char
clear' x | x == ';' = ' '
         | otherwise = x
         
clear :: Char -> Char 
clear x = case x of
              ';' -> ' '
              _   -> x

logMes :: String -> String -> Double
logMes mes x = foldl (+) 0 [d | (_,b,_,d) <- clearData x, b == mes]

minMaxCartao :: String -> (Double, Double)
minMaxCartao x = (minimum saldos, maximum saldos)
        where saldos = [d | (_,_,_,d) <- clearData x]

processBankOperations :: [Double] -> [(Int, Int, Int, Double)] -> [Double]
processBankOperations (s:sa) [] = (s:sa)
processBankOperations (s:sa) ((0, co, cd, val):ops) = (processBankOperations (replace (s:sa) co (((s:sa)!!co) + val)) ops)
processBankOperations (s:sa) ((2, co, cd, val):ops) | (((s:sa)!!co) - val) >= 0 = processBankOperations (replace (replace (s:sa) co (((s:sa)!!co) - val)) cd (((s:sa)!!cd) + val)) ops
                                                    | otherwise = processBankOperations (s:sa) ops 
processBankOperations (s:sa) ((1, co, cd, val):ops) | (((s:sa)!!co) - val) >= 0 = processBankOperations (replace (s:sa) co (((s:sa)!!co) - val)) ops
                                                    | otherwise = processBankOperations (s:sa) ops

replace :: [Double] -> Int -> Double -> [Double]
replace (a:as) 0 rp = (rp:as)
replace (a:as) n rp = a:(replace as (n-1) rp)
