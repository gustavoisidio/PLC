toNumber :: Char -> Int
toNumber ch = fromEnum ch - fromEnum '0'

maiorDigito :: String -> Int
maiorDigito s = case s of
                    [] -> 0-- note que toNumber tem o maior valor possível quando o dígito é 9 e o menor quando é 0, logo devemos garantir que o valor testado está entre 9 e 0
                    _ -> foldl (\acc cur -> if max (toNumber cur) acc > 9 || (toNumber cur < 0) then acc else toNumber cur) 0 s
