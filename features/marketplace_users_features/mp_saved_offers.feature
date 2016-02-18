@regression @marketplace @mp_saved_offers
Feature: Test the MP_users Account & Profile settings

  Background:
    * I visit "MarketplaceLandingPage"
    * I click on SignIn link
    * I login to marketplace as a "vip" user
    * I create a Marketplace saved offers page object


  Scenario: Check Marketplace Saved Offers
    * I visit saved offers from side menu navigation page
    * I expect to be at the saved offers page
    * I visit saved offers from user menu navigation page
    * I expect to be at the saved offers page

  Scenario: I add a saved offer
    * I add a offer to Saved Offers
    * I confirm that offer has been saved

  Scenario: I remove a saved offer
    * I remove a offer from Saved Offers
    * I confirm that the offer has been removed from Saved Offers
