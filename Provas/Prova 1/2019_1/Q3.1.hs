-- Q3.1
data Comando = ParaFrente Int
              | ParaTras Int
              | Escreva Char
              deriving (Show, Eq)
   
 posicaofinal :: String -> [ Comando ] -> Int
 posicaofinal _ [ ] = 1
 posicaofinal a ( ( ParaFrente b ) : bs ) = ( posicaofinal a bs ) + b
 posicaofinal a ( ( ParaTras b ) : bs ) = ( posicaofinal a bs ) - b
 posicaofinal a ( _:bs ) = posicaofinal a bs
