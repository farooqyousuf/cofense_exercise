@regression @shop @desktop @shop_admin_offers
Feature: Shop Admin Offers page

  Background:
    * I create "ShopAdminOffers,ShopAdminDashboard" page objects
    * I visit "ShopAdminDashboard"
    * I login with Authority
    * I visit "ShopAdminOffers"

  Scenario: Create a new Offer
    * I navigate to the create a new offer page

  Scenario: Filter for all active offers
    * I select to filter for only active offers
    * I verify that all displayed offers are active

  Scenario: Filter for all inactive offers
    * I select to filter for only inactive offers
    * I verify that all displayed offers are inactive
