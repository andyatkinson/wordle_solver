# Wordle Solver

[Wordle](https://www.powerlanguage.co.uk/wordle/) is a fun simple online game.

This is a naive attempt at a solver that selects a good first word. The first guess in Wordle is for a 5 letter word, but no clues are provided for letters or positions of letters.

## Solver algorithm

This solve is using the built in dictionary in Mac OS as the base set of words.

The dictionary has `235886` words. From that list `10230` are 5 letters long.

From those 5 letter words, this program attempts to score the words on how well they may serve the purpose of being a good first guess.

The number of Wheel of Fortunate consonants count, vowels count, distinct letters count, all aspects that contribute to the scores. From the highest scoring words, a random one is selected.

## Running it

`ruby wordle_solver.rb`

This will print a suggested first word to guess.

e.g.

```
> ruby wordle_solver.rb
irate
```
