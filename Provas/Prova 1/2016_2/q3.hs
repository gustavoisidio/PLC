logSetembro = "2016-09-27;19:31:52;Normal;208772;\n2016-09-27;18:12:02;Normal;155759;\n2016-09-26;17:12:02;Normal;155759;\n2016-09-26;16:11:02;Denied;188758;\n2016-09-25;19:12:02;Normal;155759;" :: String

strToInt :: String -> Int
strToInt str = read str

acessosPorUsuario :: String -> [(Int, Int)] 
acessosPorUsuario str = contaUsuarios (filtraUsuarios str)

filtraUsuarios :: String -> [Int]
filtraUsuarios [] = []
filtraUsuarios str = strToInt (take 6 (drop 27 str)) : filtraUsuarios (drop 35 str)

contaUsuarios :: [Int] -> [(Int,Int)]
contaUsuarios [] = []
contaUsuarios (a:as) = (a,1 + length (filter (== a) as)) : contaUsuarios (filter (/= a) as)