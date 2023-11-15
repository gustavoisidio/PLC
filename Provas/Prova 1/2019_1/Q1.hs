
-- Q1
meio :: String -> Int -> Int -> String
meio ( a:as ) 1 y = take y ( a:as )
meio ( a:as ) x y = meio as ( x-1 ) y

