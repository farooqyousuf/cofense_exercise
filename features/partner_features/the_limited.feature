@partners @version2 @desktop @the_limited
Feature: Test The Limited Partner Integration
  Background:
    * LIMITED- I visit the shop page
    * LIMITED- I add a item to the cart
    * LIMITED- I visit the checkout flow

  Scenario: Test Limited Military Integration
    * LIMITED- I sign in with my Id.me military account
    * LIMITED- I verify my military discount was applied 