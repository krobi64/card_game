require 'spec_helper'

describe CardDeck::TrumpCardDeck::EuchreDeck do
  
  it "is a deck of 24 cards" do
    deck = CardDeck::TrumpCardDeck::EuchreDeck.new
    deck.size.should == 24
  end
  
end