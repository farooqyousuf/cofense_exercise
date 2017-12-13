@regression @wallet @desktop
Feature: Test Wallet User Features

Background:
  * I create "WalletHomepage, WalletDashboard, WalletSettings" page objects

@delete_current_user_email @smoke
Scenario: Successful User Wallet Sign up
  * I visit "WalletHomepage"
  * I click on the Wallet Sign Up link
  * I sign up as a new user
  * I record the wallet user email
  * I click on the Wallet shared nav link
  * I should see my sign up on the activity feed

@smoke @lightning
Scenario: Succesful User Wallet Sign In
  * I visit "WalletHomepage"
  * I click on the Wallet Sign in link
  * I login to wallet as a "Military" user
  * I record the wallet user email
  * I click on the Wallet shared nav link
  * I should see my sign in on the activity feed

Scenario: Failed User Wallet Sign In
  * I visit "WalletHomepage"
  * I click on the Wallet Sign in link
  * I fail a attempt to login to wallet
  * I should see a IDP failed attempt sign in error
  * I login to wallet as a "Military" user
  * I should see my failed sign in on the activity feed

@delete_current_user_email
Scenario: User verifies a Military Group Affiliation
  * I visit "WalletHomepage"
  * I click on the Wallet Sign Up link
  * I sign up as a new user
  * I record the wallet user email
  * I create a Military Document page object
  * I click to verify a military group affiliation
  * I click on the Military Verify by uploading documentation link
  * I click on the Begin link
  * I verify using military documentation for "Veteran"
  * I approve the document in the IDme support tool
  * I verify my military group affiliation has been added
  * I should see my military group addition on the activity feed

@delete_current_user_email
Scenario: User deactivates Wallet account and revokes access
  * I visit "WalletHomepage"
  * I click on the Wallet Sign Up link
  * I sign up as a new user
  * I record the wallet user email
  * I deactivate my Wallet account
  * I confirm that my Wallet session has been terminated
  * I verify my Wallet account has been deactived

@delete_current_user_email
Scenario: User Wallet account locked and unlocked via code
  * I visit "WalletHomepage"
  * I click on the Wallet Sign Up link
  * I sign up as a new user
  * I log out of Wallet user account
  * I click on the Wallet Sign in link
  * I lockout my account
  * I click on the unlock account link
  * I unlock my account
  * I login as a "current_username" user
  * I verify my Wallet lock and unlock on the Wallet activity feed

@delete_linkedin_user
Scenario: User Signs up in Wallet via Social Federation
  * I visit "WalletHomepage"
  * I click on the Wallet Sign Up link
  * I signup with LinkedIn social federation
  * I verify my Wallet LinkedIn Social Federation login

@delete_linkedin_user
Scenario: User Signs in Wallet via Social Federation
  * I visit "WalletHomepage"
  * I click on the Wallet Sign Up link
  * I signup with LinkedIn social federation
  * I log out of Wallet user account
  * I visit "WalletHomepage"
  * I click on the Wallet Sign in link
  * I signin with LinkedIn social federation
  * I verify my Wallet Linkedin Social Federation signin
