import qualified Data.Map.Strict as Map
import Data.Function(on)
import Data.List (sortBy)
import Data.List (zipWith)

-- some blind 75
-- median of sorted arrays
median_sorted :: Ord a => [a] -> [a] -> a
median_sorted xy yz = merged !! mid
 where
   merged = sort (xy ++ yz)
   len = length merged
   mid = len `div` 2 

-- merge k sorted lists
-- merge all sub lists then sort?
merge_k :: Ord a => [[a]] -> [a]
merge_k = sort . concat

-- top k frequent elements

topKFrequent :: Ord a => [a] -> Int -> [a]
topKFrequent xs k =
    take k
  . map fst
  . sortBy (flip compare `on` snd)
  . Map.toList
  $ Map.fromListWith (+) [(x, 1 :: Int) | x <- xs]


-- quicksort global
sort :: Ord a => [a] -> [a]
sort [] = []
sort (h:t) = 
 let smaller = sort [y| y <- t, y <= h]
     bigger = sort [y| y <- t, y > h]
 in smaller ++ [h] ++ bigger


--easy
-- convert binary to integer
binary_int :: String -> Int
binary_int [] = 0
binary_int (c:cs) =
 let digit = if c == '1' then 1 else 0
 in digit * 2 ^ length cs + binary_int cs

-- two sum
two_sum :: [Int] -> Int -> Maybe (Int, Int)
two_sum xs target = 
 case [ (i,j)
       | (i, x) <- zip [0..] xs
       , (j, y) <- zip [0..] xs
       , i < j
       , x + y == target
       ] of
    (pair:_) -> Just pair
    []       -> Nothing


-- candy
-- take a ratings list -> each child is given candy based on ratings -> 
-- if rating[i] > rating[i+1] then rating[i] = candy[i] = 2 && ratings[i+1] = candy[i+1] = 1
-- [][] [][] [][ ][]

candy :: [Int] -> Int
candy ratings = sum $ zipWith max left right
 where
    n = length ratings
    left = forward ratings
    right = reverse (forward (reverse ratings))

    forward :: [Int] -> [Int]
    forward xs = snd $ foldl step (head xs, [1]) (zip (tail xs) [1..])
      where
        step (prevVal, acc) (currVal, i)
          | currVal > ratings !! (i - 1) = (currVal, acc ++ [last acc + 1])
          | otherwise                    = (currVal, acc ++ [1])
 
