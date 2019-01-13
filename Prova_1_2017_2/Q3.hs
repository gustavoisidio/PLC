
data Comando = TurnLeft
             | TurnRight
             | Forward Int
             | Backward Int
               deriving (Show)

data Direcao = Norte
             | Sul
             | Leste
             | Oeste          
               deriving (Show)     

destination :: (Int, Int) -> [Comando] -> (Int, Int)
destination (i,o) x = budapest x Norte (0, 0)

budapest :: [Comando] -> Direcao -> (Int, Int) -> (Int, Int)
budapest [] (dir) (x, y) = (x, y)
budapest ((TurnLeft):ms) (dir) (x, y) = (budapest ms (goTurnLeft dir) (x, y))
budapest ((TurnRight):ms) (dir) (x, y) = (budapest ms (goTurnRight dir) (x, y))
budapest ((Forward s):ms) (dir) (x, y) = (budapest ms dir (goFor dir (x, y) s))
budapest ((Backward s):ms) (dir) (x, y) = (budapest ms dir (goBack dir (x, y) s))

goTurnLeft :: Direcao -> Direcao
goTurnLeft (Norte) = (Oeste)
goTurnLeft (Sul) = (Leste)
goTurnLeft (Leste) = (Norte)
goTurnLeft (Oeste) = (Sul)

goTurnRight :: Direcao -> Direcao
goTurnRight (Norte) = (Leste)
goTurnRight (Sul) = (Oeste)
goTurnRight (Leste) = (Sul)
goTurnRight (Oeste) = (Norte)

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
