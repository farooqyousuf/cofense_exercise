@regression @wallet @desktop @wallet_dashboard
Feature: Test Wallet Dashboard Page Feature

Background:
  * I create "WalletHomepage, WalletDashboard, WalletMyids" page objects
  * I visit "WalletHomepage"
  * I click on the Wallet Sign in link
  * I login to wallet as a "Military" user

Scenario: Verify Wallet Shared Main Nav
  * I verify ID.me logo is present
  * I verify that the main nav Shop link takes me to the correct page
  * I verify that the main nav About link takes me to the correct page
  * I verify that the main nav Wallet link takes me to the correct page
  * I verify that the main nav Business link takes me to the correct page

Scenario: Verify Wallet Sub-Nav bar
  * I verify that the sub-nav Dashboard link directs me to the correct page
  * I verify that the sub-nav IDs and Logins link directs me to the correct page
  * I verify that the sub-nav Settings link directs me to the correct page
  * I verify that the sub-nav Activity link directs me to the correct page

Scenario: Verify Wallet Shared Side Nav
  * I click on the shared side navigation
  * I verify user email is displayed
  * I verify membership date is displayed correctly
  * I verify that View Full Profile link directs me to correct page

Scenario: Verify Dashboard Components
  * I should be on the Wallet dashboard page url
  * I verify that IDs and Logins toggle buttons direct me to corresponding page views #IDs or Logins
  * I verify required main header sections are visible #IDs and Logins, Activity Feed <h2>
  * I verify required sub header sections are visible #My IDs, Inactive IDs, My Logins, Inactive Logins <h4>
  * I verify that IDs and Logins page buttons are visible #Inactive IDs, Add ID, Inactive logins, Add Login
  * I verify that Activity Feed is present
  * I verify that "View All" links direct me to corresponding page url
