type Dicionario = [(Int, String)]


-- exemplo: 
meuDicionario :: Diccionario
meuDicionario = [(1, "casa"), (3, "cafe"), (4, "teria"), (6, "era"), (7, "uma")]
teste = "a 1 tinha 3 mas nao 6 7 34, a 1 6 7 sorve4" :: String
decode meuDicionario teste ---> "a casa tinha cafe mas nao era uma cafeteria, a casa era uma sorveteria"


decode :: Dicionario -> String -> String
decode _ [] = []
decode 

searchDicionario :: Int -> String











