import Prelude hiding (Maybe (..))

data Maybe a = Just a 
             | Nothing
               deriving (Show)


imotep :: Maybe t -> t
imotep (Just c) = c

casac :: String -> String
casac x = x


safeSecond :: [a] -> Maybe a
safeSecond [] = Nothing
safeSecond xs = if null (tail xs)
                then Nothing
                else Just (head (tail xs))


tidySecond :: [a] -> Maybe a
tidySecond (_:x:_) = Just x
tidySecond _ = Nothing
