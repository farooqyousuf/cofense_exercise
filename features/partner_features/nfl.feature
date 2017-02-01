@fanatics @nfl @desktop @top_partners
Feature: Test the ID.me NFL Shop Partner Integration

  @troop_id @windows
  Scenario: Test NFL Shop Partner Integration
    * I add an item to the cart ("NFL")
    * I apply the Troop ID discount ("NFL")
    * I verify the Troop ID discount has been applied ("NFL")

  @mobile @nfl_mobile
  Scenario: Test NFL Mobile Shop Partner Integration
    * NFL_M - I add an item to the cart
    * NFL_M - I apply the Troop ID discount
    * NLF_M - I verify the Troop ID discount has been applied
