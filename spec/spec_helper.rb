dir = File.dirname(__FILE__) + "/.."
require File.join(dir, 'card_game')

class CardDeck
  def [](i)
     self.deck[i]
   end
end
