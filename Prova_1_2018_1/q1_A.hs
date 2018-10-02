data Time = Australia | Dinamarca | Franca | Peru |
            Argentina | Croacia | Islandia | Nigeria deriving (Show, Eq)

type Jogo = (Time, Int, Time, Int)



-- A)
bakur :: Time -> Jogo -> Int
bakur timeq (time1, g1, time2, g2) | timeq == time1 = g1
                                   | timeq == time2 = g2
                                   | otherwise = 0

gols :: Time -> [Jogo] -> Int
gols _ [] = 0
gols timeq (x:xs) = (bakur timeq x) + (gols timeq xs)
  



