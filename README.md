# pointful [![Hackage version](https://img.shields.io/hackage/v/pointful.svg?label=Hackage)](https://hackage.haskell.org/package/pointful) [![Stackage version](https://www.stackage.org/package/pointful/badge/lts?label=Stackage)](https://www.stackage.org/package/pointful) [![Build Status](https://secure.travis-ci.org/23Skidoo/pointful.png?branch=master)](http://travis-ci.org/23Skidoo/pointful)

Stand-alone command-line version of the pointful plugin for Lambdabot.

This tool transforms Haskell expressions from the implicit pointfree style to the explicit pointful style. This makes it easier to understand such expressions.

For example, consider the expression `max 100 . uncurry max`, which is in pointfree style. In pointful style, this becomes `\ tuple -> max 100 ((uncurry max) tuple)`. With a little additional investigation around `uncurry max`, it can be determined that this expression takes a 2-tuple and returns the maximum of its elements and 100.

## Installation

```
cabal install pointful
```

## Usage

```
$ pointful "max 100 . uncurry max"
\ c -> max 100 ((uncurry max) c)
```

## Credits

Pointful plugin code taken from Lambdabot. Originally written by Thomas Jäger (?).
