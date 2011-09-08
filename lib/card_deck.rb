class CardDeck
  
  @deck
  @discard
  
  attr_accessor :deck, :discard
  
  def initialize
    get_deck
  end
  
  def size
    @deck.size
  end
  
  def get_deck
    self.deck = []
    self.discard = []
    [Card::CLUB, Card::DIAMOND, Card::HEART, Card::SPADE].each do |suit|
      (Card::MIN_ORDINAL..Card::MAX_ORDINAL).each do |ordinal|
        self.deck << Card.new(ordinal, suit)
      end
    end
    shuffle
  end
  
  def shuffle
    self.deck.each_with_index do |card, i|
      new_position = rand(self.deck.size) - 1
      swapped_card = self.deck[new_position]
      self.deck[new_position] = card
      self.deck[i] = swapped_card
    end 
  end
  
  def deal_card
    self.deck.pop
  end
  
  def deal(num_cards, players)
    gather_cards if self.deck.size < (num_cards * players.size)
    players.each do |player|
      player.clear_hand
    end
    
    (1..num_cards).each do |i|
      players.each do |player|
        player.hand << self.deal_card
      end
    end
  end
  
  def discard_card(card)
    if !self.deck.include?(card) && !self.discard.include?(card)
      self.discard << card
    else
      raise "Invalid Discard - Duplicate Card"
    end
  end
      
  def gather_cards
    self.deck += self.discard
    shuffle
    self.discard = []
  end
              
end