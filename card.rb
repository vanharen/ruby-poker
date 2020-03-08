# The Card class represents a single card
# Methods:
#   to_s, print - prints the type of card
#
class Card
  SUITS = %w(C D H S)           # Clubs, Diamonds, Hearts, Spades,
                                #   in alphabetical order
  VALUES = (2..14).to_a         # Card values from 2 thru Ace (Ace high)
  
  attr_accessor :suit, :value

  def initialize(value, suit)
    @suit = suit.upcase
    raise ArgumentError,
          'Suit must be C, D, H, or S' if !SUITS.include?(@suit)

    @value = case value.to_s.upcase
             when 'A'; 14       # Convert face cards to numeric values
             when 'K'; 13
             when 'Q'; 12
             when 'J'; 11
             else
               value
             end
    raise ArgumentError,
          'Value must be 2-14 (or J, Q, K, A)' if !VALUES.include?(@value)
  end

  def to_s
    value = case @value
            when 14; 'A'        # Convert numeric values to face cards when printing
            when 13; 'K'
            when 12; 'Q'
            when 11; 'J'
            else
              @value
            end
    "#{value}#{@suit}"
  end
  alias :print :to_s            # Problem statement wanted print() to exist

end
