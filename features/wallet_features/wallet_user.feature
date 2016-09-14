@regression @wallet @desktop
Feature: Test Wallet User Features

Background:
  * I create "WalletHomepage,WalletDashboard,WalletSettings" page objects

@wallet_signup
Scenario: Successful User Wallet Sign up
  * I visit "WalletHomepage" 
  * I click on the Wallet Sign Up link 
  * I sign up as a new user 
  * I should be on the Wallet dashboard page
  * I record the wallet user email 
  * I click on the Wallet shared nav link
  * I should be on the Wallet dashboard page 
  * I should see my sign up on the activity feed

@wallet_signin
Scenario: Succesful User Wallet Sign In
  * I visit "WalletHomepage" 
  * I click on the Wallet Sign in link 
  * I login to wallet as a "Military" user 
  * I should be on the Wallet dashboard page
  * I record the wallet user email 
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

@wallet_military_verify
Scenario: User verifies a Military Group Affiliation 
  * I visit "WalletHomepage" 
  * I click on the Wallet Sign Up link 
  * I sign up as a new user 
  * I should be on the Wallet dashboard page
  * I record the wallet user email 
  * I click to verify a military group affiliation
  * I verify using military documentation for "Veteran"
  * I approve the document in IDme admin
  * I complete the verification process
  * I verify my military group affiliation has been added 
  * I should see my military group addition on the activity feed  

@wallet_account_revoke 
Scenario: User deactivates Wallet account and revokes access 
  * I visit "WalletHomepage" 
  * I click on the Wallet Sign Up link 
  * I sign up as a new user 
  * I should be on the Wallet dashboard page
  * I record the wallet user email 
  * I deactivate my Wallet account
  * I confirm that my Wallet session has been terminated
  * I verify my Wallet account has been deactived 
