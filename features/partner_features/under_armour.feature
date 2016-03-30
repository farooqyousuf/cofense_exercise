@underarmour @partners @version2
Feature: Test the ID.me Under Armour Partner Integration

  Background:
    * UA - I add an item to the cart

  @troop_id @windows @sauce
  Scenario: Test Under Armour Military Partner Integration
    * UA - I apply the "Troop ID" discount
    * UA - I verify the "Troop ID" discount has been applied
