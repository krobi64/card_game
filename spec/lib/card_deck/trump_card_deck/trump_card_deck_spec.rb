require 'spec_helper'

describe CardDeck::TrumpCardDeck::Base do
  before(:each) do
    @deck = CardDeck::TrumpCardDeck::Base.new
  end

  it "stores a trump suit if the suit is valid" do
    @deck.trump_suit = :spades
    @deck.trump_suit.should == :spades
  end
  
  it "raises an error if the trump suit is not valid" do
    lambda{@deck.trump_suit = :stars}.should raise_error
  end
  
  describe "#is_trump?" do
    before(:each) do
      @deck.trump_suit = :spades
    end
    
    it "recognizes when a card is trump" do
      card = Card.new 14, :spades
      @deck.is_trump?(card).should be_true
    end

    it "recognizes when a card is not" do
      card = Card.new 14, :diamonds
      @deck.is_trump?(card).should_not be_true
    end

  end
  
  describe "#is_lead_suit?" do
    before(:each) do
      @deck.lead_suit = :clubs
    end
    
    it "recognizes when a card is part of the leading suit" do
      card = Card.new 13, :clubs
      @deck.is_lead_suit?(card).should be_true
    end
    
    it "recognizes when a card is not" do
      card = Card.new 14, :diamonds
      @deck.is_lead_suit?(card).should_not be_true
    end
  end
  
  describe "ranking hands" do
    before(:each) do
      suits = [:diamonds, :spades, :clubs, :hearts]
      ordinals = [8, 12, 14, 8]
      @players = []
      @cards = []
      (0..3).each do |i|
        card = mock Card
        card.stub(:suit).and_return(suits[i])
        card.stub(:ordinal).and_return(ordinals[i])
        @cards << card
        player = mock Player
        player.stub(:play_card).and_return(card)
        @players << player
      end
      @deck.new_hand      
      @players.each do |player|
        @deck.hand_played player, player.play_card
      end
    end # before :each
    
    describe "#hand_played" do      
      it "correctly marks the leading suit" do
        @deck.lead_suit.should == :diamonds
      end

      it "keeps track of which player played which card" do
        @deck.current_hand.each_with_index do |hand, i|
          hand[:player].should == @players[i]
          hand[:card].should == @cards[i]
        end
      end
    end
    
    describe "#rank_hand" do
      context "when there is no trump and only one leading suit" do
        it "returns the first player" do
          @deck.rank_hand.should == @players[0]
        end
      end
      
      context "when there is no trump and more than one play the leading suit" do
        before(:each) do
          @deck.new_hand
        end
        it "returns the player with the highest ordinal in the leading suit" do
          
        end
      end
    end  
  end
  
end