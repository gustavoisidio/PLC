type Dicionario = [(Int, String)]
meuDicionario :: Dicionario
meuDicionario = [(1, "casa"), (3, "cafe"), (4, "teria"), (6, "era"), (7, "uma")]

teste = "a 1 tinha 3 mas nao 6 7 34, a 1 6 7 sorve4" :: String
testeResposta = "a casa tinha cafe mas nao era uma cafeteria, a casa era uma sorveteria" :: String

kut = ["0","1","2","3","4","5","6","7","8","9"] :: [String] -- map show [0..9]

decode :: Dicionario -> String -> String
decode _ [] = []
decode dic (d:ds) | elem (d:[]) kut = (searchDicionario (sti (d:[])) dic) ++ (decode dic ds)
                  | otherwise = (d:[] ++ (decode dic ds))

searchDicionario :: Int -> Dicionario -> String
searchDicionario x [] = show x
searchDicionario x ((n, s):ns) | x == n = s
                               | otherwise = searchDicionario x ns 

sti :: String -> Int
sti x = read x





