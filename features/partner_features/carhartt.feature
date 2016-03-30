@partners @carhartt @version2
Feature: Test the Carhartt Partner Integration

  Background:
    * carhartt - I add an item to the cart

  @troop_id @windows @sauce
  Scenario: Test Carhartt Military Discount
    * carhartt - I apply the "Troop ID" discount
    * carhartt - I verify the "Troop ID" discount has been applied
