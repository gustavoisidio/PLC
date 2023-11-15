search :: Eq t => t -> [t] -> Int
search searching list = case list of
                            [] -> (-1)
                            [unit] -> if unit == searching then 0 else (-1)
                            _ -> case numIndexVisited /= length list of -- talvez esteja no final, mas se não estiver o valor retornado é o tamanho da lista o que seria incorreto
                                        True -> numIndexVisited
                                        False -> if last list == searching then numIndexVisited else (-1)
                            where -- _ e otherwise ou l seriam equivalentes nesse caso
                                numIndexVisited = length $ takeWhile (/= searching) list
