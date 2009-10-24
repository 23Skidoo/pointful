module Main
    where

import Data.List (intersperse)
import System.Environment (getArgs)

import Lambdabot.Pointful (pointful)

printUsage :: IO ()
printUsage = putStrLn "Usage: pointful QUERY"

main :: IO ()
main = do query <- getArgs
          if null query
             then printUsage
             else let query' = concat $ intersperse " " query
                  in putStrLn $ pointful query'
