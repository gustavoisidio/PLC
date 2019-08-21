sumList :: [ Int ] -> Int
sumList [  ] = 0
sumList ( x:xs ) = x + sumList xs

digits :: String -> String
digits x = clear "0123456789" x
    where clear numeros [] = []
          clear numeros ( a:as )
            | elem a numeros = a : digits as
            | otherwise = digits as

firstDigit :: String -> Char
firstDigit st = case ( digits st ) of
                []          -> '\0'
                ( a:as )    -> a
 




