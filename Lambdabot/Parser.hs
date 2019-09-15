{-# LANGUAGE Rank2Types #-}

-- Haskell expression parser.  Big hack, but only uses documented APIs so it
-- should be more robust than the previous hack.
module Lambdabot.Parser
    ( withParsed
    , prettyPrintInLine
    ) where

import Data.Generics
import Language.Haskell.Exts.Simple

-- |Parse a string as an 'Exp' or a 'Decl', apply the given generic transformation to it,
-- and re-render it back to text.
withParsed :: (forall a. (Data a, Eq a) => a -> a) -> String -> Either String String
withParsed _ "" = Left "Error: expected a Haskell expression or declaration"
withParsed f s  = case (parseExp s, parseDecl s) of
    (ParseOk a, _)          -> Right $ prettyPrintInLine $ f a
    (_, ParseOk a)          -> Right $ prettyPrintInLine $ f a
    (ParseFailed l e,  _)   -> Left $ prettyPrint l ++ ':' : e

-- |Render haskell code in a compact format
prettyPrintInLine :: Pretty a => a -> String
prettyPrintInLine = prettyPrintWithMode (defaultMode { layout = PPInLine })
