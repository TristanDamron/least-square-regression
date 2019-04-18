{-
    logarithmic regression module (y = a + b ln x)

    a series of functions to perform a logarithmic regression on a set of data points
    written by tristan damron, 2019
-}

import Data.List

avg :: [Double] -> Double
ln :: [Double] -> [Double]
sxx :: [Double] -> Double -> Double
sxy :: [Double] -> Double -> [Double] -> Double -> Double
regress :: [Double] -> [Double] -> IO()

sxx x mx = let m = map (subtract mx) x
           in sum (map (^2) m)

sxy x mx y my = let m = map (subtract mx) x
                    n = map (subtract my) y
                in sum ( zipWith(*) m n)

ln x = map log x

avg l = (sum l) / (genericLength l)

regress x y = do
    let x1 = ln x
    let mx = avg x1
    let my = avg y
    let _sxx = sxx x1 mx
    let _sxy = sxy x1 mx y my
    let _syy = sxx y my
    let a = _sxy / _sxx
    print a
    let b = my - a * mx
    print b
