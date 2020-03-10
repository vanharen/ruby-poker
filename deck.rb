# The Deck class represents a standard 52-card deck; Ace high.
#
# Each card is in one of two states - dealt (D) and not-yet-dealt (ND)
# Cards are ordered. The D and ND cards each have their own order
# When created, all 52 cards are ND, and are in order, by suit
# (clubs 2 through A, diamonds 2 through A,
# hearts 2 through A, spades 2 through A)
# Methods:
# - dealOne() - moves the top card from ND to D and returns the card
# - print() - prints non-dealt cards and dealt-cards (in order, as separate lists)
# - shuffle(goodness) - goodness is a floating point number between 0 and 1.
# 
# Goodness of 0 is perfect shuffle (cards are in a completely random
# order). Goodness of 1 is no shuffling (deck is unchanged).
# As you change goodness from 0 to 1 the shuffle gets progressively worse.
# You can make up your own shuffle algorithm. Be prepared
# to explain how it works.
#
# Imagine what a "real" shuffle (done by a person) might look like
# and try to capture some of the properties of that shuffle.
# (What is defined as a "perfect" shuffle above cannot be done by a
# person in a single shuffle, so you won't be able to exactly
# model a real shuffle.).
#
class Deck < Hand               # a Deck is really just a 52-card Hand
  ALL_52 = Card::SUITS.collect { |s|
    Card::VALUES.collect { |v|
      Card.new(v, s)
    }
  }.flatten

  attr_accessor :not_dealt, :dealt
  
  def initialize(not_dealt = ALL_52.dup, dealt = [])
    @not_dealt = Hand.new(not_dealt)
    @dealt = Hand.new(dealt)
  end

  def dealOne
    card = @not_dealt.cards.shift
    @dealt << card
    card
  end

  def cards
    @not_dealt.cards
  end

  def first
    @not_dealt.first
  end

  def last
    @not_dealt.last
  end

  def size
    @not_dealt.size
  end

  def sortBySuit                # sorts the cards by suit, and then by value
    @not_dealt.sortBySuit
  end

  def sortByValue               # sorts by value, then by suit
    @not_dealt.sortByValue
  end

  def shuffle(goodness=0)       # 0=random, 1=unshuffled
    @not_dealt.shuffle(goodness)
  end

  def to_s
    "== Not Dealt ==\n #{@not_dealt}\n== Dealt ==\n #{@dealt}"
  end

end
