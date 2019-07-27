-- Em Haskell, a definição de S = { 2 * x | x e N, x ≦ 10} pode ser descrita de diversas formas. Uma delas, usa um conceito chamado de "compreensao de listas"

-- [x*2 | x <- [1..10]] retorna [2,4,6,8,10,12,14,16,18,20]
-- [x*2 | x <- [1..10], x*2 >= 12] retorna [12,14,16,18,20]
-- [ x | x <- [50..100], x `mod` 7 == 3] retorna [52,59,66,73,80,87,94]

-- Dentro dessa definição, podemos, inclusive, utilizar funções como a função abaixo:
menorQue20 :: Int -> Bool
menorQue20 x = x < 20

-- Podemos utilizá-la, por exemplo, com [x | x <- [19..100000], menorQue20 x] que retorna [19]


 






