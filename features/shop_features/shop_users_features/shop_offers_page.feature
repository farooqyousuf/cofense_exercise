@regression @shop @desktop @shop_offers
Feature: Test Shop Offers Page

  Background:
    * I create "ShopOffersPage, ShopLandingPage, ShopCashBackPage" page objects
    * I visit "ShopLandingPage"
    * I visit "ShopOffersPage"

  Scenario: Check Offers Index Table - Logged Out User
    * I expect the page url to be for Shop Offers Page
    * I check that the Offers Index is available
    * I check that store offer index card is visible
    * I check the store offer card links for "Logged Out" User

  Scenario: Check Offers Index Table - Logged in
    * I click on the Shop "Sign In" navigation link
    * I login to Shop as a "Military" user
    * I expect the page url to be for Shop Offers Page
    * I check that the Offers Index is available
    * I check the store offer card links for "Logged In" User

  @smoke
  Scenario: Check Offers Side Bar - Promo Codes
    * I click on the Shop "Sign In" navigation link
    * I login to Shop as a "Military" user
    * I click to see all promo code offers
    * I check that the table index are promo code offers

  Scenario: Check Offers Side Bar - Categories
    * I click to see all Offer Categories
    * I check the "Automotive" categories link
    * I check the "Holiday" categories link
    * I check the "Pets" categories link

  Scenario: Check Offer Groups - Military Specific Offers
    * I click to see Group "Military" offers
    * I check that the table index shows all "Troop" specific offers

  Scenario: Check Offer Groups - First Responder Specific Offers
    * I click to see Group "First Responders" offers
    * I check that the table index shows all "Responder" specific offers

  Scenario: Check Offer Groups - Students Specific Offers
    * I click to see Group "Students" offers
    * I check that the table index shows all "Student" specific offers

  Scenario: Check Offer Groups - Government Employees Offers
    * I click to see Group "Government Employees" offers
    * I check that the table index shows all "Government" specific offers

  Scenario: Check Offer Groups - Teacher Offers
    * I click to see Group "Teachers" offers
    * I check that the table index shows all "Teacher" specific offers
