require 'test_helper'

describe "Card" do

  it "has suits" do
    value(Card::SUITS).wont_be_nil
  end 

  it "can be face cards" do
    value(Card.new('a', 'c').to_s).must_equal 'AC'
    value(Card.new('k', 'd').to_s).must_equal 'KD'
    value(Card.new('q', 'h').to_s).must_equal 'QH'
    value(Card.new('j', 's').to_s).must_equal 'JS'
  end 

  it "can be number cards" do
    value(Card.new(9, 'D').to_s).must_equal '9D'
  end 

end
