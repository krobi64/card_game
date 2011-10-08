Transform /^table:cards,card$/ do |table|
  table.map_headers! {|header| header.downcase.to_sym }
  table.map_column!("ordinal") {|ordinal| ordinal.to_i }
  table.map_column!("suit") {|suit| suit.downcase.to_sym }
  table
end


Given /^any of the following cards:$/ do |table|
  # table is a Cucumber::Ast::Table
  @spec = table.hashes
end

Given /^any of the created cards:$/ do |table|
  # table is a Cucumber::Ast::Table
  @cards = []
  table.hashes.each do |row|
    @cards << Card.new(row[:ordinal].to_i, row[:suit])
  end
end

When /^I create a card$/ do
  @cards = []
  @spec.each do |row|
    begin
      @cards << Card.new(row[:ordinal].to_i, row[:suit])
    rescue StandardError => e
      @error = e
    end
  end
end

When /^I compare the cards$/ do
  @lookup = {}
  @cards.each do |card|
    @lookup["#{card.ordinal} - #{card.suit}"] = card
  end
end

Then /^I should receive a valid card$/ do
  @cards.each do |card|
    card.should be_an_instance_of Card
    card.should_not be_nil
  end
  @cards.should have_at_least(1).cards
end

Given /^the suit "([^"]*)" and the ordinal "([^"]*)"$/ do |suit, ordinal|
  @spec = [{:ordinal => ordinal, :suit => suit}]
end

Then /^I should receive an error$/ do
  @cards.should be_empty
  @error.should_not be_nil
end

Then /^"([^"]*)" of "([^"]*)" should be less than "([^"]*)" of "([^"]*)"$/ do |ordinal1, suit1, ordinal2, suit2|
  @lookup["#{ordinal1} - #{suit1}"].should < @lookup["#{ordinal2} - #{suit2}"]
end

