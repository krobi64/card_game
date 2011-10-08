dir = File.dirname(__FILE__) + "/.."
require File.join(dir, 'card_game')
require 'simplecov'

class CardDeck::Base
  def [](i)
     self.cards[i]
   end
end
