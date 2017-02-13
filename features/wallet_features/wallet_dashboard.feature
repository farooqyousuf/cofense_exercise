@regression @wallet @desktop
Feature: Test Wallet Dashboard Page Feature

Background:
  * I create "WalletHomepage,WalletDashboard,WalletMyids" page objects
  * I visit "WalletHomepage"

@smoke
Scenario: Dashboard Smoke Test
  * I click on the Wallet Sign Up link (omit?)
  * I sign up as a new user (omit?)


Scenario: Verify Shared Nav and Sub-Nav Bars
  * I verify ID.me logo is present
  * I verify that all the main nav tab links are directing to correct pages
  * I verify that all the sub-nav tabs are directing to correct pages
  * I click on the shared side navigation #(move to navigation feature)
  * I click sign out on the shared side navigation #(move to navigation feature)

Scenario: Verify Dashboard Components
  * I should be on the Wallet dashboard page #url
  * I verify that Ids and Logins toggle buttons direct me to corresponding page views #IDs or Logins
  * I verify required main header sections are available ##IDs and Logins, Activity Feed (h2 headers)
  * I verify required sub header sections are available # Active IDs , Inactive IDs, Active Logins, Inactive Logins (h4 headers)
  * I verify that IDs and Logins page buttons are visible #inactive ids, add ID, inactive logins, add Login
  * I verify that Activity Feed is present
  * I verify that "View All" links direct me to corresponding page url
