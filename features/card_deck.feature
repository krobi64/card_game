Feature: Card decks
  In order to play different games
  As a dealer
  I want to be able to define my deck of playing cards
  
Scenario: Getting a default deck
  When I create the default card deck
  Then I should have "52" cards
    And the suits should be "spades, hearts, diamonds, clubs"
    And the ranks should range from "2" to "14"
      But no cards should match
      And I should have "1" of each card
    
Scenario: Getting a euchre deck
  When I create a euchre deck
  Then I should have "24" cards
    And the suits should be "spades, hearts, diamonds, clubs"
    And the ranks should range from "9" to "14"
      But no cards should match
      And I should have "1" of each card
      
Scenario: Getting a pinochle deck
  When I create a pinochle deck
  Then I should have "104" cards
    And the suits should be "spades, hearts, diamonds, clubs"
    And the ranks should range from "2" to "14"
    And I should have "2" of each card

Scenario: Dealing a hand
  Given "4" players
    And I create the default card deck
  When I deal "5" cards
  Then each player should have "5" cards
    And the deck should have "32" cards remaining
    
Scenario: Dealing a euchre hand
  Given "4" players
    And I create a euchre deck
  When I deal "5" cards
  Then each player should have "5" cards
    And the deck should have "4" cards remaining
   










  
