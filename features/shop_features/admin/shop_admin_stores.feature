
@regression @shop @desktop @shop_admin_stores

Feature: Test Shop Admin Stores page

  Background:
    * I create "ShopAdminDashboard, ShopAdminStores, ShopAdminCategories" page objects
    * I visit "ShopAdminDashboard"
    * I login with Authority
    * I visit "ShopAdminStores"

  Scenario: I create a new Store
    * I navigate to the create a new store page
    * I submit a valid new store
    * I verify the store has been created

  @delete_shop_category
  Scenario: I add a category to a Store
    * I navigate to the create a new category page
    * I sumbit a valid new category
    * I verify the category has been created
    * I visit "ShopAdminStores"
    * I click to edit a store from the shop admin stores index
    * I add a new category to the store
    * I verify the store has been updated
    * I verify the category has been added to the store