logSetembro = "2016-09-27;19:31:52;Normal;208772;\n2016-09-27;18:12:02;Normal;155759;\n2016-09-26;17:12:02;Normal;155759;\n2016-09-26;16:11:02;Denied;188758;\n2016-09-25;19:12:02;Normal;155759;" :: String

type Dia = String
type Hora = String
type Usuario = String

data LogEntry = Permitido Dia Hora Usuario
              | Negado Dia Hora Usuario
                deriving Show

strToInt :: String -> Int
strToInt str = read str

converte :: String -> [LogEntry]
converte str = map convlogEntry (lines str)

breakItems :: String -> [String]
breakItems [] = []
breakItems str = takeWhile (/= ';') str : breakItems (tail (dropWhile (/= ';') str))

convlogEntry str = case item of
                     [day, time, "Normal", user] -> Permitido day time user
                     [day, time, "Denied", user] -> Negado day time user
  where item = breakItems str