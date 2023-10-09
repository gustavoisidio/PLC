type Chave = [(Char, Char)]
rot13parcial :: Chave -- troca 'a' por 'n', 'b' por 'o' etc.
rot13parcial = [('a','n'),('b','o'),('c','p'),('d','q'),('e','r'),('f','s'),('g','t'),('h','u'),('i','v'),('j','w'),('k','x'),('l','y'), ('m','z')]


inverteChave :: Chave -> Chave
inverteChave [] = []
inverteChave ((a,b):as) = (b,a):[] ++ (inverteChave as)












