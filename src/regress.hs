import System.Environment
import Control.Monad
import Data.List
import Data.List.Split
import Data.Char
import Logarithmic as Log
import Linear as Lin
import Quadratic as Quad

main :: IO()
operation :: String -> [Double] -> [Double] -> IO()
convert :: [String] -> [Double]

operation s x y
    | s == "lin" = Lin.regress x y
    | s == "log" = Log.regress x y
    | s == "quad" = Quad.regress x y
    | otherwise = putStrLn $ "Error: Cannot recognize operation " ++ s

convert x = map (\f -> read f :: Double) x

main = do
    args <- getArgs
    x <- readFile $ args!!0
    y <- readFile $ args!!1
    let op = args!!2
    let _x = splitOn "," x
    let dx = convert _x    
    let _y = splitOn "," y
    let dy = convert _y    
    operation op dx dy