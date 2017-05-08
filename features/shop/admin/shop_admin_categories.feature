@regression @shop @desktop @shop_categories
Feature: Shop Admin Categories page

  Background:
    * I create "ShopAdminCategories,ShopAdminDashboard" page objects
    * I visit "ShopAdminDashboard"
    * I login with Authority
    * I visit "ShopAdminCategories"

  Scenario: Create a new Category
    * I navigate to the create a new category page
    * I sumbit a valid new category
    * I verify the category has been created

  Scenario: Create new Category with invalid name

  Scenario: Update a Category
    * I navigate to the create a new category page
    * I sumbit a valid new category
    * I update the new category
    * I verify the category has been updated

  Scenario: Delete a Category

  Scenario: Categories index page is visible
