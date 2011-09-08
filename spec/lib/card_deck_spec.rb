require 'spec_helper'

describe CardDeck do
  describe "upon creation" do
    it "returns a full deck of cards" do
      deck = CardDeck.new
      deck.size.should == 52
    end
    
    it "returns a shuffled deck" do
      deck = CardDeck.new
      deck[0].should_not == Card.new(1, Card::CLUB)
    end
  end
  
  describe "#deal_card" do
    it "returns the first card on the deck" do
      deck = CardDeck.new
      a = deck[deck.size - 1]
      b = deck.deal_card
      a.should == b
    end
    
    it "removes the card from the deck" do
      deck = CardDeck.new
      card = deck.deal_card
      deck.deck.should_not include card
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
      deck = CardDeck.new
      card1 = deck[deck.size - 1]
      card2 = deck[deck.size - 2]
      card3 = deck[deck.size - 3]
      card4 = deck[deck.size - 4]
      deck.deal 2, @players
      @kris.hand[0].should == card1
      @marge.hand[0].should == card2
      @marj.hand[0].should == card3
      @joann.hand[0].should == card4
    end
  end
  
  describe "#discard_card" do
    it "places the card in the discard pile" do
      deck = CardDeck.new
      card = deck.deal_card
      deck.discard_card(card)
      deck.discard[0].should == card
    end
    
    it "does not allow a duplicate card to be placed in discard" do
      deck = CardDeck.new
      lambda{deck.discard_card(Card.new(1, Card::SPADE))}.should raise_error
    end
  end
  
  describe "#gather_cards" do
    it "returns all cards to the deck and shuffles the deck" do
      deck = CardDeck.new
      card = deck.deal_card
      deck.discard_card(card)
      test_case = deck[0]
      deck.gather_cards
      deck.discard.size.should == 0
      deck.size.should == 52
      deck[0].should_not == test_case
    end
  end
  
end