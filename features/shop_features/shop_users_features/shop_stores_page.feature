@regression @shop @shop_stores @desktop
Feature: Test Stores Index page

  Background:
    * I create "ShopStoresPage, ShopOffersPage, ShopAdminDashboard, ShopAdminStores, ShopLandingPage, ShopCashBackPage" page objects
    * I visit "ShopStoresPage"

  @smoke
  Scenario: Review stores main page as a signed out user
    * I verify that the stores are shown on the stores page
    * I verify the card button texts for the "store" page
    * I click on the offers link
    * I verify that the offers are shown on the offers page
    * I verify the card button texts for the "offer" page

  @smoke
  Scenario: Review stores main page as a signed in user
    * I click on the Shop "Sign In" navigation link
    * I login to Shop as a "Military" user
    * I expect the page url to be for the shop stores page
    * I verify that the stores are shown on the stores page
    * I click on the offers link
    * I verify that the offers are shown on the offers page

  Scenario: Filter stores by categories
    * I verify sorting stores by newest
    * I filter stores for the "Education" category
    * I verify that the stores for the "Education" category are shown
    * I remove filter for the "Education" category
    * I filter stores for the "Holiday" category
    * I verify that the stores for the "Holiday" category are shown
    * I remove filter for the "Holiday" category
    * I filter stores for the "Automotive" category
    * I verify that the stores for the "Automotive" category are shown
