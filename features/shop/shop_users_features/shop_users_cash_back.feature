@regression @shop @shop_cash_back @desktop
Feature: Test the shop_users Cash Back - My Cash

  Background:
   * I visit "ShopLandingPage"
   * I click on the Shop Sign Up link
   * I sign up as a new user
   * I visit "CashBack_PurchasesPage"
   * I save the new user email

   Scenario: Purchases - Summary Info Card Check
   * Cash Back Activity Tab should be selected
   * I check Summary Info Card existence

   Scenario: Purchases - Next Payment Info Card Check
   * Cash Back Activity Tab should be selected
   * I check Next Payment Info Card existence

   Scenario: Purchases - Purchases Table Check
   * Cash Back Activity Tab should be selected
   * I check Purchases Table existence
   * I check Purchases Table content

   @raichu
   Scenario: Purchase - Payment Settings
   * I check that payment settings dashboard is visible
   * I check the payment settings modal
   * I incorrectly update my paypal account information and see a error message
   * I update my payment information to receive via Amazon gift card
   * I update my payment information to receive via Paypal
