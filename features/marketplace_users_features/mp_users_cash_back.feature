@regression @marketplace @marketplace_cash_back @desktop
Feature: Test the MP_users Cash Back - My Cash

  Background:
   * I visit "MarketplaceLandingPage"
   * I click on the Marketplace Sign Up link
   * I sign up as a new user
   * I visit "CashBack_PurchasesPage"
   * I save the new user email 

   Scenario: Purchases - Summary Info Card Check
   * Cash Back Activity Tab should be selected
   * I check Summary Info Card existence
   * I check Summary Info Card content

   Scenario: Purchases - Next Payment Info Card Check
   * Cash Back Activity Tab should be selected
   * I check Next Payment Info Card existence
   * I check Next Payment Info Card content

   Scenario: Purchases - Purchases Table Check
   * Cash Back Activity Tab should be selected
   * I check Purchases Table existence
   * I check Purchases Table content

   Scenario: Purchase - Verify Cash back from Purchase 
   * I find the user uid in offerCMS
   * I create a marketplace purchase with cash back for the user
   * I visit "CashBack_PurchasesPage"
   * I check that the cash back is displayed on the Summary Info Card
   * I check that the cash back is displayed on the Purchases Table 

   Scenario: Purchase - Review Cash Back purchase 
   * I check that the Cash Back purchase can be reviewed
   * I create a review for the Cash Back purchase
   * I check that the review is displayed on the merchant page 

   Scenario: Payment Settings
   * I check that payment settings is visible 
   * I check the update payment modal 
   * I update my payment information to receive via Amazon gift card
   * I update my payment information to receive via Paypal
   * I incorrectly update my paypal account information 