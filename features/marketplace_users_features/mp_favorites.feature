@regression @marketplace @mp_favorites @desktop 
Feature: Test Marketplace Users Favorite Stores & Offers Features 

  Background:
    * I visit "MarketplaceLandingPage"
    * I click on SignIn link
    * I login to marketplace as a "Military" user
    * I create a Marketplace Favorites page object

  Scenario: Check Marketplace Favorites page and tabs
    * I visit Favorites from side menu navigation page
    * I expect to be at the Favorites page
    * I visit Favorites from user menu navigation page
    * I expect to be at the Favorites page
    * I expect to see the Favorite Offers tab
    * I expect to see the Favorite Stores tab

  Scenario: User adds a favorite offer
    * I add a offer to Saved Offers
    * I confirm that offer has been saved

  Scenario: User removes a favorite offer
    * I remove a offer from Saved Offers
    * I confirm that the offer has been removed from Saved Offers
  
  Scenario: User adds a favorite store
    * I add a favorite store
    * I confirm that the store has been saved 

  Scenario: User removes a favorite store 
    * I remove a favorite store from the favorite stores page
    * I confirm that the store has been unfavorited from the store page 
