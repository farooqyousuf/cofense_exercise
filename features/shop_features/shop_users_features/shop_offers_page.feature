@regression @shop @desktop @shop_offers

Feature: Test Shop Offers Page

 Background:
    * I visit "ShopLandingPage"
    * I create a Shop Offers index page object
    * I visit "ShopOffersPage"

 Scenario: Check Offers Index Table - Logged Out User
    * I expect the page url to be for Shop Offers Page
    * I check that the Offers Index is available
    * I check that store offer index card is visible
    * I check the store offer card links for "Logged Out" User

 Scenario: Check Offers Index Table - Logged in
    * I click on SignIn link
    * I login to Shop as a "Military" user
    * I expect the page url to be for Shop Offers Page
    * I check that the Offers Index is available
    * I check the store offer card links for "Logged In" User

 @smoke
 Scenario: Check Offers Side Bar - Promo Codes
    * I click on SignIn link
    * I login to Shop as a "Military" user
    * I click to see all promo code offers
    * I check that the table index are promo code offers

 Scenario: Check Offers Side Bar - Categories
    * I click to see all Offer Categories
    * I check the "Accessories" categories link
    * I check the "Amazon" categories link
    * I check the "Apparel" categories link
    * I check the "Appliances" categories link
    * I check the "Auctions" categories link
    * I check the "Automotive" categories link
    * I check the "B2b" categories link
    * I check the "Batteries" categories link
    * I check the "Books" categories link
    * I check the "Business" categories link
    * I check the "Christmas" categories link

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
