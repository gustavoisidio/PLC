-- QuickSort simples

qSort :: [Int] -> [Int]
qSort [] = []
qSort (x:xs) = qSort esquerda ++ [ x ] ++ qSort direita
    where esquerda = qSort [y | y <- xs, y < x]
          direita = qSort [y | y <- xs, y >= x]

-- QuickSort em tuplas com respeito a um determinado elemento

qSortTuple :: [(String, Int, Double)] -> [(String, Int, Double)] 
qSortTuple [] = []
qSortTuple ((a, b, c):xs) = qSortTuple esquerda ++ [(a, b, c)] ++ qSortTuple direita
    where esquerda = [(a, y, c) | (a, y, c) <- xs, y < b] 
          direita = [(a, y, c) | (a, y, c) <- xs, y >= b]

cali :: [(String, Int, Double)]
cali = [("asdajysdasf", 20, 84.9), ("asdassssdasf", 6, 22.5), ("asdasdasf", 10, 5.3), ("asdasxsqdasf", 1, 0.2), ("asdassssdasf", 6, 22.5)]
