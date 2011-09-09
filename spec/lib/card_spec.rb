require 'spec_helper'

describe Card do
  it "accepts any ordinal between 2 and 14" do
    lambda{Card.new(13, :clubs)}.should_not raise_error
  end
  
  it "does not accept any ordinal outside of 2..14" do
    lambda{Card.new(15, :clubs)}.should raise_error
  end
  
  it "accepts any valid suit" do
    lambda{Card.new(5, :spades)}.should_not raise_error
    lambda{Card.new(5, :hearts)}.should_not raise_error
    lambda{Card.new(5, :diamonds)}.should_not raise_error
    lambda{Card.new(5, :clubs)}.should_not raise_error
  end
  
  it "does not accept invalid suits" do
    lambda{Card.new(5, :blizzards)}.should raise_error
  end
  
  describe "#to_s" do
    it "prints a human-readable value of the card" do
      card = Card.new(13, :spades)
      card.to_s.should == "King of Spades"
    end
  end
  
end
