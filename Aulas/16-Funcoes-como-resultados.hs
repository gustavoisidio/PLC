Uma função que retorna uma função. Abaixo, temos duas funções simples maisDois e quadrado, além de uma terceira função que recebe duas funções como parâmetros e retorna também uma função.

maisDois :: Int -> Int
maisDois x = x + 2

quadrado :: Int -> Int
quadrado x = x ^ 2

composicao :: (Int -> Int) -> (Int -> Int) -> (Int -> Int)
composicao f q = f . q

Nesse caso, a chamada (composicao maisDois quadrado) 3 retorna 11, uma vez que (3 ^ 3) + 2 = 11. Como (composicao maisDois quadrado) é uma função, ela fica aguardando por seu argumento que, nesse caso, é 3.
Após isso, é possível entender bem a função Iter abaixo. Ela recebe um inteiro n e uma função f. Iter retorna uma função que é resultado de n composições de f. 

iter :: Int -> (t -> t) -> (t -> t)
iter 0 f = id
iter n f = (iter (n-1) f).f

