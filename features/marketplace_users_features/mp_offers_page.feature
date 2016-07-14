@regression @marketplace  @desktop @mp_offers

Feature: Test Marketplace Offers Page 
	Background:
		* I visit "MarketplaceLandingPage"
		* I create a Marketplace Offers index page object
		* I visit "MarketplaceOffersPage"

	Scenario: Check Offers Index Table - Logged Out User
		* I expect the page url to be for Marketplace Offers Page
		* I check that the Offers Index is available
		* I check that store offer index card is visible
		* I check the store offer card links for "Logged Out" User
		* I check that the store offer card favorite and report bug is not visible 
	
	Scenario: Check Offers Index Table - Logged in 
		* I click on SignIn link
    * I login to marketplace as a "Military" user
    * I expect the page url to be for Marketplace Offers Page
		* I check that the Offers Index is available 
		* I check the store offer card links for "Logged In" User
		* I check that the store offer card favorite and report bug is visible 

	Scenario: Check Offers Side Bar - Promo Codes
		* I click on SignIn link
		* I login to marketplace as a "Military" user
		* I click to see all promo code offers
		* I check that the table index are promo code offers

