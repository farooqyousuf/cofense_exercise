@regression @shop @desktop @shop_offers
Feature: Shop offers page user experience

  Background:
    * I create "ShopOffersPage, ShopLandingPage, ShopCashBackPage" page objects
    * I visit "ShopOffersPage"

  @smoke
  Scenario: Review offers main page as a signed out user
    * I verify that the offers are shown on the offers page
    * I click on the stores link
    * I verify that the stores are shown on the offers page

  @smoke
  Scenario: Review offers main page as a signed in user
    * I click on the Shop "Sign In" navigation link
    * I login to Shop as a "Military" user
    * I expect the page url to be for the shop offers page
    * I verify that the offers are shown on the offers page
    * I click on the stores link
    * I verify that the stores are shown on the offers page

  Scenario: Filter to offers by group affiliation
    * I filter offers for the "Military" group
    * I verify that "Troop" specific offers are shown
    * I remove filter for the "Military" group
    * I filter offers for the "First Responders" group
    * I verify that "Responder" specific offers are shown
    * I remove filter for the "First Responders" group
    * I filter offers for the "Students" group
    * I verify that "Student" specific offers are shown
    * I remove filter for the "Students" group
    * I filter offers for the "Teachers" group
    * I verify that "Teacher" specific offers are shown
    * I remove filter for the "Teachers" group
    * I filter offers for the "Government Employees" group
    * I verify that "Government" specific offers are shown

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
