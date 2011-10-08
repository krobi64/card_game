require 'spec_helper'

describe Card do
  it "accepts any ordinal between 2 and 14" do
    lambda{Card.new(13, :clubs)}.should_not raise_error
  end
  
  it "does not accept any ordinal outside of 2..14" do
    lambda{Card.new(15, :clubs)}.should raise_error(Card::InvalidCardError)
  end
  
  it "accepts any valid suit" do
    lambda{Card.new(5, :spades)}.should_not raise_error
    lambda{Card.new(5, :hearts)}.should_not raise_error
    lambda{Card.new(5, :diamonds)}.should_not raise_error
    lambda{Card.new(5, :clubs)}.should_not raise_error
  end
  
  it "does not accept invalid suits" do
    lambda{Card.new(5, :blizzards)}.should raise_error(Card::InvalidCardError)
  end
  
  describe "#to_s" do
    it "prints a human-readable value of the card" do
      card = Card.new(13, :spades)
      card.to_s.should == "King of Spades"
    end
  end
  
  describe "#<=>" do
    before(:each) do
      @ace_spades = Card.new(14, :spades)
      @three_spades = Card.new(3, :spades)
      @ace_diamonds = Card.new(14, :diamonds)
      @three_diamonds = Card.new(3, :diamonds)
      @ace_up_sleeve = Card.new(14, :spades)
    end
    
    it "matches cards of same rank and suit" do
      (@ace_spades == @ace_up_sleeve).should be_true
    end
    
    it "defaults to Ace high" do
      (@ace_diamonds > @three_diamonds).should be_true
      (@ace_diamonds > @three_spades).should be_true
      (@ace_spades > @three_diamonds).should be_true
    end
    
    it "sorts same rank by suit" do
      (@ace_spades > @ace_diamonds).should be_true
    end
    
  end
  
end
