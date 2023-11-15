data TimeOfDay = AM Int Int
                | PM Int Int
                deriving (Show)

data Resultado t = Success t | Fail
                    deriving Show

convertTime :: Int -> Int -> Resultado TimeOfDay
convertTime h m
  | h > 24 || h < 0 = Fail
  | m > 60 || m < 0 = Fail
  | otherwise = Success (if h < 12 then AM h m else PM h m)