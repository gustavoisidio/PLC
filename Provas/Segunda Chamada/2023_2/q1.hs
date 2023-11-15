qSort :: [Int] -> [Int]
qSort list = case list of
                [] -> []
                [unit] -> [unit]
                (f:fs) -> qSort beforeList ++ [f] ++ qSort afterList
                    where
                        beforeList = [elem | elem <- fs, elem <= f]
                        afterList = [elem | elem <- fs, elem > f]


merge :: [Int] -> [Int] -> [Int]
merge f s = qSort (f++s)