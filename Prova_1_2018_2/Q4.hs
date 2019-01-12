import Data.String

data DicionarioT t = Node Int String (DicionarioT t) (DicionarioT t)
                   | Leaf t


-- data Tree t = Node t (Tree t) (Tree t) 
--             | Leaf t                   

meuDicionarioT :: DicionarioT t
meuDicionarioT = Node 4 "teria" (Node 3 "cafe" (Node 1 "casa" Leaf t Leaf t) Leaf t)
                                (Node 6 "era" Leaf t (Node 7 "uma" Leaf t Leaf t))

teste = "a 1 tinha 3 mas nao 6 7 34, a 1 6 7 sorve4" :: String
testeResposta = "a casa tinha cafe mas nao era uma cafeteria, a casa era uma sorveteria" :: String

kut = ["0","1","2","3","4","5","6","7","8","9"] :: [String] -- map show [0..9]

-- decode :: DicionarioT -> String -> String
-- decode _ [] = []
-- decode dic (d:ds) | elem (d:[]) kut = (searchDicionario (sti (d:[])) dic) ++ (decode dic ds)
--                   | otherwise = (d:[] ++ (decode dic ds))

-- sti :: String -> Int
-- sti x = read x

-- -- So precisa ler direito a BST
-- searchDicionario :: Int -> DicionarioT -> String 
-- searchDicionario (Leaf) = []
-- searchDicionario val (Node root str rest) | (val < root) = "eh menor"
--                                           | otherwise = "nao eh menor"





