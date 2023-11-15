data TimeOfDay = AM Int Int
                | PM Int Int
                deriving (Show)

extraTime :: Int -> Int -> Int -> (Int, (Int, Int))
extraTime h m a= (totalTime, (newHour, newMinutes))
    where
        totalTime = h*60 + (m + a)
        newHour = totalTime `div` 60
        newMinutes = totalTime `mod` 60

somaMinutos :: TimeOfDay -> Int -> TimeOfDay
somaMinutos curTime addedTime = case curTime of
                                    (AM h m) -> (if fst newTime > 720 then uncurry PM (snd newTime) else uncurry AM (snd newTime))
                                        where
                                            newTime = extraTime h m addedTime
                                    (PM h m) -> (if fst newTime > 720 then uncurry AM (snd newTime) else uncurry PM (snd newTime))
                                        where
                                            newTime = extraTime h m addedTime
