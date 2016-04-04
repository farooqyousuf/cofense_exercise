@partners @moosejaw @version2
Feature: Test the Moosejaw Partner Integration

  Background:
    * moosejaw - I add an item to the cart

  Scenario: Test Moosejaw Military Discount
    * moosejaw - I apply the Troop ID discount
    * moosejaw - I verify the troop ID discount has been applied
