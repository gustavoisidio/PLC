
-- Questão 1
lisbon :: [Int] -> String
lisbon [] = []
lisbon (x:xs) = (show x) ++ (lisbon xs) 

cairo :: String -> Int -> Int
cairo [] y = 0
cairo (x:xs) y | (read (x:[])) == y  = (1 + (cairo xs y))
               | otherwise =  (cairo xs y)

quantidade :: Int -> Int -> Int
quantidade x y = (cairo (lisbon [0..x]) y)

-- Questão 2
chicago :: String -> String
chicago [] = []
chicago (x:xs) | x == '1' = (chicago xs)
               | otherwise = x:(chicago xs)

melbourne :: Int -> String
melbourne x = (chicago (show x))

limpaUm :: [Int] -> [Int]
limpaUm x = (map barcelona (paris (map melbourne x)))

paris :: [String] -> [String]
paris [] = []
paris (x:xs) | (x /= "") = (x : (paris xs))
             | otherwise = (paris xs)

barcelona :: String -> Int
barcelona x = (read x)

-- Questão 3
p1 = ("Pikachu",100,50) :: (String, Int, Int) 
p2 = ("Arcanine",200,50) :: (String, Int, Int) 

g1 = [("Pikachu",100,50),("Bulbasaur",50,50), ("Squirtle",50,50)] :: [(String, Int, Int)] 
g2 = [("Arcanine",200,50)] :: [(String, Int, Int)] 


batalha :: [(String, Int, Int)] -> [(String, Int, Int)] -> (String, [(String, Int, Int)])
batalha [] [] = ("Ash", [])
batalha [] ((n2, 0, f2):ms) = ("Gary", (ms))
batalha ((n1, 0, f1):ms) [] = ("Ash", (ms))
batalha [] (m:ms) = ("Gary", (m:ms))
batalha (m:ms) [] = ("Ash", (m:ms))
batalha ((n1, hp1, f1):at) ((n2, 0, f2):bt) = (batalha ((n1, hp1, f1):at) (bt))
batalha ((n1, 0, f1):at) ((n2, hp2, f2):bt) = (batalha (at) ((n2, hp2, f2):bt))
batalha ((n1, hp1, f1):at) ((n2, hp2, f2):bt) = (batalha ((n1, (hp1-f2), f1):at) ((n2, (hp2-f1), f2):bt))











