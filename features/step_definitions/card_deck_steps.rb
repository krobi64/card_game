Transform /^table:cards,card$/ do |table|
  table.map_headers! {|header| header.downcase.to_sym }
  table.map_column!(:player) {|player| ordinal.to_i }
  table.map_column!(:card_rank) {|rank| rank.to_i }
  table.map_column!(:card_suit) {|suit| suit.downcase.to_sym }
  table
end

Given /^"([^"]*)" players$/ do |number_of_players|
  @players = (1..number_of_players.to_i).map {|i| Player.new }
end

When /^I create the default card deck$/ do
  @deck = CardDeck::Base.new
end

Given /^I create a trump deck$/ do
  @deck = CardDeck::TrumpCardDeck::Base.new
end

Given /^"([^"]*)" are trump$/ do |suit|
  suit = pluralize(suit).to_sym
  @deck.trump_suit = suit
end

Given /^the players receive the following cards:$/ do |table|
  # table is a Cucumber::Ast::Table
  table.hashes.each do |row|
    @players[row[:player].to_i].hand << Card.new(row[:card_rank].to_i, row[:card_suit])
  end
end

When /^I create a euchre deck$/ do
  @deck = CardDeck::TrumpCardDeck::EuchreDeck.new
end

When /^I create a pinochle deck$/ do
  @deck = CardDeck::TrumpCardDeck::PinochleDeck.new
end

When /^I deal "([^"]*)" cards$/ do |number_of_cards|
  number_of_cards = number_of_cards.to_i
  @deck.deal number_of_cards, @players
end

When /^each player plays their card$/ do
  @deck.new_hand
  @players.each do |player|
    player.play_card player.hand.first, @deck
  end
end

Then /^each player should have "([^"]*)" cards$/ do |number_of_cards|
  @players.each do |player|
    player.hand.size.should == number_of_cards.to_i
  end
end

Then /^the deck should have "([^"]*)" cards remaining$/ do |number_of_cards|
  @deck.size.should == number_of_cards.to_i
end

Then /^I should have "([^"]*)" cards$/ do |number|
  @deck.size.should == number.to_i
end

Then /^the suits should be "([^"]*)"$/ do |valid_suits|
  @valid_suits = valid_suits.split(', ').map { |i| i.to_sym }
  hash = sort_deck @deck.cards
  deck_suits = hash.keys
  (@valid_suits - deck_suits).should be_empty
  (deck_suits - @valid_suits).should be_empty
end

Then /^the ranks should range from "([^"]*)" to "([^"]*)"$/ do |min, max|
  @valid_ordinals = (min..max).map { |i| i.to_i }
  hash = sort_deck @deck.cards
  hash.values.each do |suit_hash|
    suit_ordinals = suit_hash.keys
    (@valid_ordinals - suit_ordinals).should be_empty
    (suit_ordinals - @valid_ordinals).should be_empty
  end
end

Then /^no cards should match$/ do
  hash = {}
  @deck.cards.each do |card|
    if hash.has_key? card.suit
      hash[card.suit].should_not have_key card.ordinal
    else
      hash[card.suit] = {}
    end
  end
end

Then /^I should have "([^"]*)" of each card$/ do |number_of_cards|
  hash = sort_deck @deck.cards
  hash.each_value do |suit|
    suit.each_value do |ordinal|
      ordinal.should == number_of_cards.to_i
    end
  end
end

Then /^player "([^"]*)" should win the hand$/ do |player|
  winning_player = @deck.rank_hand
  winning_player.should == @players[player.to_i]
end




