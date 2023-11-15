import Q3A -- importando (Tree t) e a funcao valores :: Tree t -> [t]

combina :: (t -> t -> t) -> Tree t -> t
combina f t = foldl1 f $ valores t -- usamos foldl1 para considerar o valor inicial de foldl como sendo o primeiro elemento da lista
