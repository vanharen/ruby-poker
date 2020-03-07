# The `Hand` class represents a set of cards. From 0 to 52 cards, total
# Cards are always in a definite order
# Methods:
#  - print() - prints the hand (in order)
#  - addCard(card) - adds a card to the hand
#  - sortBySuit() - sorts the cards by suit, and then by value
#  - sortByValue() - sorts by value, then by suit
#  - hasStraight(len, sameSuit) - returns true if hand
#    contains a straight of the given length.
#    If sameSuit is true, counts only straights
#    with cards in the same suit (flushes)
#    If sameSuit if not true, any straight is counted
#
class Hand
  def initialize()
    @cards = []
  end

  def cards
    @cards
  end

  def addCard(card)             # adds a card to the hand
    @cards << card
  end

  def sortBySuit()              # sorts the cards by suit, and then by value
  end

  def sortByValue()             # sorts by value, then by suit
  end

  def hasStraight(len, sameSuit=false)
  end

  def size
    @cards.size
  end
  alias :length :size

  def to_s
    @cards.join(", ")
  end
  alias :print :to_s            # Problem statement wanted print() to exist
end
