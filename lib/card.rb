class Card
  CLUB = 1
  DIAMOND = 2
  HEART = 3
  SPADE = 4
  
  MAX_ORDINAL = 13
  MIN_ORDINAL = 1
  
  @ordinal
  @suit
  
  def initialize(ordinal, suit)
    self.ordinal = ordinal = ordinal || 2
    self.suit = suit || Card::CLUB
  end
  
  def <=>(card)
    if self.ordinal > card.ordinal
      return 1
    elsif self.ordinal == card.ordinal
      return 0
    else
      return -1
    end
  end
  
  def ordinal
    @ordinal
  end
  
  def ordinal=(value)
    if Card::MAX_ORDINAL >= value && Card::MIN_ORDINAL <= value
      @ordinal = value
    else
      raise Error.new("Invalid card value")
    end
  end
  
  def suit
    @suit
  end
  
  def suit=(value)
    if ([Card::CLUB, Card::DIAMOND, Card::HEART, Card::SPADE]).include? value
      @suit = value
    else
      raise Error.new("Invalid Suit")
    end
  end
  
  def to_s
    "#{human_ordinal} of #{human_suit}"
  end
  
  def human_ordinal
    case self.ordinal
    when 13
      "King"
    when 12
      "Queen"
    when 11
      "Jack"
    when 1
      "Ace"
    else
      self.ordinal.to_s
    end
  end
  
  def human_suit
    case self.suit
    when Card::CLUB
      "Clubs"
    when Card::DIAMOND
      "Diamonds"
    when Card::HEART
      "Hearts"
    when Card::SPADE
      "Spades"
    end
  end
end