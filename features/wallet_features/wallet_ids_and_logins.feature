@regression @wallet @desktop
Feature: Test Wallet IDs and Logins Features

  Background:
    * I create "WalletHomepage, WalletDashboard, WalletSettings" page objects

@delete_current_user_email @ignore @wip
  Scenario: User verifies a Military Group Affiliation
    * I visit "WalletHomepage"
    * I click on the Wallet Sign Up Link
    * I sign up as a new user
    * I click to verify a military group affiliation
    * I verify a military user
    * I verify my military group affiliation has been added
    * I should see my military group addition on the activity feed
