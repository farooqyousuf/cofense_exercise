@regression @wallet @desktop
Feature: Test Wallet Dashboard Page Feature

Background:
  * I create "WalletHomepage,WalletDashboard,WalletMyids" page objects
  * I visit "WalletHomepage"

@smoke
Scenario: Verify Wallet Shared Main Nav
  * I verify ID.me logo is present
  * I verify that all the main nav tab links are directing to correct pages
  * I click on the Wallet Sign Up link
  * I sign up as a new user

Scenario: Verify Wallet Sub-Nav bar
  * I verify that all the sub-nav tab links are directing to correct pages

Scenario: Verify Wallet Shared Side Nav
  * I click on the shared side navigation
  * I verify user email is displayed
  * I verify membership date is displayed correctly
  * I verify that "View Profile" link directs me to correct page
  * I click sign out on the shared side navigation

Scenario: Verify Dashboard Components
  * I log into Wallet
  * I should be on the Wallet dashboard page #url
  * I verify that Ids and Logins toggle buttons direct me to corresponding page views #IDs or Logins
  * I verify required main header sections are available #IDs and Logins, Activity Feed <h2>
  * I verify required sub header sections are available #My IDs, Inactive IDs, My Logins, Inactive Logins <h4>
  * I verify that IDs and Logins page buttons are visible #Inactive ids, Add ID, Inactive logins, Add Login
  * I verify that Activity Feed is present
  * I verify that "View All" links direct me to corresponding page url
