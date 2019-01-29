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


