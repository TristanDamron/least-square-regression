{-
    linear regression module (y = mx + b)

    a series of functions to perform a least square regression on a set of data points 
    written by tristan damron, 2019
-}

module Linear where
import Data.List


avg :: [Double] -> Double
avg l = (sum l) / (genericLength l)

slope :: [Double] -> [Double] -> Double
slope x y = sum(zipWith (*) x y) / sum(map (^2) x)

intercept :: Double -> Double -> Double -> Double
intercept x y m = (negate (m * x)) + y

diff :: Double -> [Double] -> [Double]
diff m x = map (subtract m) x

prettyRegress :: [Double] -> [Double] -> IO()
prettyRegress x y = do
    let mx = avg x
    let my = avg y
    let dx = diff mx x
    let dy = diff my y
    let m = slope dx dy
    let b = intercept mx my m
    putStr "m = "
    print m
    putStr "b = "
    print b
    putStr "In the form (y = mx + b)..."


simpleRegress :: [Double] -> [Double] -> IO()
simpleRegress x y = do
    let mx = avg x
    let my = avg y
    let dx = diff mx x
    let dy = diff my y
    let m = slope dx dy
    let b = intercept mx my m
    print m
    print b


regress :: [Double] -> [Double] -> (Double, Double)
regress x y = (m, b)
  where 
    mx = avg x
    my = avg y
    dx = diff mx x
    dy = diff my y
    m = slope dx dy
    b = intercept mx my m

