type Chave = [(Char, Char)]
rot13parcial :: Chave -- troca 'a' por 'n', 'b' por 'o' etc.
rot13parcial = [('a','n'),('b','o'),('c','p'),('d','q'),('e','r'),('f','s'),('g','t'),('h','u'),('i','v'),('j','w'),('k','x'),('l','y'), ('m','z')]

type FuncaoChave = (Char -> Char)

suzuka :: Chave -> Char -> Char
suzuka [] b = b 
suzuka ((a,s):as) b | a == b = s
                    | otherwise = (suzuka as b)

chaveToFuncaoChave :: Chave -> FuncaoChave
chaveToFuncaoChave ch = suzuka ch

cipherf :: FuncaoChave -> String -> String
cipherf _ [] = []
cipherf f (a:as) = (f a):[]  ++ (cipherf f as)
 
