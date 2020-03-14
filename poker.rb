#!/usr/bin/env ruby

load 'card.rb'
load 'hand.rb'
load 'deck.rb'

if ARGV.count != 4
  puts "Usage: #{$0} num_hands num_cards num_runs goodness"
  exit -1
end

num_hands, num_cards, num_runs = ARGV[0,3].map(&:to_i)
goodness = ARGV[3].to_f

total_hands = num_hands * num_runs

num_straights = 0

num_runs.times do
  deck = Deck.new
  deck.shuffle(goodness)
  hands = []

  num_hands.times do
    hands << Hand.new
  end

  num_cards.times do
    num_hands.times do |i|
      hands[i] << deck.dealOne
    end
  end

  num_hands.times do |i|
    num_straights += 1 if hands[i].hasStraight(3)
    # puts " #{hands[i].hasStraight(3)} Hand #{i+1}: #{hands[i]}"
  end

  # puts deck
end

puts "runs: #{num_runs}, hands: #{num_hands}, cards/hand: #{num_cards}, goodness: #{goodness}"
puts " 3-card straight percentage: #{num_straights * 100.0 / total_hands}% (#{num_straights}/#{total_hands})"
