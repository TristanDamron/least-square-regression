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

sxx x mx = let m = map (subtract mx) x
           in sum (map (^2) m)

sxy x mx y my = let m = map (subtract mx) x
                    n = map (subtract my) y
                in sum ( zipWith(*) m n)

ln x = map log x

avg l = (sum l) / (genericLength l)

main = do
    let x = [0.36772,1.64873,7.38910]
    let y = [2.3,5.3,6.5]
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