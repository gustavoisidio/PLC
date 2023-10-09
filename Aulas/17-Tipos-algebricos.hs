import Prelude hiding (Maybe (..))

-- É a criação de um novo tipo partindo de outros tipos. Na prática, é como uma composição de tipos que podem ser bem definidos ou polimórficos. Esses diferentes tipos compondo um só, são diferenciados a partir de suas tags que são bastante utilizadas em casamento de padrões. Alguns desses, são definidos de forma recursiva.

-- Pares de tipos diferentes
data Pair = P Int Double
data Pair' =
    I Int
  | D Double

-- Uma lista definida de forma algébrica usando polimorfismo
data List t =
    Nil
  | Cons t (List t)
    deriving (Show)

-- Uma árvore definida de forma algébrica usando polimorfismo
data Tree t =
    NilT
  | Node t (Tree t) (Tree t)
    deriving (Show)

-- Tratamento de erros usando polimorfismo
data Maybe a =
    Just a
  | Nothing
    deriving (Show)

imotep :: Maybe t -> t
imotep (Just c) = c

casac :: String -> String
casac x = x

safeSecond :: [a] -> Maybe a
safeSecond [] = Nothing
safeSecond xs = if null (tail xs)
                then Nothing
                else Just (head (tail xs))

tidySecond :: [a] -> Maybe a
tidySecond (_:x:_) = Just x
tidySecond _ = Nothing


