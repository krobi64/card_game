Feature: Card
  In order to create a deck of cards
  As a dealer
  I want to be able to create valid cards
  
  Scenario: Valid
    Given any of the following cards:
      | ordinal | suit      |
      | 2       | clubs     |
      | 3       | clubs     |
      | 4       | clubs     |
      | 5       | clubs     |
      | 6       | clubs     |
      | 7       | clubs     |
      | 8       | clubs     |
      | 9       | clubs     |
      | 10      | clubs     |
      | 11      | clubs     |
      | 12      | clubs     |
      | 13      | clubs     |
      | 14      | clubs     |
      | 2       | diamonds  |
      | 3       | diamonds  |
      | 4       | diamonds  |
      | 5       | diamonds  |
      | 6       | diamonds  |
      | 7       | diamonds  |
      | 8       | diamonds  |
      | 9       | diamonds  |
      | 10      | diamonds  |
      | 11      | diamonds  |
      | 12      | diamonds  |
      | 13      | diamonds  |
      | 14      | diamonds  |
      | 2       | hearts    |
      | 3       | hearts    |
      | 4       | hearts    |
      | 5       | hearts    |
      | 6       | hearts    |
      | 7       | hearts    |
      | 8       | hearts    |
      | 9       | hearts    |
      | 10      | hearts    |
      | 11      | hearts    |
      | 12      | hearts    |
      | 13      | hearts    |
      | 14      | hearts    |
      | 2       | spades    |
      | 3       | spades    |
      | 4       | spades    |
      | 5       | spades    |
      | 6       | spades    |
      | 7       | spades    |
      | 8       | spades    |
      | 9       | spades    |
      | 10      | spades    |
      | 11      | spades    |
      | 12      | spades    |
      | 13      | spades    |
      | 14      | spades    |
      | 2       | stars     |
      | 3       | stars     |
      | 4       | stars     |
      | 5       | stars     |
      | 6       | stars     |
      | 7       | stars     |
      | 8       | stars     |
      | 9       | stars     |
      | 10      | stars     |
      | 11      | stars     |
      | 12      | stars     |
      | 13      | stars     |
      | 14      | stars     |
      | 2       | cups      |
      | 3       | cups      |
      | 4       | cups      |
      | 5       | cups      |
      | 6       | cups      |
      | 7       | cups      |
      | 8       | cups      |
      | 9       | cups      |
      | 10      | cups      |
      | 11      | cups      |
      | 12      | cups      |
      | 13      | cups      |
      | 14      | cups      |
      | 2       | pentacles |
      | 3       | pentacles |
      | 4       | pentacles |
      | 5       | pentacles |
      | 6       | pentacles |
      | 7       | pentacles |
      | 8       | pentacles |
      | 9       | pentacles |
      | 10      | pentacles |
      | 11      | pentacles |
      | 12      | pentacles |
      | 13      | pentacles |
      | 14      | pentacles |
      | 2       | swords    |
      | 3       | swords    |
      | 4       | swords    |
      | 5       | swords    |
      | 6       | swords    |
      | 7       | swords    |
      | 8       | swords    |
      | 9       | swords    |
      | 10      | swords    |
      | 11      | swords    |
      | 12      | swords    |
      | 13      | swords    |
      | 14      | swords    |
      | 2       | wands     |
      | 3       | wands     |
      | 4       | wands     |
      | 5       | wands     |
      | 6       | wands     |
      | 7       | wands     |
      | 8       | wands     |
      | 9       | wands     |
      | 10      | wands     |
      | 11      | wands     |
      | 12      | wands     |
      | 13      | wands     |
      | 14      | wands     |
    When I create a card
    Then I should receive a valid card
    
  Scenario: Testing singlular suit name
    Given the suit "spade" and the ordinal "5"
    When I create a card
    Then I should receive a valid card
  
  Scenario: Invalid Ordinal
    Given the suit "spades" and the ordinal "20"
    When I create a card
    Then I should receive an error
  
  Scenario: Invalid Suit
    Given the suit "blizzards" and the ordinal "5"
    When I create a card
    Then I should receive an error
  
  
  
  

  
