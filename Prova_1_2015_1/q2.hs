type Resultado = [Int]
type Jogos = [[Int]]

-- Um exemplo de jogo com 2 premiados
exJogo = [[12,13,14,15,16,17], [1, 2, 3, 4, 5, 6], [6,7,8,9,10,11], [12,13,14,15,16,17]]  :: Jogos
exResultado = [12,13,14,15,16,17] :: Resultado

-- Checa cada um dos jogos. Quando coincide com o resultado, retorna 1 somado a checagem dos demais jogos
premiados :: Resultado -> Jogos -> Int
premiados r [] = 0 -- Caso base é quando testarmos todos os jogos
premiados [] (j:js) = 0 -- Para o caso hipotético em que o resultado é vazio 
premiados r (j:js) | r == j = (1 + (premiados r js))
                   | otherwise = (premiados r js) 

