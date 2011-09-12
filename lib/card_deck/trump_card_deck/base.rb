module CardDeck::TrumpCardDeck

  class Base < CardDeck::Base
    attr_reader :trump_suit, :lead_suit, :current_hand
  
    def trump_suit=(suit)
      if self.class.valid_suit? suit
        @trump_suit = suit
      else
        raise "Invalid Trump Suit"
      end
    end
  
    def lead_suit=(suit)
      if self.class.valid_suit?(suit) || suit.nil?
        @lead_suit = suit
      else
        raise "Invalid Lead Suit"
      end
    end
  
    def is_lead_suit?(card)
      card.suit == lead_suit
    end
  
    def is_trump?(card)
      card.suit == trump_suit
    end
    
    def new_hand
      @lead_suit = nil
      @current_hand = []
    end
    
    def hand_played(player, card)
      @lead_suit = card.suit if lead_suit.nil?
      @current_hand << {:player => player, :card => card}
    end
    
    def rank_hand
      return @current_hand[0][:player]
    end
  
  end
end