require 'spec_helper'

describe CardDeck::Base do
  before(:each) do
    @deck = CardDeck::Base.new
  end
  
  describe "upon creation" do
    it "returns a full deck of cards" do
      @deck.size.should == 52
    end
    
    it "returns a shuffled deck" do
      @deck.cards.should_not == @deck.cards.sort
    end
  end
  
  describe "#deal_card" do
    it "returns the first card on the deck" do
      a = @deck[@deck.size - 1]
      b = @deck.deal_card
      a.should == b
    end
    
    it "removes the card from the deck" do
      card = @deck.deal_card
      @deck.cards.should_not include card
    end
  end
  
  describe "#deal" do
    
    before(:each) do
      @kris = Player.new
      @marge = Player.new
      @marj = Player.new
      @joann = Player.new
      @players = [@kris, @marge, @marj, @joann]
    end
    
    it "distributes the correct number of cards to players, in order" do
      card1 = @deck[@deck.size - 1]
      card2 = @deck[@deck.size - 2]
      card3 = @deck[@deck.size - 3]
      card4 = @deck[@deck.size - 4]
      @deck.deal 2, @players
      @kris.hand[0].should == card1
      @kris.hand.size.should == 2
      @marge.hand[0].should == card2
      @marge.hand.size.should == 2
      @marj.hand[0].should == card3
      @marj.hand.size.should == 2
      @joann.hand[0].should == card4
      @joann.hand.size.should == 2
    end
  end
  
  describe "#discard_card" do
    it "places the card in the discard pile" do
      card = @deck.deal_card
      @deck.discard_card(card)
      @deck.discard[0].should == card
    end
    
    it "does not allow a duplicate card to be placed in discard" do
      lambda{@deck.discard_card(Card.new(14, :spades))}.should raise_error
    end
  end
  
  describe "#gather_cards" do
    it "returns all cards to the deck and shuffles the deck" do
      old_deck = @deck.cards.clone
      card = @deck.deal_card
      @deck.discard_card(card)
      
      @deck.gather_cards
      @deck.discard.size.should == 0
      @deck.size.should == 52
      
      @deck.cards.should_not == old_deck
    end
  end
  
end