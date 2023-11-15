
-- exemplo: encode_rle "WWWWWWBWWWXYYZZZ" ---> "6W1B3W1X2Y3Z"

encode_rle :: String -> String
encode_rle [] = []
encode_rle (s:sr) = (show (untilIsEqual (s:sr)))  ++ s:[] ++ (encode_rle (drop (untilIsEqual (s:sr)) (s:sr)))

untilIsEqual :: String -> Int
untilIsEqual [] = 0
untilIsEqual (x:[]) = 1
untilIsEqual (x:y:[]) | x == y = 2
untilIsEqual (x:y:xs) | x == y = 1 + untilIsEqual (y:xs)
                      | otherwise = 1














                      











