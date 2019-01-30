-- A função abaixo recebe uma função, uma lista e efetua um mapeamento, aplicando
-- a função recebida em cada elemento da lista, substituindo-o pela saída dessa
-- aplicação.

mapeamento :: (Int -> Int) -> [Int] -> [Int]
mapeamento _ [] = [] 
mapeamento f (a:as)  = (f a):(mapeamento f as)

-- E é pra isso que a função map é usada. Ela recebe como parâmetros uma função,
-- uma lista e aplica essa função em cada elemento da lista. A diferença é que
-- map está definida para tipos além do Int. 



