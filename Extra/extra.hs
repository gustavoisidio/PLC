

import Prelude hiding (Maybe (..))


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

data CalendarTime = CalendarTime {
    ctYear :: Int,
    ctMonth :: Month,
    ctDay, ctHour, ctMin, ctSec :: Int,
    ctPicosec :: Integer, 
    ctWDay :: Day,
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






