maiorQue10 :: Int -> IO()
maiorQue10 x 
    | x > 10 = putStr "Eh maior mesmo\n"
    | otherwise = putStr "Nao eh maior nada\n"

printXVezes :: Int -> String -> IO()
printXVezes x y = putStr (printXVezes2 x y) 
    
printXVezes2 :: Int -> String -> String
printXVezes2 x y
    | x == 0 = ""
    | otherwise = ( y ++ "\n" ) ++ ( printXVezes2 ( x - 1 ) y )  

printXVezes3 :: Int -> String -> String
printXVezes3 0 _ = "" 
printXVezes3 x y = ( y ++ "\n" ) ++ ( printXVezes3 ( x - 1 ) y )    



