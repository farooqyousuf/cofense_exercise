@regression @mobile_shop @smoke
Feature: Test Shop via mobile

  Background:
    * I create "ShopOffersPage, ShopLandingPage, ShopCashBackPage, ShopStoreIndexPage, ShopAdminDashboard, ShopAdminStores, CashBack_PurchasesPage" page objects
    * I open a new window

  @wip
  ## AWE-1530
  Scenario: Review offers main page as a signed out user
    * I visit "ShopOffersPage"
    * I verify that the offers are shown on the offers page
    * I verify the card button texts for the "offer" page
    * I click on the stores link
    * I verify that the stores are shown on the stores page
    * I verify the card button texts for the "store" page

  @wip
  ## AWE-1530
  Scenario: Review offers main page as a signed in user
    * I visit "ShopOffersPage"
    * I click on the Shop "Sign In" navigation link
    * I login to Shop as a "Military" user
    * I expect the page url to be for the shop offers page
    * I verify that the offers are shown on the offers page
    * I click on the stores link
    * I verify that the stores are shown on the stores page

  Scenario: Check Stores Table listing
    * I visit "ShopStoresPage"
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
