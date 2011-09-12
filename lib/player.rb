class Player
  @hand
  
  attr_accessor :hand
  
  def initialize
    @hand = []
  end
  
  def play_card(card, deck)
    if self.hand.include? card
      i = self.hand.index card
      deck.hand_played self, card
      return self.hand.delete_at i
    else
      raise Card::InvalidCardError.new "Card not found in players hand"
    end
  end
  
  def clear_hand(card_deck)
    self.hand = [] if hand.nil?
    if hand.size > 0
      hand.each do |card|
        discard card, card_deck
      end
    end
  end
  
   def discard(card, card_deck)
     self.hand -= [card]
     card_deck.discard_card(card)
   end
   
   def human_hand
     self.hand.map { |card| card.to_s }
   end
   
end