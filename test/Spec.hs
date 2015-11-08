import System.Exit (exitFailure)
import Data.Algorithm.Diff.Gestalt
import Data.Algorithm.Diff (Diff(..))

main :: IO ()
main = if diff "diff" "riffs" == [First "d", Second "r", Both "iff" "iff", Second "s"]
  then return ()
  else exitFailure
