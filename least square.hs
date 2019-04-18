{-
    least square module

    a series of functions to perform a least square regression on a set of data points
    written by tristan damron, 2019
-}
import Data.List

avg :: [Double] -> Double
slope :: [Double] -> [Double] -> Double
intercept :: Double -> Double -> Double -> Double
diff :: Double -> [Double] -> [Double]

avg l = (sum l) / (genericLength l)
slope i j = sum(zipWith (*) i j) / sum(map (^2) i)
intercept i j m = (negate (m * i)) + j
diff m i = map (subtract m) i

main = do    
    let x = [1,2,3,4,5]    
    let y = [2,4,5,4,5]
    let mx = avg x
    let my = avg y
    let dx = diff mx x
    let dy = diff my y
    let m = slope dx dy
    let b = intercept mx my m
    print m
    print b
