type Chave = [(Char, Char)]
rot13parcial :: Chave -- troca 'a' por 'n', 'b' por 'o' etc.
rot13parcial = [('a','n'),('b','o'),('c','p'),('d','q'),('e','r'),('f','s'),('g','t'),('h','u'),('i','v'),('j','w'),('k','x'),('l','y'), ('m','z')]

suzuka :: Chave -> Char -> Char
suzuka [] b = b 
suzuka ((a,s):as) b | a == b = s
                    | otherwise = (suzuka as b)

cipher :: Chave -> String -> String
cipher _ [] = []
cipher cha (a:as) =  (suzuka cha a):[]  ++ (cipher cha as)






 
