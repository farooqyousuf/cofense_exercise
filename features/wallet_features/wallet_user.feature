@regression @wallet @desktop
Feature: Test Wallet User Features

@wallet_signup
Scenario: Successful User Wallet Sign up
	* I visit the Wallet homepage 
	* I click on the Wallet Sign Up link 
	* I sign up as a new user 
	* I should be on the marketplace landing page
	* I click on the Wallet shared nav link
	* I should be on the Wallet dashboard page 