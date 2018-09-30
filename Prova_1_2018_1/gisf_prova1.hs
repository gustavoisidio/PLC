-- Prova 1 - 2018.1 - Gustavo Isidio dos Santos Filho (gisf)

data Time = Australia | Dinamarca | Franca | Peru |
            Argentina | Croacia | Islandia | Nigeria deriving (Show, Eq)

type Jogo = (Time, Int, Time, Int)



-- Questao 1 A)
bakur :: Time -> Jogo -> Int
bakur timeq (time1, g1, time2, g2) | timeq == time1 = g1
                                   | timeq == time2 = g2
                                   | otherwise = 0

gols :: Time -> [Jogo] -> Int
gols _ [] = 0
gols timeq (x:xs) = (bakur timeq x) + (gols timeq xs)

-- Questao 1 B)

siria :: Time -> Jogo -> Int
siria timeq (time1, g1, time2, g2) | timeq == time1 = g2
                                   | timeq == time2 = g1
                                   | otherwise = 0

golsTomados :: Time -> [Jogo] -> Int
golsTomados _ [] = 0
golsTomados timeq (x:xs) = (siria timeq x) + (golsTomados timeq xs)

saldo :: Time -> [Jogo] -> Int
saldo timeq jogos = (gols timeq jogos) - (golsTomados timeq jogos)

-- Questao 1 C)


nairobi :: Time -> Jogo -> Int -- pra saber se o time ta naquela tupla e chamar pra calcular pontos
nairobi timeq (time1, g1, time2, g2) | timeq == time1 = (montecarlo g1 g2)
                                     | timeq == time2 = (montecarlo g2 g1)
                                     | otherwise = 0

montecarlo :: Int -> Int -> Int -- retorna o saldo do time em questao naquela partida
montecarlo a b | a > b = 3
               | a == b = 1
               | otherwise = 0                                   

pontos :: Time -> [Jogo] -> Int
pontos _ [] = 0
pontos timeq (j:js) = (nairobi timeq j) + (pontos timeq js)







aex = [(Australia, 3, Dinamarca, 1), (Australia, 0, Dinamarca, 1), (Australia, 1, Dinamarca, 1), (Australia, 3, Dinamarca, 1), (Australia, 3, Dinamarca, 3)]  :: [Jogo]

jogoex = (Australia, 3, Dinamarca, 1) :: Jogo
jogoex2 = (Australia, 0, Dinamarca, 1) :: Jogo
jogoex3 = (Australia, 1, Dinamarca, 1) :: Jogo










type Grupo = (Char, Time, Time, Time, Time) -- Questao 1 D)
-- Questao 1 E)


gp1 = ('C', Australia, Dinamarca, Franca, Peru) :: Grupo

classificados :: Grupo -> [Jogo] -> (Time, Time)
classificados gp (j:js) = (Australia, Australia)

pontuacaoGrupo :: Grupo -> [Jogo] -> [(Time, Int, Int)]
pontuacaoGrupo (gp, t1, t2, t3, t4) jogos = (t1, (pontos t1 jogos), (gols t1 jogos)) : (t2, (pontos t2 jogos), (gols t2 jogos)) : (t3, (pontos t3 jogos), (gols t3 jogos)) : (t4, (pontos t4 jogos), (gols t4 jogos)) : []

pontua1 = [(Australia,8,10),(Dinamarca,5,7),(Franca,0,0),(Peru,0,0)] :: [(Time, Int, Int)]

mTimes :: [(Time, Int, Int)] -> [Time]
mTimes [] = []
mTimes ((t1, p1, g1):ts) = t1 : (mTimes ts)

mPontos :: [(Time, Int, Int)] -> [Int]
mPontos [] = []
mPontos ((t1, p1, g1):ts) = p1 : (mPontos ts)

mGols :: [(Time, Int, Int)] -> [Int]
mGols [] = []
mGols ((t1, p1, g1):ts) = g1 : (mGols ts)

-- Tabela com times, pontos e gols
tabTimes = mTimes pontua1 :: [Time]
tabPontos = mPontos pontua1 :: [Int]
tabGols = mGols pontua1 :: [Int]

maxPontos :: [Time] -> [Int] -> [Int] -> (Time, Int, Int)
maxPontos (t:ts) (p:ps) (g:gs) | (p == maximum (p:ps)) = (t, p, g)
                               | otherwise = (maxPontos ts ps gs)

        
-- maxTabelaPontos :: [Time] -> [Int] -> [Int] -> [(Time, Int, Int)]
-- maxTabelaPontos [] [] [] = []
-- maxTabelaPontos t p g = primeiro : maxPontos(remove (maxPontos t p g)) : maxPontos(remove maxPontos(remove (maxPontos t p g))) : maxPontos(remove maxPontos(remove (remove (maxPontos t p g))))
--          where primeiro = (maxPontos t p g)
--                segundo = maxPontos

remove :: (Time, Int, Int) -> [(Time, Int, Int)] -> [(Time, Int, Int)]
remove _ [] = []
remove (t, p, g) ((xt, xp, xg):xs) | t == xt = xs
                                   | otherwise = (xt, xp, xg) : (remove (t, p, g) xs)


{-
Tentei construir funcoes que montariam a tabela conforme o maior numero de pontos
e o maior numero de gols para os casos em que ocorresse a falha
maxPontos, por exemplo, retornaria o time com maior numero de pontos.
Entretanto, não consegui finalizar tudo a tempo
-}






