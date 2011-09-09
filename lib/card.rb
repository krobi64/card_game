class Card
  include Comparable
  include Util::StringHelper
  
  VALID_SUITS = [:clubs, :diamonds, :hearts, :spades, :stars, :cups, :pentacles, :swords, :wands]
  
  MAX_ORDINAL = 14
  MIN_ORDINAL = 2
  
  @ordinal
  @suit
  
  attr_reader :ordinal, :suit
  
  def initialize(ordinal=2, suit=:clubs)
    self.ordinal = ordinal
    self.suit = pluralize(suit.to_s).to_sym
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
  
  def suit=(value)
    if (Card::VALID_SUITS).include? value
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
    self.suit.to_s.capitalize
  end
end