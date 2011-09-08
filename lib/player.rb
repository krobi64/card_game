class Player
  @hand
  
  attr_accessor :hand
  
  def initialize
    self.clear_hand
  end
  
  def clear_hand
    self.hand = [] if self.hand.nil?
    if self.hand.size > 0
      self.hand.each do |card|
        self.discard card
      end
    end
  end
  
   def discard(card, card_deck)
     @hand -= card
     card_deck.discard_card(card)
   end
   
   def human_hand
     a = []
     self.hand.each do |card|
       a << card.to_s
     end
     a
   end
     
end