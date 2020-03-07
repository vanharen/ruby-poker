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
  def initialize(cards = [])
    @cards = cards
  end

  def cards
    @cards
  end

  def addCard(card)             # adds a card to the hand
    @cards << card
  end

  def sortBySuit()              # sorts the cards by suit, and then by value
    @cards.sort_by! { |c| [c.suit, c.value] }
  end

  def sortByValue()             # sorts by value, then by suit
    @cards.sort_by! { |c| [c.value, c.suit] }
  end

  def hasStraight(len, sameSuit=false)
    # short-circuit on degenerate cases
    return false if len > size
    return true if len == 1

    # if sameSuit, break the hand into smaller hands by suit and check
    # for a straight in each sub-hand
    if sameSuit
      grps = @cards.group_by { |c| c.suit }
      grps.each { |k,v| return true if Hand.new(v).hasStraight(len) }
      return false
    end

    # get unique card values
    card_values = @cards.map(&:value).sort.uniq
    max_straight_len = straight_len = 1

    # look for straights by searching f
    for i in 0...card_values.size-1 do
      if (card_values[i+1] - card_values[i]) == 1
        straight_len += 1
        return true if straight_len == len
      else
        straight_len = 1
      end
    end

    false
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
