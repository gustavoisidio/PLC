module Q3A where -- so dando nome ao modulo pra reaproveitar ele na proxima questao

data Tree t = Node t (Tree t) (Tree t) -- um nó
            |  Leaf t                   -- uma folha
            deriving Show 

valores :: Tree t -> [t]
valores t = case t of -- nesse caso é em pre-ordem, isto é valor do nó é visitado, depois valor da subárvore esquerda e posteriormente da sub árvore direita
                (Node t lbranch rbranch) -> [t] ++ valores lbranch ++ valores rbranch
                (Leaf t) -> [t]