@regression @wallet @desktop
Feature: Test Wallet Dashboard Page Feature

Background:
  * I create "WalletHomepage,WalletDashboard,WalletMyids" page objects
  * I visit "WalletHomepage"

@smoke
Scenario: Dashboard Smoke Test
  * I click on the Wallet Sign Up link
  * I sign up as a new user
  * I should be on the Wallet dashboard page
  * I check the Wallet dashboard page is visible
  * I click on the shared side navigation
  * I click sign out on the shared side navigation
