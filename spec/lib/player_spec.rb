require 'spec_helper'

describe Player do
  describe "upon creation" do
    it "has an empty hand" do
      player = Player.new
      player.hand.should be_empty
    end
  end
  
  describe "when discarding cards" do
    before(:each) do
      @card_deck = mock CardDeck
      @card_deck.stub(:discard_card)
      @card = mock Card
      @card2 = mock Card
      @player = Player.new
      @player.hand << @card
      @player.hand << @card2
    end
    
    describe "#discard" do
      it "invokes CardDeck#discard_card" do
        @card_deck.should_receive(:discard_card)
        @player.discard @card, @card_deck
      end
      
      it "removes a card from the player's hand" do
        @player.discard @card, @card_deck
        @player.hand.size.should == 1
      end
    end
    
    describe "#play_card" do
      before(:each) do
        @deck = mock CardDeck::Base
        @deck.stub(:hand_played)
        @real_card = mock Card
        @cheat_card = mock Card
        @player = Player.new
        @player.hand << @real_card
      end
      
      it "raises an error if the card 'played' is not in the players hand" do
        lambda{@player.play_card(@cheat_card, @deck)}.should raise_error(Card::InvalidCardError)
      end
      
      it "returns the card being played" do
        @player.play_card(@real_card, @deck).should == @real_card
      end
      
      it "removes the card from the player's hand" do
        @player.play_card @real_card, @deck
        @player.hand.should_not include @real_card
      end
    end

    describe "#clear_hand" do
      it "invokes CardDeck#discard_card" do
        @card_deck.should_receive(:discard_card)
        @player.clear_hand @card_deck
      end
      
      it "removes all the cards from the player's hand" do
        @player.clear_hand @card_deck
        @player.hand.should be_empty
      end
    end    
  end
  
  describe "#human_hand" do
    before(:each) do
      @card1 = mock Card
      @card1.stub(:to_s).and_return("Ace of Hearts")
      @card2 = mock Card
      @card2.stub(:to_s).and_return("King of Spades")
      @player = Player.new
      @player.hand << @card1
      @player.hand << @card2
    end
    
    it "prints the card in readable format" do
      @player.human_hand.should == ["Ace of Hearts", "King of Spades"]
    end
  end
  

end