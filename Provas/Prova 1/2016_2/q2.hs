logSetembro = "2016-09-27;19:31:52;Normal;208772;\n2016-09-27;18:12:02;Normal;155759;\n2016-09-26;17:12:02;Normal;155759;\n2016-09-26;16:11:02;Denied;188758;\n2016-09-25;19:12:02;Normal;155759;" :: String

strToInt :: String -> Int
strToInt str = read str

acessosPorDia :: String -> [(Int, Int)] 
acessosPorDia str = contaDias (filtraDias str)

filtraDias :: String -> [Int]
filtraDias [] = []
filtraDias str = strToInt (take 2 (drop 8 str)) : filtraDias (drop 35 str)

contaDias :: [Int] -> [(Int,Int)]
contaDias [] = []
contaDias (a:as) = (a,1 + length (takeWhile (== a) as)) : contaDias (dropWhile (== a) as)