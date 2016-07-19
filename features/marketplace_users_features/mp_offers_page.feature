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

	Scenario: Check Offers Side Bar - Coupons
		* I click to see all Coupon offers
		* I check that the table index are coupon offers 

	Scenario: Check Offers Side Bar - Categories 
		* I click to see all Offer Categories
		* I check the "Accessories" categories link 
		* I check the "Amazon" categories link 
		* I check the "Books" categories link 
		* I check the "Business" categories link 
		* I check the "Clothing" categories link 
		* I check the "Electronics" categories link 
		* I check the "Entertainment" categories link 
		* I check the "Food-cooking" categories link 
		* I check the "Gifts" categories link 
		* I check the "Health-beauty" categories link 
		* I check the "Hobby-collectibles" categories link 
		* I check the "Holiday" categories link 
		* I check the "House-home" categories link 
		* I check the "Kids" categories link 
		* I check the "Local" categories link 
		* I check the "Services" categories link 
		* I check the "Shopping" categories link 
		* I check the "Sports" categories link 
		* I check the "Travel" categories link 

	Scenario: Check Offer Groups - Military Specific Offers
		* I click to see Group Military offers
		* I check that the table index shows all military specific offers

	Scenario: Check Offer Groups - First Responder Specific Offers
		* I click to see Group First Responder offers
		* I check that the table index shows all first responder specific offers

	Scenario: Check Offer Groups - Students Specific Offers
		* I click to see Group Student offers
		* I check that the table index shows all student specific offers

	Scenario: Check Offer Groups - Government Employees Offers
		* I click to see Group Government Employees offers
		* I check that the table index shows all government employee specific offers

	Scenario: Check Offer Groups - Teacher Offers
		* I click to see Group Teacher offers
		* I check that the table index shows all teacher specific offers 