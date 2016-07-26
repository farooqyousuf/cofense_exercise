@jockey @desktop @version2
Feature: Test the ID.me Jockey.com Partner Integration

  @troop_id
  Scenario: Test Jockey Troop ID partner Integration
    * JO - I add an item to the cart
    * JO - I apply the "troop_id" discount
    * JO - I verify the IDme discount has been applied
