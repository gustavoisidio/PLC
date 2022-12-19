type Grupo = (Char, Time, Time, Time, Time)

data Time = Egito | Russia | Arabia | Uruguai |
            Ira | Marrocos | Portugal | Espanha
            deriving (Show, Eq)

type Jogo = (Time, Int, Int, Time) 

type Tabela = (Time, Int, Int, Int)

grupo1 = ('A', Egito, Russia, Arabia, Uruguai) :: Grupo

jogos1 :: [Jogo]
jogos1 = [(Egito, 1, 3, Russia), (Arabia, 0, 3, Uruguai), 
          (Egito, 0, 0, Arabia),(Russia, 0, 2, Uruguai), 
          (Russia, 2, 0, Arabia), (Egito, 0, 2, Uruguai), 
          (Ira, 1, 1, Marrocos), (Portugal, 2, 2, Espanha), 
          (Ira, 1, 2, Portugal), (Ira, 0, 1, Espanha), 
          (Marrocos, 0, 3, Portugal), (Marrocos, 1, 1, Espanha)]


-- Jogos grupo 1
-- [(Egito,1,3,Russia),(Arabia,0,3,Uruguai),(Egito,0,0,Arabia),(Russia,0,2,Uruguai),(Russia,2,0,Arabia),(Egito,0,2,Uruguai)]

-- Pontos grupo 1
-- Egito = 1 
-- Russia = 6
-- Arabia = 1 
-- Uruguai = 9

-- Saldo de gols grupo 1
-- Egito = -4
-- Russia = 2
-- Arabia = -5
-- Uruguai = 7

-- Gols Feitos grupo 1
-- Egito = 1
-- Russia = 5 
-- Arabia = 0
-- Uruguai = 7

-- Tabela grupo 1
-- [(Egito,1,-4,1),(Russia,6,2,5),(Arabia,1,-5,0),(Uruguai,9,7,7)]

pertence :: Time -> Grupo -> Bool
pertence x (_, a, b, c, d) = (x == a) || (x == b) || (x == c) || (x == d)

clearJogos :: [Jogo] -> Grupo -> [Jogo]
clearJogos [] _ = []
clearJogos ((t1, g1, g2, t2):js) g | (pertence t1 g) && (pertence t2 g) = (t1, g1, g2, t2) : (clearJogos js g)
                                   | otherwise = clearJogos js g

getTimes :: Grupo -> [Time]
getTimes (_, a, b, c, d) = a:b:c:d:[]

getGolsFeitos :: Time -> [Jogo] -> Int
getGolsFeitos _ [] = 0
getGolsFeitos t ((t1, g1, g2, t2):js) | (t == t1) = g1 + (getGolsFeitos t js)
                                      | (t == t2) = g2 + (getGolsFeitos t js)
                                      | otherwise = (getGolsFeitos t js)

getGolsTomados :: Time -> [Jogo] -> Int
getGolsTomados _ [] = 0
getGolsTomados t ((t1, g1, g2, t2):js) | (t == t2) = g1 + (getGolsTomados t js)
                                       | (t == t1) = g2 + (getGolsTomados t js)
                                       | otherwise = (getGolsTomados t js)

getSaldoGols :: Time -> [Jogo] -> Int
getSaldoGols t j = (getGolsFeitos t j) - (getGolsTomados t j)

getPontos :: Time -> [Jogo] -> Int
getPontos _ [] = 0
getPontos t ((t1, g1, g2, t2):js) | (t == t1) = (gp1 g1 g2) + (getPontos t js)
                                  | (t == t2) = (gp2 g1 g2) + (getPontos t js)
                                  | otherwise = (getPontos t js)

gp1 :: Int -> Int -> Int
gp1 g1 g2 | g1 > g2 = 3
          | g1 == g2 = 1
          | otherwise = 0

gp2 :: Int -> Int -> Int
gp2 g1 g2 | g2 > g1 = 3
          | g2 == g1 = 1
          | otherwise = 0

makeTabela :: Grupo -> [Jogo] -> [Tabela]
makeTabela (_, a, b, c, d) js = (linha a):(linha b):(linha c):(linha d):[]
    where linha x = (x, getPontos x js, getSaldoGols x js, getGolsFeitos x js) 


qSortTuple :: [(Time, Int, Int, Int)] -> [(Time, Int, Int, Int)] 
qSortTuple [] = []
qSortTuple ((a, b, c, d):xs) = qSortTuple [(a, y, c, d) | (a, y, c, d) <- xs, y < b] ++ [(a, b, c, d)] ++ qSortTuple [(a, y, c, d) | (a, y, c, d) <- xs, y >= b]



-- classificados :: Grupo -> [Jogo] -> (Time, Time)

