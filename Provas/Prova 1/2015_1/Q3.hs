
data Instrucao = PUSH Int
               | POP 
               | ADD
               | SUB
               | DUP
                 deriving (Show)

type Pilha = [Int]                 
               
mumbai :: Instrucao -> Pilha -> Pilha
mumbai (PUSH x) [] = [x]
mumbai (PUSH x) (p:ps) = (x:p:ps) 
mumbai (POP) (p:ps) = (ps)
mumbai (ADD) (p:pp:ps) = ((p+pp):ps)
mumbai (SUB) (p:pp:ps) = ((p-pp):ps)
mumbai (DUP) (p:ps) = (p:p:ps) 

interpretador :: [Instrucao] -> Pilha -> Pilha
interpretador [] (p) = (p)
interpretador (x:xs) (p) = (interpretador xs (mumbai x (p)))























