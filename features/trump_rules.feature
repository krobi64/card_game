Feature: Trump rules - Individual Books
  In order to determine the winner
  As the trump game
  I want to be able to determine the winner of a single book in the game

Scenario: Ranking play on a trump hand with a different lead
  Given "4" players
    And I create a trump deck
    And "spades" are trump
    And the players receive the following cards:
     | player | card_rank | card_suit  |
     | 0      | 14        |  clubs     |
     | 1      | 10        |  clubs     |
     | 2      | 14        |  diamonds  |
     | 3      | 2         |  spades    |
  When each player plays their card
  Then player "3" should win the hand

Scenario: Ranking play on a trump hand with a trump lead
  Given "4" players
    And I create a trump deck
    And "spades" are trump
    And the players receive the following cards:
     | player | card_rank | card_suit  |
     | 0      | 14        |  spades     |
     | 1      | 10        |  clubs     |
     | 2      | 14        |  diamonds  |
     | 3      | 2         |  spades    |
  When each player plays their card
  Then player "0" should win the hand

Scenario: Ranking play on a no-trump hand
  Given "4" players
    And I create a trump deck
    And "spades" are trump
    And the players receive the following cards:
     | player | card_rank | card_suit  |
     | 0      | 9         |  clubs     |
     | 1      | 10        |  clubs     |
     | 2      | 14        |  diamonds  |
     | 3      | 2         |  hearts    |
  When each player plays their card
  Then player "1" should win the hand
  
