# ruby-poker

Sample code in Ruby to simulate playing poker

## Problem Description

Here are descriptions of three classes in an object-oriented program
that you will write.

### Deck

 - The `Deck` class represents a standard 52-card deck; Ace high
 - Each card is in one of two states - dealt (`D`) and not-yet-dealt (`ND`)
 - Cards are ordered. The `D` and `ND` cards each have their own order
 - When created, all 52 cards are `ND`, and are in order, by suit
   (clubs 2 through A, diamonds 2 through A,
   hearts 2 through A, spades 2 through A)
 - Methods:
   - `dealOne()` - moves the top card from ND to D and returns the card
   - `print()` - prints non-dealt cards and dealt-cards (in order, as separate lists)
   - `shuffle(goodness)` - goodness is a floating point number between 0 and 1.

Goodness of 0 is perfect shuffle (cards are in a completely random
order). Goodness of 1 is no shuffling (deck is unchanged).
As you change goodness from 0 to 1 the shuffle gets progressively worse.
You can make up your own shuffle algorithm. Be prepared
to explain how it works.

Imagine what a "real" shuffle (done by a person) might look like
and try to capture some of the properties of that shuffle.
(What is defined as a "perfect" shuffle above cannot be done by a
person in a single shuffle, so you won't be able to exactly
model a real shuffle.).

### Card

- The `Card` class represents a single card
- Methods:
  - `print()` - prints the type of card


### Hand
  
- The `Hand` class represents a set of cards. From 0 to 52 cards, total
- Cards are always in a definite order
- Methods:
  - `print()` - prints the hand (in order)
  - `addCard(card)` - adds a card to the hand
  - `sortBySuit()` - sorts the cards by suit, and then by value
  - `sortByValue()` - sorts by value, then by suit
  - `hasStraight(len, sameSuit)` - returns true if hand
contains a straight of the given length.
If sameSuit is true, counts only straights
with cards in the same suit (flushes);
If sameSuit if not true, any straight is counted
(See below after "What are the chances of being
dealt a 3-card straight" for a definition of
"straight")

## Tasks

- Write a program that
  - Implements the classes above
  - Creates and shuffles a deck and then
    deals two or more 5-card hands from the deck.
  - Can generate many deals and collect statistics on them, in order
    to answer the questions below.

- Answer the following questions by simulation (not by calculation); that is,
by generating many random deals and collecting statistics from those deals.
The simulations should use the classes/methods above (and any other methods
or classes you need to write)
  - Starting point: 2 players, perfect shuffle, each dealt 5 cards
    (alternating player1, player2, player1, etc)
  - What are the chances of being dealt a 3-card straight, i.e.  three
    consecutive cards.  The three cards may be of different suits, and
    it still counts as a 3-card straight if there are more than three
    consecutive cards.  
    This hand has a 3-card straight: 4 of clubs, 5 of spades, 6 of diamonds 7 of clubs, K of clubs  
    This hand does not: 4 of clubs, 5 of clubs,  7 of clubs, 8 of spades, K of clubs
  
  - How do the chances vary with how well the deck is shuffled?
    (i.e. with the "goodness" parameter in the Deck shuffle method).
  - How does this answer change if you vary the number of players?