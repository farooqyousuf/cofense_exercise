@regression @shop @desktop @shop_admin_offers
Feature: Shop Admin Offers page

  Background:
    * I create "ShopAdminOffers,ShopAdminDashboard,ShopAdminCategories" page objects
    * I visit "ShopAdminDashboard"
    * I login with Authority
    * I visit "ShopAdminOffers"

  Scenario: Create a new Offer
    * I navigate to the create a new offer page
    * I submit a valid new offer
    * I verify the offer has been created
    * I delete the offer
    * I verify the offer has been deleted

  Scenario: Filter for all active offers
    * I select to filter for only active offers
    * I verify that all displayed offers are active

  Scenario: Filter for all inactive offers
    * I select to filter for only inactive offers
    * I verify that all displayed offers are inactive

  Scenario: Add a category to a Offer
    * I navigate to the create a new category page
    * I sumbit a valid new category
    * I visit "ShopAdminOffers"
    * I navigate to the create a new offer page
    * I submit a valid new offer
    * I add the new category to the offer
    * I verify the offer has been updated
    * I verify the category has been added to the offer
    * I delete the offer
    * I delete the offer category