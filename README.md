# Wordle Solver

[Wordle](https://www.powerlanguage.co.uk/wordle/) is a fun simple online game.

This is a naive attempt at a solver that selects a good first word. The first guess in Wordle is for a 5 letter word, but no clues are provided for letters or positions of letters.

## Solver algorithm

As a base dictionary of words, this uses the built in dictionary in Mac OS. The dictionary has `235886` words and `10230` are 5 letters long.

From those 5 letter words, this program attempts to score the words on how well they may serve the purpose of being a good first guess.

The number of Wheel of Fortune (`R S T L N E`) consonants count, vowels count, distinct letters count, all aspects that contribute to the scores. From the highest scoring words, a random one is selected.

## Running it

`ruby wordle_solver.rb`

This will print a suggested first word to guess.

e.g.

```
> ruby wordle_solver.rb
irate
```

## TODO

[ ] Keep track of existing suggestions, remove them (e.g. write them to a file)
