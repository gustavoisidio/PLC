-- 1 ) (2.5) Defina uma função que insira uma lista (primeiro parâmetro) em uma outra lista (segundo parâmetro) em uma posição informada (terceiro parâmetro). 
-- Se a posição por menor ou igual a zero insira a primeira lista no início da segunda lista;
-- se for igual ou maior que o tamanho da segundo lista, insira ela no final.

-- insert :: [t] -> [t] -> Int -> [t]

-- exemplo: insert "abc" "xyz 123 def" 4 --> "xyz abc123 def"
-- exemplo: insert "abc" "xyz 123 def" 0 --> "abcxyz 123 def"
-- exemplo: inesrt [1,2] [3,4,5,6] 10 --> [3,4,5,6,1,2]

insert :: [t] -> [t] -> Int -> [t]
insert flist slist insorder = case slist of
                                [] -> flist
                                l -> case length slist < insorder of
                                        True -> slist ++ flist          -- Se a posição é maior que o tamanho da lista então insira no final
                                        False -> [slist!!elemBefore | elemBefore <- [0 .. insorder-1]] ++ flist ++ [slist!!elemAfter | elemAfter <- [insorder .. length slist -1]]

-- 2) (2.5) Defina uma função que informa em que posição um elemento (primeiro parametro) ocorre um uma lista (segundo parâmetro). 
-- Caso ele não ocorra você deve retornar o resultado (-1).
-- Considere que primeira posição de uma lista é a posição zero.

-- search :: Eq t => t -> [t] - > Int

-- exemplo: search 'a' "xy wxy ab def abc xyz" ---> 7
-- exemplo: search 'z' "xy wxy ab def abc xyz" ---> 20
-- exemplo: search 1 [1,2,3,4,5,6,7,8,22] ---> 0
-- exemplo: search 'k' "xy wxy ab dxefy abc xyz" ---> -1

search :: Eq t => t -> [t] -> Int
search searching list = case list of
                            [] -> (-1)
                            [unit] -> if unit == searching then 0 else (-1)
                            _ -> case numIndexVisited /= length list of -- talvez esteja no final, mas se não estiver o valor retornado é o tamanho da lista o que seria incorreto
                                        True -> numIndexVisited
                                        False -> if last list == searching then numIndexVisited else (-1)
                            where -- _ e otherwise ou l seriam equivalentes nesse caso
                                numIndexVisited = length $ takeWhile (/= searching) list

-- 3) (2.5) Dado o tipo de dados abaixo, que representa as horas do dia em formato de 12h pela manhã (AM) e 12h a partir de meio dia (PM), defina uma função em que sejam
-- adicionados minutos a uma hora do dia, considerando a possível mudan¸ca de turno. 
-- assuma que o formato da hora é vaálido e que serão somados no máximo 719 minutos.

data TimeOfDay = AM Int Int -- hora e minuto antes do meio dia
                | PM Int Int -- hora e minuto após o meio dia
                deriving (Show)

extraTime :: Int -> Int -> Int -> (Int, (Int, Int))
extraTime h m a= (totalTime, (newHour, newMinutes))
    where
        totalTime = h*60 + (m + a)
        newHour = totalTime `div` 60
        newMinutes = totalTime `mod` 60

somaMinutos :: TimeOfDay -> Int -> TimeOfDay
somaMinutos curTime addedTime = case curTime of
                                    (AM h m) -> (if fst newTime > 720 then uncurry PM (snd newTime) else uncurry AM (snd newTime))
                                        where
                                            newTime = extraTime h m addedTime
                                    (PM h m) -> (if fst newTime > 720 then uncurry AM (snd newTime) else uncurry PM (snd newTime))
                                        where
                                            newTime = extraTime h m addedTime

-- somaMinutos :: TimeOfDay -> Int -> TimeOfDay

-- exemplo: somar 30 minutos ás 11:59 da manhã:
-- exemplo: somaMinutos (AM 11 59) 30 --> PM 12 29
--exemplo: somaMinutos (PM 10 28) 22 --> PM 10 50

-- 4) (2.5) Dado o tipo de dados abaixo, que indica se um valor é vaálido ou inválido (incorreto) defina uma função em que seja passado um valor de hora e minutos em formato de 24h e a função converta pra o formato TimeOfDay, se for possível, 
-- retornando o resultado com o construtor Success e a hora no novo formato, ou retornando Fail (falha/erro) se o formato for inválido (não for menor que 24 ou os mintutos não fqorem menores que 60).

data Resultado t = Success t | Fail
                    deriving Show

convertTime :: Int -> Int -> Resultado TimeOfDay
convertTime h m
  | h > 24 || h < 0 = Fail
  | m > 60 || m < 0 = Fail
  | otherwise = Success (if h < 12 then AM h m else PM h m)

-- convertTime :: Int -> Int -> Resultado TimeOfDay

-- exemplo: converter a hora 22:10
-- convertTime 22 10 ---> Success (PM 10 10)
-- convertTime 24 62 ---> Fail
