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

  Scenario: Filter offers by group affiliation
    * I filter offers for the "Military" group
    * I verify that the group offer cards are "Troop" specific offers
    * I remove filter for the "Military" group
    * I filter offers for the "First Responders" group
    * I verify that the group offer cards are "Responder" specific offers
    * I remove filter for the "First Responders" group
    * I filter offers for the "Students" group
    * I verify that the group offer cards are "Student" specific offers
    * I remove filter for the "Students" group
    * I filter offers for the "Teachers" group
    * I verify that the group offer cards are "Teacher" specific offers
    * I remove filter for the "Teachers" group
    * I filter offers for the "Government Employees" group
    * I verify that the group offer cards are "Government" specific offers

  Scenario: See offers for Military users
    * I click to see group "Troop ID" offers
    * I expect the url to be for the shop "military" group offers page
    * I verify that the group offer cards are "Troop" specific offers

  Scenario: See offers for Student users
    * I click to see group "Student ID" offers
    * I expect the url to be for the shop "student" group offers page
    * I verify that the group offer cards are "Student" specific offers

  Scenario: See offers for First Responders users
    * I click to see group "Responder ID" offers
    * I expect the url to be for the shop "first-responder" group offers page
    * I verify that the group offer cards are "Responder" specific offers

  Scenario: See offers for Teacher users
    * I click to see group "Teacher ID" offers
    * I expect the url to be for the shop "teacher" group offers page
    * I verify that the group offer cards are "Teacher" specific offers

  Scenario: See offers for Government Employee users
    * I click to see group "Government ID" offers
    * I expect the url to be for the shop "government" group offers page
    * I verify that the group offer cards are "Government" specific offers

  Scenario: See offers for all users
    * I click to see group "Everyone" offers
    * I expect the page url to be for the shop offers page
    * I verify that the offers are shown on the offers page
