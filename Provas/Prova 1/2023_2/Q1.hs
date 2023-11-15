insert :: [t] -> [t] -> Int -> [t]
insert flist slist insorder = case slist of
                                [] -> flist
                                l -> case length slist < insorder of
                                        True -> slist ++ flist          -- Se a posição é maior que o tamanho da lista então insira no final
                                        False -> [slist!!elemBefore | elemBefore <- [0 .. insorder-1]] ++ flist ++ [slist!!elemAfter | elemAfter <- [insorder .. length slist -1]]
                                        