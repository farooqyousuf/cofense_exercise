@fanatics @partners
Feature: Test the ID.me Fanatics Partner Integration

  Background:
    * I add an item to the cart ("FAN")

  @troop_id @windows @saucegit
  Scenario: Test Fanatics Shop Military Partner Integration
    * I apply the Troop ID discount ("FAN")
    * I verify the Troop ID discount has been applied ("FAN")
