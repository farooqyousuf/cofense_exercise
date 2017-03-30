<<<<<<< HEAD:features/marketplace_users_features/mp_favorites.feature
@regression @marketplace @mp_favorites @desktop
Feature: Test Marketplace Users Favorite Stores & Offers Features
=======
@regression @shop @shop_favorites @desktop
Feature: Test Shop Users Favorite Stores & Offers Features
>>>>>>> b0d83ffdccc2013101f4de3a831dae5cedf792f5:features/shop/shop_users_features/shop_favorites.feature

  Background:
    * I visit "ShopLandingPage"
    * I click on SignIn link
    * I login to Shop as a "Military" user
    * I create a Shop Favorites page object

<<<<<<< HEAD:features/marketplace_users_features/mp_favorites.feature
  Scenario: Check Marketplace Favorites page and tabs
=======
  Scenario: Check Shop Favorites page and tabs
    * I visit Favorites from side menu navigation page
    * I expect to be at the Favorites page
>>>>>>> b0d83ffdccc2013101f4de3a831dae5cedf792f5:features/shop/shop_users_features/shop_favorites.feature
    * I visit Favorites from user menu navigation page
    * I expect to be at the Favorites page
    * I visit Favorites from side menu navigation page
    * I expect to be at the Favorites page
    * I expect to see the Favorite Offers tab
    * I expect to see the Favorite Stores tab

  Scenario: User adds a favorite offer
    * I visit "MarketplaceOffersPage"
    * I add a offer to Saved Offers
    * I confirm that offer has been saved

  Scenario: User removes a favorite offer
    * I visit "MarketplaceOffersPage"
    * I remove a offer from Saved Offers
    * I confirm that the offer has been removed from Saved Offers

  Scenario: User adds a favorite store
    * I visit "MarketplaceStoreIndexPage"
    * I add a favorite store
    * I confirm that the store has been saved

  Scenario: User removes a favorite store
    * I remove a favorite store from the favorite stores page
    * I confirm that the store has been unfavorited from the store page
