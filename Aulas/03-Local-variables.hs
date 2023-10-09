melhorLinguagem = "Haskell"

melhorLinguagem :: String

lend amount balance = let reserve = 100
                          newBalance = balance - amount 
                      in if balance < reserve
                         then Nothing
                         else Just newBalance

lend2 amount balance = if amount < reserve * 0.5
                       then Just newBalance
                       else Nothing
        where reserve = 100
              newBalance = balance - amount

pluralise :: String -> [Int] -> [String]
pluralise word counts = map plural counts
       where plural 0 = "no " ++ word ++ "s" -- Plural is a local function
             plural 1 = "one " ++ word
             plural n = show n ++ " " ++ word ++ "s"              

splitLines :: String -> [String]
splitLines [] = []
splitLines cs =
    let (pre, suf) = break isLineTerminator cs
        isLineTerminator c = c == '\r' || c == '\n'
    in pre : case suf of
               ('\r':'\n':rest) -> splitLines rest
               ('\r':rest) -> splitLines rest
               ('\n':rest) -> splitLines rest 
               _ -> []


splitLineS :: String -> [String]
splitLineS [] = []
splitLineS cs = map deleteLineTerm (lines cs)
    where deleteLineTerm x | isLineTerminatoR (last x) = deletLeast x
                           | otherwise = x
          isLineTerminatoR c = c == '\r'    
          deletLeast m = take ((length m) - 1) m



