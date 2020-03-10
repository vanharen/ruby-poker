require 'test_helper'

describe "Deck" do

  before do
    @deck = Deck.new
  end

  it "has 52 cards" do
    value(@deck.size).must_equal 52
    value(@deck.first.class).must_equal Card

    @deck.sortBySuit
    value(@deck.first.to_s).must_equal '2C'
    value(@deck.last.to_s).must_equal 'AS'
    value(@deck.cards[43].to_s).must_equal '6S'
  end

  it "can be shuffled" do
    _ { @deck.shuffle('abc') }.must_raise ArgumentError
    _ { @deck.shuffle(5) }.must_raise ArgumentError

    first_card = @deck.first
    last_card = @deck.last

    @deck.shuffle(1)
    value([first_card, last_card]).must_equal [@deck.first, @deck.last]

    # actually, it is possible that a perfectly shuffled deck could
    # still end up with the same first and last cards, but it should
    # be very rare (1/52 * 1/52 = 0.04% chance)
    @deck.shuffle(0)
    value([first_card, last_card]).wont_equal [@deck.first, @deck.last]
  end

  it "can deal cards" do
    card = @deck.dealOne
    value(card.class).must_equal Card
    value(card.to_s).must_equal '2C'
    value(@deck.size).must_equal 51
    value(@deck.not_dealt.size).must_equal 51
    value(@deck.dealt.size).must_equal 1

    card = @deck.dealOne
    card = @deck.dealOne
    card = @deck.dealOne
    value(card.to_s).must_equal '5C'
    value(@deck.size).must_equal 48
    value(@deck.not_dealt.size).must_equal 48
    value(@deck.dealt.size).must_equal 4
  end

end
