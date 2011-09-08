require 'spec_helper'

describe EuchreDeck do
  
  it "is a deck of 24 cards" do
    deck = EuchreDeck.new
    deck.size.should == 24
  end
  
end