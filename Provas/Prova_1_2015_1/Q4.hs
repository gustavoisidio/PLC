
data Instrucao = PUSH Int
               | POP  
               | ADD
               | SUB
               | DUP
                 deriving (Show)


data Expr = Literal Int
          | Soma Expr Expr
          | Subtrai Expr Expr
          | Dobra Expr
            deriving (Show)

translate :: Expr -> [Instrucao]
translate (Literal x) = (PUSH x):[]
translate (Soma a b) = (translate b) ++ (translate a) ++ (ADD):[]
translate (Subtrai a b) = (translate b) ++ (translate a) ++ (SUB):[]
translate (Dobra a) =  (translate a) ++ (DUP):[]

ex1 = (Soma (Literal 5) (Dobra (Subtrai (Literal 4) (Literal 1)))) :: Expr 
resp1 = [PUSH 1, PUSH 4, SUB, DUP, ADD, PUSH 5, ADD] :: [Instrucao]





