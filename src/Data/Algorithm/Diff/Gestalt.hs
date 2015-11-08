module Data.Algorithm.Diff.Gestalt
    ( diff
    ) where

import Data.Algorithm.Diff (Diff(..), getGroupedDiff)
import Data.List.CommonSubstring
import Data.Algorithms.KMP

split :: Eq a => [a] -> [a] -> ([a], [a])
split needle haystack = let index = head $ match (build needle) haystack
                            (left, _) = splitAt index haystack
                            (_ , right) = splitAt (index + length needle) haystack
                        in (left, right)

diff :: Ord a => [a] -> [a] -> [Diff [a]]
diff [] [] = []
diff as [] = [First as]
diff [] bs = [Second bs]
diff as bs = case longestSubstring as bs of
  [] -> [First as, Second bs]
  string -> let (las, ras) = split string as
                (lbs, rbs) = split string bs
            in diff las lbs ++ [Both string string] ++ diff ras rbs
