
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

p1 = [PUSH 1, PUSH 4, DUP, PUSH 5, PUSH 3, PUSH 7, PUSH 99, ADD, POP, POP, POP, POP, POP, POP, PUSH 3, PUSH 5, SUB, PUSH 2] :: [Instrucao]
-- [2, 2]


data Comando = Leftt
             | Rightt
             | Forward Int
             | Backward Int
               deriving (Show)

data Direcao = Norte
             | Sul
             | Leste
             | Oeste          
               deriving (Show)     

direction :: [Comando] -> (Int, Int)
direction x = budapest x Norte (0, 0)
c1 = [Forward 2, Leftt, Forward 2, Leftt, Forward 4, Leftt, Rightt, Forward 1, Rightt, Forward 1, Rightt, Forward 7, Backward 4, Rightt, Rightt, Leftt, Leftt, Forward 1] :: [Comando]
-- (0,1)

-- c2 = [FORWARD 2, LEFT, FORWARD 2, LEFT, FORWARD 4, LEFT, FORWARD 3, RIGHT, FORWARD 1, RIGHT, FORWARD 1, RIGHT, FORWARD 7, BACKWARD 4, RIGHT, RIGHT, LEFT, LEFT, FORWARD 1] :: [Comando]
-- -- (0,1)

budapest :: [Comando] -> Direcao -> (Int, Int) -> (Int, Int)
budapest [] (dir) (x, y) = (x, y)
budapest ((Leftt):ms) (dir) (x, y) = (budapest ms (goLeftt dir) (x, y))
budapest ((Rightt):ms) (dir) (x, y) = (budapest ms (goRightt dir) (x, y))
budapest ((Forward s):ms) (dir) (x, y) = (budapest ms dir (goFor dir (x, y) s))
budapest ((Backward s):ms) (dir) (x, y) = (budapest ms dir (goBack dir (x, y) s))

goLeftt :: Direcao -> Direcao
goLeftt (Norte) = (Oeste)
goLeftt (Sul) = (Leste)
goLeftt (Leste) = (Norte)
goLeftt (Oeste) = (Sul)

goRightt :: Direcao -> Direcao
goRightt (Norte) = (Leste)
goRightt (Sul) = (Oeste)
goRightt (Leste) = (Sul)
goRightt (Oeste) = (Norte)

goFor :: Direcao -> (Int, Int) -> Int -> (Int, Int)
goFor (Norte) (x, y) s = (x, y+s)
goFor (Sul) (x, y) s = (x, y-s)
goFor (Leste) (x, y) s = (x+s, y)
goFor (Oeste) (x, y) s = (x-s, y)

goBack :: Direcao -> (Int, Int) -> Int -> (Int, Int)
goBack (Norte) (x, y) s = (x, y-s)
goBack (Sul) (x, y) s = (x, y+s)
goBack (Leste) (x, y) s = (x-s, y)
goBack (Oeste) (x, y) s = (x+s, y)



    --          Norte
    -- Oeste            Leste
    --           Sul










