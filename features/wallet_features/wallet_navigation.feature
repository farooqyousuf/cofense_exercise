@regression @wallet @desktop
Feature: Test Wallet Navigation Features

Background:
  * I create "WalletHomepage,WalletNavigation" page objects
  * I visit "WalletHomepage"

@smoke @test_smoke
Scenario: Wallet Navigation Smoke Test
  * I click on the Wallet Sign Up link
  * I sign up as a new user
  * I should be on the Wallet dashboard page
  * I click on the Dashboard navigation link
  * I check the Wallet dashboard page is visible
  * I click on the My IDs navigation link
  * I check the Wallet My IDs page is visible
  * I click on the Settings navigation link
  * I check the Wallet Settings page is visible
  * I click on the Activity navigation link
  * I check that Wallet Activity page is visible
