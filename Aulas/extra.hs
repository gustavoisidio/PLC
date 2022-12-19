import Prelude hiding (Maybe (..))
import Data.List


import System.Environment (getArgs)

interactWith function inputFile outputFile = do
    input <- readFile inputFile

    writeFile outputFile (function input)

main = mainWith myFunction
    where mainWith function = do
        args <- getArgs
        case args of
            [input,output] -> interactWith function input output
            _ -> putStrLn "error: exactly two arguments needed"
    
            -- replace "id" with the name of our function below myFunction = id 

            myFunction = id
         
myDrop n xs = if n <= 0 || null xs
              then xs
              else myDrop (n - 1) (tail xs)

complicated (a, (x:xs), (c, b), 8) = (xs, b)

data BookInfo = Book Int String [String]
                deriving (Show)


data MagazineInfo = Magazine Int String [String]
                    deriving (Show)

myInfo = Book 9780135072455 "Algebra of Programming" ["Richard Bird", "Oege de Moor"]


data BookReview = BookReview BookInfo CustomerID String
type CustomerID = Int
type ReviewBody = String
data BetterReview = BetterReview BookInfo CustomerID ReviewBody
type BookRecord = (BookInfo, BookReview)

bookID (Book id title authors) = id
bookTitle (Book id title authors) = title
bookAuthors (Book id title authors) = authors

nicerID (Book id _ _ ) = id
nicerTitle (Book _ title _ ) = title
nicerAuthors (Book _ _ authors) = authors

type Address = [String]

data Customer = Customer {
            customerID :: CustomerID ,
            customerName :: String ,
            customerAddress :: Address
          } deriving (Show)

-- -- The same thing in other way:          
-- data Customer = Customer Int String [String]
--                 deriving (Show)

-- customerID :: Customer -> Int
-- customerID (Customer id _ _) = id

-- customerName :: Customer -> String
-- customerName (Customer _ name _) = name

-- customerAddress :: Customer -> [String]
-- customerAddress (Customer _ _ address) = address

customer2 = Customer { 
    customerID = 271828
  , customerAddress = ["1048576 Disk Drive", "Milpitas, CA 95134", "USA"]
  , customerName = "Jane Q. Citizen"
  }

data Month = January
           | February
           | March
             deriving (Eq, Show)

type Day = Int          

-- Record Syntax
data CalendarTime = CalendarTime {
    ctYear :: Int,
    ctMonth :: Month,
    ctPicosec :: Integer, 
    ctWDay :: Day,
    ctDay, ctHour, ctMin, ctSec :: Int,
    ctYDay :: Int,
    ctTZName :: String,
    ctTZ :: Int,
    ctIsDST :: Bool
}

calendarexemple = CalendarTime {
    ctYear = 2019,
    ctMonth = January,
    ctDay = 10,
    ctHour  = 17,
    ctMin = 22,
    ctSec = 02 ,
    ctPicosec = 823 ,
    ctWDay = 10,
    ctYDay = 10,
    ctTZName = "Nao sei",
    ctTZ = 00,
    ctIsDST = True
}
    
     
data Maybe a = Just a 
             | Nothing
               deriving (Show)


imotep :: Maybe t -> t
imotep (Just c) = c

casac :: String -> String
casac x = x

-- data SimpleTree = Node "parent" (Node "left child" Empty Empty)
--                                 (Node "right child" Empty Empty)
-- Empty is like null

safeSecond :: [a] -> Maybe a
safeSecond [] = Nothing
safeSecond xs = if null (tail xs)
                then Nothing
                else Just (head (tail xs))



tidySecond :: [a] -> Maybe a
tidySecond (_:x:_) = Just x
tidySecond _ = Nothing

-- ******  Local Variables
lend amount balance = let reserve = 100 -- Let inicia a declaração de variáveis 
                          newBalance = balance - amount 
                      in if balance < reserve
                         then Nothing
                         else Just newBalance

lend2 amount balance = if amount < reserve * 0.5
                       then Just newBalance
                       else Nothing
        where reserve = 100
              newBalance = balance - amount

pluralise :: String -> [Int] -> [String]
pluralise word counts = map plural counts
       where plural 0 = "no " ++ word ++ "s" -- Plural is a local function
             plural 1 = "one " ++ word
             plural n = show n ++ " " ++ word ++ "s"              
-- ****** 

splitLines :: String -> [String]
splitLines [] = []
splitLines cs =
    let (pre, suf) = break isLineTerminator cs
        isLineTerminator c = c == '\r' || c == '\n'
    in pre : case suf of
               ('\r':'\n':rest) -> splitLines rest
               ('\r':rest) -> splitLines rest
               ('\n':rest) -> splitLines rest 
               _ -> []



splitLineS :: String -> [String]
splitLineS [] = []
splitLineS cs = map deleteLineTerm (lines cs)
    where deleteLineTerm x | isLineTerminatoR (last x) = deletLeast x
                           | otherwise = x
          isLineTerminatoR c = c == '\r'    
          deletLeast m = take ((length m) - 1) m

-- unlines faz o inverso, adiciona \n 
-- isInfixOf, isPrefixOf e isSufixOf bem interessantes pra verificar substrings
-- all e any são tipo map para funções que retornam Bool 







********** Record Syntax
-- Quando criamos uma estrutura de dados como a estrutura abaixo, declarando um novo
-- tipo 'Costomer' e precisamos acessar seus elementos, se faz necessária a criação
-- de funções que retornam o elemento específico que nos interessa.


data Customer = Customer Int String [String]
                deriving (Show)

-- Para esse exemplo, precisamos criar três funções, uma para cada um dos elementos
-- de Costomer:

customerID :: Customer -> Int
customerID (Customer id _ _) = id

customerName :: Customer -> String
customerName (Customer _ name _) = name

customerAddress :: Customer -> [String]
customerAddress (Customer _ _ address) = address

-- Dessa forma, quando temos algo do tipo Customer, usamos as funções acima para extrair
-- cada elemento seu.

customer1 = Customer 129313 "Malaquias E. Santos" ["Rua Euzebio Queiroz", "Vicentino, PB, 128", "BR"] 

-- Dessa forma, a aplicação das funções no exemplo acima gera o seguinte resultado:
-- customerID customer1 --> 129313
-- customerName customer1 --> "Malaquias E. Santos"
-- customerAddress customer1 --> ["Rua Euzebio Queiroz","Vicentino, PB, 128","BR"]

-- A utilização de Record Syntax descrita abaixo traz uma forma diferente de 'data',
-- mais organizada, que exclui a necessidade de funções auxiliares. Quando trata-se
-- de um tipo com uma vasta quantidade de elementos, Record Syntax se faz ainda mais
-- prática.

type Address = [String]
type CustomerID2 = Int

data Customer2 = Customer2 {
            customerID2 :: CustomerID2 ,
            customerName2 :: String ,
            customerAddress2 :: Address
          } deriving (Show)


customer2 = Customer2 { 
    customerID2 = 271828
  , customerAddress2 = ["1048576 Disk Drive", "Milpitas, CA 95134", "USA"]
  , customerName2 = "Jane Q. Citizen"
}

-- É uma implementação semelhante a anterior onde a criação de funções não se faz necessária
-- customerID2 customer2 --> 271828
-- customerName2 customer2 --> "Jane Q. Citizen"
-- customerAddress2 customer2 --> "1048576 Disk Drive","Milpitas, CA 95134","USA"]





