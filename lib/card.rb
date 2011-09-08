class Card
  include Comparable
  
  CLUB = 1
  DIAMOND = 2
  HEART = 3
  SPADE = 4
  STAR = 5
  CUP = 6
  PENTACLE = 7
  SWORD = 8
  WAND = 9
  
  MAX_ORDINAL = 14
  MIN_ORDINAL = 2
  
  @ordinal
  @suit
  
  def initialize(ordinal, suit)
    self.ordinal = ordinal || 2
    self.suit = suit || Card::CLUB
  end
    
  def ordinal
    @ordinal
  end
  
  def ==(card)
    return self.ordinal == card.ordinal && self.suit == card.suit
  end
 
  def ordinal=(value)
    if Card::MAX_ORDINAL >= value && Card::MIN_ORDINAL <= value
      @ordinal = value
    else
      raise "Invalid card value"
    end
  end
  
  def suit
    @suit
  end
  
  def suit=(value)
    if ([Card::CLUB, Card::DIAMOND, Card::HEART, Card::SPADE]).include? value
      @suit = value
    else
      raise "Invalid Suit"
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
    when 14
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
    when Card::CUP
      "Cups"
    when Card::PENTACLE
      "Pentacles"
    when Card::SWORD
      "Swords"
    when Card::WAND
      "Wands"
    end
  end
end