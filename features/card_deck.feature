Feature: Card deck
  In order to play different games
  As a dealer
  I want to be able to define my deck of playing cards
  
Scenario: Getting a default deck
  Given Nothing whatsoever
  When I create the default card deck
  Then I should have "52" cards
    And the suits should be "spades, hearts, diamonds, clubs"
    And the ranks should range from "2" to "14"




  
