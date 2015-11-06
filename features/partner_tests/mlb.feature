@mlb @partners
Feature: Test the ID.me MLB.tv Integration

  Background:
    * MLB - I add an item to the cart

  @troop_id @windows @sauce
  Scenario: Test MLB.tv Military Partner Integration
    * MLB - I apply the Troop ID discount
    * MLB - I verify the Troop ID discount has been applied
