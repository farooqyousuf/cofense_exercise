@fanatics @partners
Feature: Test the ID.me Fanatics Partner Integration

  @troop_id @windows @sauce
  Scenario: Test Fanatics Shop Partner Integration
    * I add an item to the cart ("FAN")
    * I apply the Troop ID discount ("FAN")
    * I verify the discount has been applied ("FAN") 
