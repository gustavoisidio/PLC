-- 1) (2.5 pontos) Escreva uma função merge :: [Int] -> [Int] -> [Int] que combina
-- os elementos da primeira lista (que já estão ordenados) com os da segunda lista
-- (também já ordenados), retornando a lista que contém a lista ordenada de todos os números das duas listas

-- exemplos:
-- merge [2,6,7,9] [2,3,5] ===> [2,2,3,5,6,7,9]
-- merge [2,6,9] [2,3,5] ===> [2,2,3,5,6,9]
-- merge [1,2,3,4,5] [1,2,3,4,5] ===> [1,1,2,2,3,3,4,4,5,5]

qSort :: [Int] -> [Int]
qSort list = case list of
                [] -> []
                [unit] -> [unit]
                (f:fs) -> qSort beforeList ++ [f] ++ qSort afterList
                    where
                        beforeList = [elem | elem <- fs, elem <= f]
                        afterList = [elem | elem <- fs, elem > f]


merge :: [Int] -> [Int] -> [Int]
merge f s = qSort (f++s)


-- (2) (2.5 pontos) Escreva uma função maiorDigito :: String -> Int que retorne
-- o maior dígito de uma string, retornando zero se a string não tiver dígitos. Por exemplo:

-- maiorDigito "Inf1-FP" ===> 1
-- maiorDigito "Functional" ===> 0
-- maiorDigito "1+1=2" ===> 2
-- maiorDigito "3.157/3 > 19"  ===> 9

-- função auxiliar:

-- toNumber :: Char -> Int
-- toNumber ch = fromEnum ch - fromEnum '0'

toNumber :: Char -> Int
toNumber ch = fromEnum ch - fromEnum '0'

maiorDigito :: String -> Int
maiorDigito s = case s of
                    [] -> 0-- note que toNumber tem o maior valor possível quando o dígito é 9 e o menor quando é 0, logo devemos garantir que o valor testado está entre 9 e 0
                    _ -> foldl (\acc cur -> if max (toNumber cur) acc > 9 || (toNumber cur < 0) then acc else toNumber cur) 0 s

-- (3) Dada uma árvore binária definida pelo tipo abaixo, que possui nós (com um valor e duas
--sub-árvores) e folhas (com um valor):

data Tree t = Node t (Tree t) (Tree t) -- um nó
            |  Leaf t                   -- uma folha
            deriving Show 

-- implemente as seguintes funções

-- (a) (2,5 pontos)  valores :: Tree t -> [t]
-- uma função que recebe uma árvore e retorna a lista de todos os valores que estão nela

valores :: Tree t -> [t]
valores t = case t of -- nesse caso é em pre-ordem, isto é valor do nó é visitado, depois valor da subárvore esquerda e posteriormente da sub árvore direita
                (Node t lbranch rbranch) -> [t] ++ valores lbranch ++ valores rbranch
                (Leaf t) -> [t]

-- (b) (2.5 pontos) combina :: (t -> t -> t) -> Tree t -> t
-- uma função que recebe uma função de combinação, uma árvore, e combina seus
-- elementos usando essa função de combinação.

combina :: (t -> t -> t) -> Tree t -> t
combina f t = foldl1 f $ valores t -- usamos foldl1 para considerar o valor inicial de foldl como sendo o primeiro elemento da lista

-- exemplos:
-- arvore :: Tree Int
-- arvore = Node 0 (Node 0 (Leaf 10) (Node 0 (Leaf 15) (Leaf 8))) (Node 0 (Node 0 (Leaf 2) (Node 0 (Leaf 3) (Leaf 4))) (Leaf 0))
-- valores arvores ===> [10,15,8,2,3,4,0] -- pode ser qualquer ordem
-- combina (+) arvore ===> 10 + 15 + 8 + 2 + 3 + 4 + 0 ===> 42
