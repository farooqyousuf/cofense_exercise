@regression @mobile_shop @smoke
Feature: Test Shop via mobile

  Background:
    * I create "ShopOffersPage, ShopLandingPage, ShopStoresPage, ShopAdminDashboard, ShopAdminStores, ShopCashBackPage" page objects
    * I open a new window

  @delete_current_user_email
  Scenario: Review the "My Cash" cash back purchases page
    * I visit "ShopLandingPage"
    * I click on the Shop mobile "Sign Up" navigation link
    * I sign up as a new user
    * I click on the Shop mobile "My Cash" navigation link
    * I verify the new user email
    * I verify that the "Cash Back Activity" tab is selected
    * I confirm the cash back summary section is shown
    * I confirm the next payment section is shown
    * I confirm the purchases table is shown
    * I verify the purchases table content for purchases made

  Scenario: Review offers main page as a signed out user
    * I visit "ShopOffersPage"
    * I verify that the offers are shown on the offers page
    * I verify the card button texts for the "offer" page
    * I click on the stores link
    * I verify that the stores are shown on the stores page
    * I verify the card button texts for the "store" page

  Scenario: Review offers main page as a signed in user
    * I visit "ShopOffersPage"
    * I click on the Shop mobile "Sign In" navigation link
    * I login to Shop as a "Military" user
    * I expect the page url to be for the shop offers page
    * I verify that the offers are shown on the offers page
    * I click on the stores link
    * I verify that the stores are shown on the stores page

  Scenario: Review stores main page as a signed out user
    * I visit "ShopStoresPage"
    * I verify that the stores are shown on the stores page
    * I verify the card button texts for the "store" page
    * I click on the offers link
    * I verify that the offers are shown on the offers page
    * I verify the card button texts for the "offer" page

  Scenario: Review stores main page as a signed in user
    * I visit "ShopStoresPage"
    * I click on the Shop mobile "Sign In" navigation link
    * I login to Shop as a "Military" user
    * I expect the page url to be for the shop stores page
    * I verify that the stores are shown on the stores page
    * I click on the offers link
    * I verify that the offers are shown on the offers page
