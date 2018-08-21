@regression @mobile_shop @smoke
Feature: Test Shop via mobile

  Background:
    * I create "ShopOffersPage, ShopLandingPage, ShopCashBackPage, ShopStoreIndexPage, ShopAdminDashboard, ShopAdminStores, CashBack_PurchasesPage" page objects
    * I open a new window

  @ignore
  ## No longer needed
  Scenario: Check Offers Side Bar - Promo Codes
    * I visit "ShopLandingPage"
    * I visit "ShopOffersPage"
    * I click on the mobile Shop Sign In link
    * I login to Shop as a "Military" user
    * I click to see all promo code offers
    * I check that the table index are promo code offers

  Scenario: Check Stores Table listing
    * I visit "ShopStoreIndexPage"
    * I expect to be at the Shop Stores Index Page
    * I check that the filter is visible
    * I check that the Stores index is visible
    * I verify the stores merchant card

  @delete_current_user_email
   Scenario: Purchases - Summary Info Card Check
    * I visit "ShopLandingPage"
    * I click on the mobile Shop Sign Up link
    * I sign up as a new user
    * I click on link to view My Cash
    * I verify the new user email
    * Cash Back Activity Tab should be selected
    * I check Summary Info Card existence
