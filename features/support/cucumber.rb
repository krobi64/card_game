directory = File.dirname(__FILE__) + "/../.."
require File.join(directory, 'card_game')

include Util::StringHelper

def sort_deck(cards)
  hash = {}
  cards.each do |card|
    if hash.has_key? card.suit
      if hash[card.suit].has_key? card.ordinal
        hash[card.suit][card.ordinal] += 1
      else
        hash[card.suit][card.ordinal] = 1
      end
    else
      hash[card.suit] = { card.ordinal => 1 }
    end
  end
  hash
end
