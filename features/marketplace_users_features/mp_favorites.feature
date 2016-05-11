@regression @marketplace @mp_favorites
Feature: Test Marketplace Users Favorites settings 

  Background:
    * I visit "MarketplaceLandingPage"
    * I click on SignIn link
    * I login to marketplace as a "vip" user
    * I create a Marketplace Favorites page object

  Scenario: Check Marketplace Favorites
    * I visit Favorites from side menu navigation page
    * I expect to be at the Favorites page
    * I visit Favorites from user menu navigation page
    * I expect to be at the Favorites page
    * I expect to see the Favorite Offers tab
    * I expect to see the Favorite Stores tab

  Scenario: I add a favorite offer
    * I add a offer to Saved Offers
    * I confirm that offer has been saved

  Scenario: I remove a favorite offer
    * I remove a offer from Saved Offers
    * I confirm that the offer has been removed from Saved Offers
  @new_diff
  Scenario: I add a favorite store
    * I add a favorite store
    * I confirm that the store has been saved 

  @new_diff
  Scenario: I remove a favorite store 
    * I remove a favorite store from the favorite stores page
    * I confirm that the store has been unfavorited from the store page 
