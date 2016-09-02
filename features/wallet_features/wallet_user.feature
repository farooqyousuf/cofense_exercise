@regression @wallet @desktop
Feature: Test Wallet User Features

@wallet_signup
Scenario: Successful User Wallet Sign up
	* I visit "WalletHomepage" 
	* I click on the Wallet Sign Up link 
	* I sign up as a new user 
	* I should be on the marketplace landing page
	* I click on the Wallet shared nav link
	* I should be on the Wallet dashboard page 
	* I should see my sign up on the activity feed

@wallet_signin
Scenario: Succesful User Wallet Sign In
  * I visit "WalletHomepage" 
	* I click on the Wallet Sign in link 
	* I login to wallet as a "Military" user 
	* I should be on the marketplace landing page
	* I click on the Wallet shared nav link
	* I should be on the Wallet dashboard page 
	* I should see my sign in on the activity feed

@wallet_signin_failure
Scenario: Failed User Wallet Sign In
	* I visit "WalletHomepage"
	* I click on the Wallet Sign in link 
	* I fail a attempt to login to wallet 
	* I should see a IDP failed attempt sign in error 
	* I login to wallet as a "Military" user 
	* I should be on the Wallet dashboard page
	* I should see my failed sign in on the activity feed 
