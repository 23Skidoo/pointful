module Main
    where

import System.Environment (getArgs)
import System.Exit (die)

import Lambdabot.Pointful (pointful)

printUsage :: IO ()
printUsage = putStrLn "Usage: pointful QUERY"


main :: IO ()
main = do
    query <- getArgs
    if null query
        then printUsage
        else case pointful $ unwords query of
            (Left  err) -> die err
            (Right res) -> putStrLn res
