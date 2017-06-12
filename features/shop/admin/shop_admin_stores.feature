@regression @shop @desktop @shop_stores

Feature: Test Shop Admin Stores page

  Background:
    * I create "ShopAdminDashboard,ShopAdminStores,ShopAdminCategories" page objects
    * I visit "ShopAdminDashboard"
    * I login with Authority
    * I visit "ShopAdminStores"

  Scenario: I create a new Store
    * I navigate to the create a new store page
    * I submit a valid new store
    * I verify the store has been created
