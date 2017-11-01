@regression @shop @shop_cash_back @desktop
Feature: Test the shop_users Cash Back - My Cash

  Background:
   * I create "ShopLandingPage, ShopGroupAffiliationsPage, CashBack_PurchasesPage" page objects
   * I visit "ShopLandingPage"
   * I click on the Shop Sign Up link
   * I sign up as a new user
   * I click on link to view My Cash
   * I verify the new user email

   @smoke
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
   * I update my payment information to receive via Paypal
   * I incorrectly update my paypal account information and see a error message
