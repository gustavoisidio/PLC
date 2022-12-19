type DicionarioT = Tree Int String
data Tree chave valor = Node chave valor (Tree chave valor) (Tree chave valor)
                      | Leaf

meuDicionarioT :: DicionarioT
meuDicionarioT = Node 4 "teria" (Node 3 "cafe" (Node 1 "casa" Leaf Leaf) Leaf)
                                (Node 6 "era" Leaf (Node 7 "uma" Leaf Leaf))

teste = "a 1 tinha 3 mas nao 6 7 34, a 1 6 7 sorve4" :: String
testeResposta = "a casa tinha cafe mas nao era uma cafeteria, a casa era uma sorveteria" :: String

kut = ["0","1","2","3","4","5","6","7","8","9"] :: [String] -- map show [0..9]

decodeTree :: DicionarioT -> String -> String
decodeTree _ [] = []
decodeTree dic (d:ds) | elem (d:[]) kut = (searchDicionario (sti (d:[])) dic) ++ (decodeTree dic ds)
                      | otherwise = (d:[] ++ (decodeTree dic ds))

sti :: String -> Int
sti x = read x

-- So precisa ler direito a BST
searchDicionario :: Int -> DicionarioT -> String 
searchDicionario _ (Leaf) = []
searchDicionario val (Node root str tE tD) | (val < root) = searchDicionario val tE
                                           | (val > root) = searchDicionario val tD
                                           | otherwise = str





