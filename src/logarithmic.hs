{-
    logarithmic regression module (y = a + b ln x)

    a series of functions to perform a logarithmic regression on a set of data points
    written by tristan damron, 2019
-}

module Logarithmic where
import Data.List

sxx :: [Double] -> Double -> Double
sxy :: [Double] -> Double -> [Double] -> Double -> Double
ln :: [Double] -> [Double]
avg :: [Double] -> Double
prettyRegress :: [Double] -> [Double] -> IO()
simpleRegress :: [Double] -> [Double] -> IO()
regress :: [Double] -> [Double] -> (Double, Double)

sxx x mx = let m = map (subtract mx) x
           in sum (map (^2) m)

sxy x mx y my = let m = map (subtract mx) x
                    n = map (subtract my) y
                in sum ( zipWith(*) m n)

ln x = map log x

avg l = (sum l) / (genericLength l)

prettyRegress x y = do
    let x1 = ln x
    let mx = avg x1
    let my = avg y
    let _sxx = sxx x1 mx
    let _sxy = sxy x1 mx y my
    let _syy = sxx y my
    let a = _sxy / _sxx
    let b = my - a * mx
    putStr "a = "
    print a
    putStr "b = "
    print b
    putStr "In the form (y = a + b ln x)..."

simpleRegress x y = do
    let x1 = ln x
    let mx = avg x1
    let my = avg y
    let _sxx = sxx x1 mx
    let _sxy = sxy x1 mx y my
    let _syy = sxx y my
    let a = _sxy / _sxx
    let b = my - a * mx
    print a
    print b

regress x y = (a, b)
  where
    x1 = ln x
    mx = avg x1
    my = avg y
    _sxx = sxx x1 mx
    _sxy = sxy x1 mx y my
    _syy = sxx y my
    a = _sxy / _sxx
    b = my - a * mx
