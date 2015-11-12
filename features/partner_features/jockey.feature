@jockey
Feature: Test the ID.me Jockey.com Partner Integration

  @troop_id
  Scenario: Test Jockey Troop ID partner Integration
    * JO - I add an item to the cart
    * JO - I apply the Troop ID discount
    * JO - I verify the Troop ID discount has been applied
