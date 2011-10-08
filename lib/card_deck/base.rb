module CardDeck

class Base
  
  DEFAULT_SUITS = [:clubs, :diamonds, :hearts, :spades]
  DEFAULT_QTY_DECKS = 1
  DEFAULT_ORDINALS = (Card::MIN_ORDINAL..Card::MAX_ORDINAL)
  
  @valid_suits = Base::DEFAULT_SUITS
  @number_of_decks = Base::DEFAULT_QTY_DECKS
  @valid_ordinals = Base::DEFAULT_ORDINALS  
  
  attr_accessor :discard, :cards
  
  class << self
    
    def number_of_decks(number_of_decks)
      @number_of_decks = number_of_decks
    end
    
    def valid_ordinals(ordinals)
      @valid_ordinals = ordinals
    end
    
    def valid_suits(suits)
      @valid_suits = suits
    end
    
    def valid_suit?(suit)
      (@valid_suits || Base::DEFAULT_SUITS).include? suit
    end
    
    def valid_ordinal?(ordinal)
      (@valid_ordinals || Base::DEFAULT_ORDINALS).include? ordinal
    end
    
    def total_decks
      @number_of_decks
    end
    
    def get_deck
      deck = []
      (1..(@number_of_decks || Base::DEFAULT_QTY_DECKS)).each do  
        (@valid_suits || Base::DEFAULT_SUITS).each do |suit|
          (@valid_ordinals || Base::DEFAULT_ORDINALS).each do |ordinal|
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
    @cards = self.class.get_deck
    @discard = []
  end
    
  def size
    @cards.size
  end
  
  def deal_card
    @cards.pop
  end
  
  def deal(num_cards, players)
    gather_cards if @cards.size < (num_cards * players.size)
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
    if @cards.count(card) + self.discard.count(card) + 1 <= self.class.total_decks
      @discard << card
    else
      raise "Invalid Discard - Duplicate Card"
    end
  end
      
  def gather_cards
    @cards += @discard
    Base.shuffle @cards
    @discard = []
  end
              
end
end