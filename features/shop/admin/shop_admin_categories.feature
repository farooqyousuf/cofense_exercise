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
    * I navigate to the create a new category page
    * I attempt to submit a invalid new category
    * I verify a error is returned and no new category is created

  Scenario: Update a Category

  Scenario: Delete a Category

  Scenario: Categories index page is visible
