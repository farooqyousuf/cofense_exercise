@smoke @idp_production
Feature: User account creation

  Background:
  * I create "IDPSignIn, WalletHomepage" page objects

  Scenario: Successfully sign into vets.gov
  * I visit the "vets.gov" production page
  * I click on "Sign In"
  * I click on "Sign in with ID.me" for vets.gov
  * I login as a "Unverified" user in production
  * I should be successfully signed into vets.gov production

  Scenario: Successfully sign into wallet
  * I visit the "wallet" production page
  * I click on the Wallet Sign In Link
  * I login as a "Unverified" user in production
  * I should be successfully signed into wallet production

  Scenario: Sign Up as a new user for vets.gov
  * I visit the "vets.gov" production page
  * I click on "Sign Up"
  * I click on "Create an ID.me account" for vets.gov
  * I sign up as a new user
  * I should be successfully signed into vets.gov production

  Scenario: Sign Up as a new user for wallet
  * I visit the "wallet" production page
  * I click on the Wallet Sign Up Link
  * I sign up as a new user
  * I should be successfully signed into wallet production
