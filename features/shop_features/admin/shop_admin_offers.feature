@regression @shop @desktop @shop_admin_offers
Feature: Shop Admin Offers page

  Background:
    * I create "ShopAdminOffers, ShopAdminDashboard, ShopAdminCategories" page objects
    * I visit "ShopAdminDashboard"
    * I login with Authority
    * I visit "ShopAdminOffers"

  @delete_shop_offer
  Scenario: Create a new Offer
    * I navigate to the create a new offer page
    * I submit a valid new offer
    * I verify the offer has been created

  Scenario: Filter for all active offers
    * I select to filter for only active offers
    * I verify that all displayed offers are active

  Scenario: Filter for all inactive offers
    * I select to filter for only inactive offers
    * I verify that all displayed offers are inactive

  @delete_shop_category @delete_shop_offer
  Scenario: Add a category to a Offer
    * I navigate to the create a new category page
    * I sumbit a valid new category
    * I verify the category has been created
    * I visit "ShopAdminOffers"
    * I navigate to the create a new offer page
    * I submit a valid new offer
    * I verify the offer has been created
    * I add the new category to the offer
    * I verify the category has been added to the offer
