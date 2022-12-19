data Tree t = Node t (Tree t) (Tree t) 
            | Leaf t

isSortedTree :: Ord t => Tree t -> Bool
isSortedTree (Leaf x) = True
isSortedTree (Node x (a) (b)) = ((rootValue a) <= x) && ((rootValue b) > x) && (isSortedTree a) && (isSortedTree b)

rootValue :: Tree t -> t
rootValue (Leaf x) = x
rootValue (Node x (a) (b)) = x

-- testeOrdenado :: Tree Int
exO = Node 10 (Node 5 (Leaf 3) (Leaf 6)) (Node 15 (Leaf 14) (Leaf 17)) :: Tree Int
-- testeNaoOrdenado :: Tree Int
exNO = Node 10 (Node 5 (Leaf 3) (Leaf 6)) (Node 15 (Leaf 16) (Leaf 17)) :: Tree Int