class Player
  @hand
  
  attr_accessor :hand
  
  def initialize
    @hand = []
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