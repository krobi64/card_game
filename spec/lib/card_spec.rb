require 'spec_helper'

describe Card do
  it "accepts any ordinal between 2 and 14" do
    lambda{Card.new(13, Card::CLUB)}.should_not raise_error
  end
  
  it "does not accept any ordinal outside of 2..14" do
    lambda{Card.new(15, Card::CLUB)}.should raise_error
  end
  
  it "accepts any valid suit" do
    lambda{Card.new(5, Card::SPADE)}.should_not raise_error
    lambda{Card.new(5, Card::HEART)}.should_not raise_error
    lambda{Card.new(5, Card::DIAMOND)}.should_not raise_error
    lambda{Card.new(5, Card::CLUB)}.should_not raise_error
  end
  
  it "does not accept invalid suits" do
    lambda{Card.new(5, "star")}.should raise_error
  end
  
  describe "#to_s" do
    it "prints a human-readable value of the card" do
      card = king_spade = Card.new(13, Card::SPADE)
      card.to_s.should == "King of Spades"
    end
  end
  
end
