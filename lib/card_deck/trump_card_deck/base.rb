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
      @trumps = []
      @leads = []
      @current_hand.each do |player_submission|
        if is_trump? player_submission[:card]
          @trumps << player_submission
        elsif is_lead_suit? player_submission[:card]
          @leads << player_submission
        end
      end
      return winning_card(@trumps) unless @trumps.empty?
      winning_card(@leads)
    end
    
    def winning_card(player_submissions)
      winner = nil
      player_submissions.each do |player_submission|
        if winner.nil?
          winner = player_submission
        elsif player_submission[:card].ordinal > winner[:card].ordinal
          winner = player_submission
        end
      end
      winner[:player]
    end
  end
end