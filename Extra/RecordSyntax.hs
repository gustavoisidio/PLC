-- data BookReview = BookReview BookInfo CustomerID String
-- type CustomerID = Int
-- type ReviewBody = String
-- data BetterReview = BetterReview BookInfo CustomerID ReviewBody
-- type BookRecord = (BookInfo, BookReview)

-- bookID (Book id title authors) = id
-- bookTitle (Book id title authors) = title
-- bookAuthors (Book id title authors) = authors

-- nicerID (Book id _ _ ) = id
-- nicerTitle (Book _ title _ ) = title
-- nicerAuthors (Book _ _ authors) = authors

-- type Address = [String]

-- data Customer = Customer {
--             customerID :: CustomerID ,
--             customerName :: String ,
--             customerAddress :: Address
--           } deriving (Show)

-- The same thing in other way:          

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

customer1 = Customer { 
    customerID = 271828
  , customerAddress = ["1048576 Disk Drive", "Milpitas, CA 95134", "USA"]
  , customerName = "Jane Q. Citizen"
}










