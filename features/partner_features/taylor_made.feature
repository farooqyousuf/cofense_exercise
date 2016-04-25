@partners @taylormade @version2
Feature: Test Taylor Made partner sites integrations
  @taylormadegolf
  Scenario: Test military integration for taylormadegolf.com
    * TAYLOR MADE - I add a item to the checkout cart
    * TAYLOR MADE - I apply the Troop ID discount
    * TAYLOR MADE - I verify the Troop ID discount has been applied
 	
 	@adidasgolf
  Scenario: Test military integration for adidasgolf.com
    * ADIDAS GOLF - I add a item to the checkout cart
    * TAYLOR MADE - I apply the Troop ID discount
    * TAYLOR MADE - I verify the Troop ID discount has been applied

  @ashworthgolf
  Scenario: Test military integration for ashworthgolf.com
    * ASHWORTH GOLF - I add a item to the checkout cart
    * TAYLOR MADE - I apply the Troop ID discount
    * TAYLOR MADE - I verify the Troop ID discount has been applied
