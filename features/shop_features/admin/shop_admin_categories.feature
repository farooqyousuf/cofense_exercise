@regression @shop @desktop @shop_categories
Feature: Shop Admin Categories page

  Background:
    * I create "ShopAdminCategories, ShopAdminDashboard" page objects
    * I visit "ShopAdminDashboard"
    * I login with Authority
    * I visit "ShopAdminCategories"

  @delete_shop_category
  Scenario: Create a new Category
    * I navigate to the create a new category page
    * I sumbit a valid new category
    * I verify the category has been created

  Scenario: Create new Category with blank label
    * I navigate to the create a new category page
    * I submit a new category with blank label
    * I verify a error is returned and no new category is created

  @delete_shop_category
  Scenario: Create a new Category with duplicate name
    * I navigate to the create a new category page
    * I sumbit a valid new category
    * I verify the category has been created
    * I attempt to submit a duplicate category
    * I verify a error is returned and no duplicate category is created

  @delete_shop_category
  Scenario: Update a Category
    * I navigate to the create a new category page
    * I sumbit a valid new category
    * I verify the category has been created
    * I update the new category
    * I verify the category has been updated