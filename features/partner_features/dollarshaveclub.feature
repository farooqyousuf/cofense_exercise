@partners @dollarshaveclub
Feature: Test the ID.me Dollar Shave Club Partner Integration

  Scenario: Test Military Partner HLP Integration
    * shave - I visit the hlp page and get promo code
    * shave - I sign up a new membership and apply Troop ID promo code
    * shave - I verify the Troop ID discount has been applied
