sumCaracteres :: Char -> Char -> Int
sumCaracteres x y = ( fromEnum x ) + ( fromEnum y )
intToString :: Int -> String
intToString x = show x

stringToInt :: String -> Int 
stringToInt x = read x

sumStrings :: String -> String -> String
sumStrings x y = show xy
    where xy = xval + yval
          xval = read x
          yval = read y

