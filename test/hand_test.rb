require 'test_helper'

hand = Hand.new
hand.addCard(Card.new('A', 'h'))
hand.addCard(Card.new('q', 'c'))
hand.addCard(Card.new(2, 'h'))
hand.addCard(Card.new(3, 'h'))

describe "Hand" do

  it "has cards" do
    value(hand.cards.first.class).must_equal Card
  end 

  it "has 4 cards" do
    value(hand.size).must_equal 4
  end 

  it "can be face cards" do
    value(hand.to_s).must_equal 'AH, QC, 2H, 3H'
  end 

  it "can add cards" do
    hand.addCard(Card.new(4, 'd'))
    value(hand.cards.size).must_equal 5
    value(hand.to_s).must_equal 'AH, QC, 2H, 3H, 4D'
  end 

end
