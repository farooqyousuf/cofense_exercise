@regression @shop @shop_stores @desktop
Feature: Test Stores Index page

  Background:
    * I create "ShopStoreIndexPage, ShopAdminDashboard, ShopAdminStores" page objects
    * I visit "ShopStoreIndexPage"

  @smoke
  Scenario: Check Stores Table listing
    * I expect to be at the Shop Stores Index Page
    * I check that the filter is visible
    * I check that the Stores index is visible
    * I verify the stores merchant card

  Scenario: Check Store filter feature
    * I check to sort stores by name
    * I check to sort stores by newest
    * I check to sort stores by highest cash back %
    * I check to sort stores by highest cash back $
