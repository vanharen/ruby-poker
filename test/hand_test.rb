require 'test_helper'

class HandTest < MiniTest::Spec

  INITIAL_HAND = 'AH, QC, 2H, 3H, KS, 3S, 4C, 6D, 3D, 10C, 3C'

  before do
    @hand = Hand.new
    @hand.addCard(Card.new('A', 'h'))
    @hand.addCard(Card.new('q', 'c'))
    @hand.addCard(Card.new(2, 'h'))
    @hand.addCard(Card.new(3, 'h'))
    @hand.addCard(Card.new(13, 's'))
    @hand.addCard(Card.new(3, 's'))
    @hand.addCard(Card.new(4, 'c'))
    @hand.addCard(Card.new(6, 'd'))
    @hand.addCard(Card.new(3, 'd'))
    @hand.addCard(Card.new(10, 'c'))
    @hand.addCard(Card.new(3, 'c'))
  end

  describe "Hand" do

    it "has cards" do
      value(@hand.cards.first.class).must_equal Card
    end

    it "has 11 cards" do
      value(@hand.size).must_equal 11
    end

    it "can print" do
      value(@hand.to_s).must_equal INITIAL_HAND
    end

    it "can add cards" do
      @hand.addCard(Card.new(4, 'd'))
      value(@hand.size).must_equal 12
      value(@hand.to_s).must_equal INITIAL_HAND + ', 4D'
    end

    it "can sortBySuit" do
      @hand.sortBySuit
      value(@hand.to_s).must_equal '3C, 4C, 10C, QC, 3D, 6D, 2H, 3H, AH, 3S, KS'
    end

    it "can sortByValue" do
      @hand.sortByValue
      value(@hand.to_s).must_equal '2H, 3C, 3D, 3H, 3S, 4C, 6D, 10C, QC, KS, AH'
    end

    it "has straight" do
      value(@hand.hasStraight(1)).must_equal true
      value(@hand.hasStraight(2)).must_equal true
      value(@hand.hasStraight(3)).must_equal true
      value(@hand.hasStraight(4)).must_equal false
      value(@hand.hasStraight(5)).must_equal false
      value(@hand.hasStraight(15)).must_equal false
      value(@hand.hasStraight(100)).must_equal false
    end

    it "has straight flush" do
      value(@hand.hasStraight(1, true)).must_equal true
      value(@hand.hasStraight(2, true)).must_equal true
      value(@hand.hasStraight(3, true)).must_equal false
    end

  end
end
