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

operation :: String -> [Double] -> [Double] -> IO()
operation s x y
    | s == "lin" = Lin.simpleRegress x y
    | s == "log" = Log.simpleRegress x y
    | s == "quad" = Quad.simpleRegress x y
    | otherwise = putStrLn $ "Error: Cannot recognize operation " ++ s

prettyOperation :: String -> [Double] -> [Double] -> IO()
prettyOperation s x y
    | s == "lin" = Lin.prettyRegress x y
    | s == "log" = Log.prettyRegress x y
    | s == "quad" = Quad.prettyRegress x y
    | otherwise = putStrLn $ "Error: Cannot recognize operation " ++ s


parseFlags :: String -> IO()
parseFlags f
    | f == "--version" = putStrLn "Regress v1.1 INDEV"
    | f == "--help" = putStrLn "Usage: regress.exe \"dir/to/x data.csv\" \"dir/to/y data.csv\" lin|log|quad simple|pretty [--version|--help]"
    | otherwise = putStr ""

main :: IO()
main = do
    args <- getArgs   
    mapM (parseFlags) args   
    if genericLength(args) < 4 then do
        putStrLn "Error: Not enough arguments."
        parseFlags "--help"
        exitWith (ExitSuccess)  
    else do
        x <- readFile $ args!!0
        y <- readFile $ args!!1
        print x
        print y
        let op = args!!2
        let pretty = args!!3
        let _x = splitOneOf ",;." x
        let dx = map (read) _x    
        let _y = splitOneOf ",;." y
        let dy = map (read) _y    

        if pretty == "pretty" then do 
            prettyOperation op dx dy
            putStrLn ""
            putStr "Done."
        else do
            if pretty == "simple" then do
                operation op dx dy
            else do
                putStrLn "Warning: Output not defined/recognized. Trying using \"pretty\" or \"simple.\". Defaulting to simple output."
                operation op dx dy
