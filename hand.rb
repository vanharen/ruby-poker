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
  attr_accessor :cards

  def initialize(cards = [])
    @cards = cards
  end

  def <<(card)                  # adds a card to the hand
    @cards << card
  end
  alias :addCard :<<

  def sortBySuit()              # sorts the cards by suit, and then by value
    @cards.sort_by! { |c| [c.suit, c.value] }
  end

  def sortByValue()             # sorts by value, then by suit
    @cards.sort_by! { |c| [c.value, c.suit] }
  end

  # In a perfect human shuffle, the deck is split in half, and then
  # re-combined, alternating one card from each half.
  #
  # For this implementation, we'll ignore cutting the deck first.  For
  # the unshuffled deck (goodness=1) we won't change the position of
  # any cards.  As goodness decreases to zero, we'll allow cards to
  # move farther from their initial position.
  #
  def shuffle(goodness=0)       # 0=random, 1=unshuffled
    goodness = goodness.to_f if goodness.class == Integer
    if !( (goodness.class == Float) &&
          ((0..1).include? goodness) )
      raise ArgumentError,
            'Goodness must a float between 0 and 1, inclusive'
    end

    # First we create an array of offsets based on the size of the
    # deck and the goodness value.  e.g. if deck_size=52 and
    # goodness=1, the offsets array will be 52 zeroes, meaning no card
    # moves at all.  If deck_size=52 and goodness=1, then the array
    # will contain [0,1,2,3,4 ... 52] meaning each card may randomly
    # move any number of spaces from 0 to 52
    deck_size = @cards.size
    max_offset = (1.0 - goodness) * deck_size
    offsets = (0..max_offset).to_a

    # Now we "shuffle", by allowing each card to move by a random
    # offset picked out of the "offsets" array created above and
    # adding that offest to the original position, modulo deck_size,
    # then sort the result.  Note that the sort order of two cards
    # with the same index is not guaranteed.
    shuffled_cards = @cards.each_with_index.map { |c, i|
      new_idx = (i + offsets.sample) % deck_size
      [new_idx, c]
    }.sort_by {|c| c[0]}.map{|c| c[1]}

    @cards = shuffled_cards
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

    # get unique card values, in sorted order
    card_values = @cards.map(&:value).sort.uniq
    straight_len = 1

    # look for straights by searching for difference of 1 in values
    for i in 1...card_values.size do
      if (card_values[i] - card_values[i-1]) == 1
        straight_len += 1
        return true if straight_len == len
      else
        straight_len = 1
      end
    end

    false
  end

  def first
    @cards.first
  end

  def last
    @cards.last
  end

  def size
    @cards.size
  end
  alias :length :size

  def to_s
    @cards.join(", ")
  end

  def print
    puts self
  end

end
