{-
    quadratic regression module (y = ax^2 + bx + c)

    a series of functions to perform a least square regression on a set of data points 
    written by tristan damron, 2019
-}

module Quadratic where
import Data.List

prettyRegress :: [Double] -> [Double] -> IO()
prettyRegress x y = do
    let n = genericLength x
    let sx = sum x
    let sy = sum y
    let x2 = sum $ map (^2) x
    let x3 = sum $ map (^3) x
    let x4 = sum $ map (^4) x
    let xy = sum $ zipWith(*) x y
    let x2y = sum $ zipWith (*) (map (^ 2) x) y

    let _xx = x2 - ((sx^2) / n)
    let _xy = xy - ((sx * sy) / n)
    let _xx2 = x3 - ((x2 * sx) / n)
    let _x2y = x2y - ((x2 * sy) / n)
    let _x2x2 = x4 - ((x2^2) / n)    

    let a = ((_x2y * _xx) - (_xy * _xx2)) / ((_xx * _x2x2) - _xx2^2)
    let b = ((_xy * _x2x2) - (_x2y * _xx2)) / ((_xx * _x2x2) - _xx2^2)
    let c = (sy / n) - (b * (sx / n)) - (a * (x2 / n))
    putStr "a = "
    print a
    putStr "b = "
    print b
    putStr "c = "
    print c
    putStr "In the form (y = ax^2 + bx + c)..."

simpleRegress :: [Double] -> [Double] -> IO()
simpleRegress x y = do
    let n = genericLength x
    let sx = sum x
    let sy = sum y
    let x2 = sum $ map (^2) x
    let x3 = sum $ map (^3) x
    let x4 = sum $ map (^4) x
    let xy = sum $ zipWith(*) x y
    let x2y = sum $ zipWith (*) (map (^ 2) x) y

    let _xx = x2 - ((sx^2) / n)
    let _xy = xy - ((sx * sy) / n)
    let _xx2 = x3 - ((x2 * sx) / n)
    let _x2y = x2y - ((x2 * sy) / n)
    let _x2x2 = x4 - ((x2^2) / n)    

    let a = ((_x2y * _xx) - (_xy * _xx2)) / ((_xx * _x2x2) - _xx2^2)
    let b = ((_xy * _x2x2) - (_x2y * _xx2)) / ((_xx * _x2x2) - _xx2^2)
    let c = (sy / n) - (b * (sx / n)) - (a * (x2 / n))
    print a
    print b
    print c

regress :: [Double] -> [Double] -> (Double, Double, Double)
regress x y = (a, b, c)
  where
    n = genericLength x
    sx = sum x
    sy = sum y
    x2 = sum $ map (^2) x
    x3 = sum $ map (^3) x
    x4 = sum $ map (^4) x
    xy = sum $ zipWith(*) x y
    x2y = sum $ zipWith (*) (map (^ 2) x) y

    _xx = x2 - ((sx^2) / n)
    _xy = xy - ((sx * sy) / n)
    _xx2 = x3 - ((x2 * sx) / n)
    _x2y = x2y - ((x2 * sy) / n)
    _x2x2 = x4 - ((x2^2) / n)    

    a = ((_x2y * _xx) - (_xy * _xx2)) / ((_xx * _x2x2) - _xx2^2)
    b = ((_xy * _x2x2) - (_x2y * _xx2)) / ((_xx * _x2x2) - _xx2^2)
    c = (sy / n) - (b * (sx / n)) - (a * (x2 / n))

