data Tree t = Node t (Tree t) (Tree t) 
            | Leaf t

testeOrdenado :: Tree Int
testeOrdenado = Node 10 (Node 5 (Leaf 3) (Leaf 6)) (Node 15 (Leaf 14) (Leaf 17))
testeNaoOrdenado :: Tree Int
testeNaoOrdenado = Node 10 (Node 5 (Leaf 3) (Leaf 6)) (Node 15 (Leaf 16) (Leaf 17))



isSortedTree :: Ord t => Tree t -> Bool
isSortedTree (Leaf y) = True
isSortedTree (Node x esq dir) | (x > (theValue esq)) && (x < (theValue dir)) = (isSortedTree dir) && (isSortedTree esq)
                              | otherwise = False


theValue :: Ord t => Tree t -> t
theValue (Leaf x) = x
theValue (Node x y z) = x  

