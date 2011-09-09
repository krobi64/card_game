class CardDeck
  
  DEFAULT_SUITS = [Card::CLUB, Card::DIAMOND, Card::HEART, Card::SPADE]
  DEFAULT_QTY_DECKS = 1
  DEFAULT_ORDINALS = (Card::MIN_ORDINAL..Card::MAX_ORDINAL)
  
  @valid_suits = CardDeck::DEFAULT_SUITS
  @number_of_decks = CardDeck::DEFAULT_QTY_DECKS
  @valid_ordinals = CardDeck::DEFAULT_ORDINALS
  
  attr_accessor :deck, :discard
  
  class << self
    
    def valid_ordinals(ordinals)
      @valid_ordinals = ordinals
    end
    
    def get_deck
      deck = []
      (1..(@number_of_decks || CardDeck::DEFAULT_QTY_DECKS)).each do  
        (@valid_suits || CardDeck::DEFAULT_SUITS).each do |suit|
          (@valid_ordinals || CardDeck::DEFAULT_ORDINALS).each do |ordinal|
            deck << Card.new(ordinal, suit)
          end
        end
      end
      shuffle deck
    end

    def shuffle(deck)
      deck.each_index do |i|
        new_position = rand(deck.size) - 1
        swapped_card = deck[new_position]
        deck[new_position] = deck[i]
        deck[i] = swapped_card
      end
      deck 
    end
    
  end
  
  def initialize
    @deck = self.class.get_deck
    @discard = []
  end
    
  def size
    @deck.size
  end
    
  def deal_card
    @deck.pop
  end
  
  def deal(num_cards, players)
    gather_cards if @deck.size < (num_cards * players.size)
    players.each do |player|
      player.clear_hand self
    end
    
    (1..num_cards).each do |i|
      players.each do |player|
        player.hand << deal_card
      end
    end
  end
  
  def discard_card(card)
    if !@deck.include?(card) && !self.discard.include?(card)
      @discard << card
    else
      raise "Invalid Discard - Duplicate Card"
    end
  end
      
  def gather_cards
    @deck += @discard
    CardDeck.shuffle @deck
    @discard = []
  end
              
end