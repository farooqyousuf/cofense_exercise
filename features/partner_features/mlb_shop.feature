@desktop
Feature: Test the ID.me MLB shop Integration

  @troop_id @windows @sauce @version2 @mlb_shop
  Scenario: Test MLB Shop Military Partner Integration
    * MLBSHOP - I add an item to the cart
    * MLBSHOP - I apply the Troop ID discount
    * MLBSHOP - I verify the Troop ID discount has been applied