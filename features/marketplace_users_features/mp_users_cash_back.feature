@regression @marketplace @marketplace_cash_back @desktop
Feature: Test the MP_users Cash Back - My Cash

  Background:
   * I visit "MarketplaceLandingPage"
   * I click on SignIn link
   * I login to marketplace as a "Military" user

   Scenario: Purchases - Summary Info Card Check
   * I visit "CashBack_PurchasesPage"
   * Cash Back Activity Tab should be selected
   * I check Summary Info Card existence
   * I check Summary Info Card content

   Scenario: Purchases - Next Payment Info Card Check
   * I visit "CashBack_PurchasesPage"
   * Cash Back Activity Tab should be selected
   * I check Next Payment Info Card existence
   * I check Next Payment Info Card content

   Scenario: Purchases - Purchases Table Check
   * I visit "CashBack_PurchasesPage"
   * Cash Back Activity Tab should be selected
   * I check Purchases Table existence
   * I check Purchases Table content

   @mcboatface
   Scenario: offer-cms test
   * I have to kill mcbane