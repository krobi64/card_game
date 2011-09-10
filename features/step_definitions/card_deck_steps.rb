Given /^Nothing whatsoever$/ do
  true
end

When /^I create the default card deck$/ do
  @deck = CardDeck.new
end

Then /^I should have "([^"]*)" cards$/ do |number|
  @deck.size.should == 52
end

Then /^the suits should be "([^"]*)"$/ do |valid_suits|
  valid_suits = valid_suits.split(', ').map { |i| i.to_sym }
  @deck.cards.each do |card|
    valid_suits.should include card.suit
  end
end

Then /^the ranks should range from "([^"]*)" to "([^"]*)"$/ do |min, max|
  valid_ordinals = (min..max).map { |i| i.to_i }
  @deck.cards.each do |card|
    valid_ordinals.should include card.ordinal
  end
end
