@regression @marketplace @mp_offers @desktop

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
		

