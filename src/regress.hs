import System.Environment
import System.Exit
import System.IO
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
parseFlags :: String -> IO()
pretty :: String -> Bool

operation s x y
    | s == "lin" = Lin.regress x y
    | s == "log" = Log.regress x y
    | s == "quad" = Quad.regress x y
    | otherwise = putStrLn $ "Error: Cannot recognize operation " ++ s

prettyOperation s x y
    | s == "lin" = Lin.prettyRegress x y
    | s == "log" = Log.prettyRegress x y
    | s == "quad" = Quad.prettyRegress x y
    | otherwise = putStrLn $ "Error: Cannot recognize operation " ++ s

convert x = map (\f -> read f :: Double) x

parseFlags f
    | f == "--version" = putStrLn "Regress v1.1 INDEV"
    | f == "--help" = putStrLn "Usage: regress.exe \"dir/to/x data.csv\" \"dir/to/y data.csv\" lin|log|quad simple|pretty [--version|--help]"
    | otherwise = putStr ""  

pretty "pretty" = True
pretty "simple" = False
pretty x = False

main = do
    args <- getArgs   
    mapM (parseFlags) args   
    if genericLength(args) < 4 then do
        putStrLn "Error: Not enough arguments."
        exitWith (ExitSuccess)  
    else do
        x <- readFile $ args!!0
        y <- readFile $ args!!1            
        let op = args!!2
        let p = pretty $ args!!3
        let _x = splitOneOf ",;." x
        let dx = convert _x    
        let _y = splitOneOf ",;." y
        let dy = convert _y    

        if p == True then do 
            prettyOperation op dx dy
            putStrLn ""
            putStr "Done."
        else do
            operation op dx dy
