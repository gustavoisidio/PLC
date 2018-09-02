type Resultado = [Int]
type Jogos = [[Int]]

-- Um exemplo de jogo com 2 premiados
exJogo = [[12,13,14,15,16,17], [1, 2, 3, 4, 5, 12], [6,7,14,15,16,17], [12,13,14,15,16,17]]  :: Jogos
exResultado = [12,13,14,15,16,17] :: Resultado

-- Checa cada um dos jogos. Quando coincide com o resultado, retorna 1 somado a checagem dos demais jogos
premiados :: Resultado -> Jogos -> Int
premiados r [] = 0 -- Caso base é quando testarmos todos os jogos
premiados [] (j:js) = 0 -- Para o caso hipotético em que o resultado é vazio 
premiados r (j:js) | r == j = (1 + (premiados r js))
                   | otherwise = (premiados r js)

-- Compara o resultado com um jogo e retorna quantos acertos aquele jogo teve
mitnick :: Resultado -> [Int] -> Int
mitnick _ [] = 0 -- Caso base é quando testarmos todos os jogos
mitnick [] _ = 0 -- Para o caso hipotético em que o resultado é vazio
mitnick (r:rs) (j) | elem r j = (1 + mitnick rs j) 
                   | otherwise = (mitnick rs j)

-- Chama comparação de cada jogo e retorna a lista com quantos acertos cada um dos jogos teve
acertos :: Resultado -> Jogos -> [Int]
acertos r [] = [] -- Caso base é quando testarmos todos os jogos
acertos [] (j:js) = [] -- Para o caso hipotético em que o resultado é vazio
acertos r (j:js) = (mitnick r j):(acertos r js)

-- Conta quantas vezes um inteiro "q" aparece em uma lista "(a:as)"
turing :: [Int] -> Int -> Int
turing [] _ = 0
turing (a:as) q | a == q = (1 + (turing as q))
                | otherwise = (turing as q)

numPremios :: Resultado -> Jogos -> (Int, Int, Int)
numPremios r j = ((turing (acertos r j) 4),(turing (acertos r j) 5),(turing (acertos r j) 6))






















