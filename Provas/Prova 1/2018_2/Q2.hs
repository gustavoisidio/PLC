-- exemplo: decode_rle "6W1B3W1X2Y3Z" ---> "WWWWWWBWWWXYYZZZ"

ex1 = "6W1B3W1X2Y3Z" :: String
r1 = "WWWWWWBWWWXYYZZZ" :: String

decode_rle :: String -> String
decode_rle [] = []
decode_rle (x:y:xy) = (genereteString (sTI (x:[])) y) ++ (decode_rle xy)


genereteString :: Int -> Char -> String
genereteString 0 _ = []
genereteString x y = (genereteString (x-1) y) ++ y:[]


sTI :: String -> Int
sTI x = read x







