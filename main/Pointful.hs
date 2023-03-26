module Main
    where

import System.Environment (getArgs)
import System.IO (hPutStrLn, stderr)
import System.Exit (exitFailure)

import Lambdabot.Pointful (pointful)

printUsage :: IO ()
printUsage = putStrLn "Usage: pointful QUERY"


main :: IO ()
main = do
    query <- getArgs
    if null query
        then printUsage
        else case pointful $ unwords query off
            (Left  err) -> hPutStrLn stderr err >> exitFailure
            (Right res) -> putStrLn res
