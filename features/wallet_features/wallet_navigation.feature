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

Scenario: Verify Wallet IDs and Logins Page
  * I click on the My IDs navigation link
  * I check the My IDs page is visible
  * I verify that Ids and Logins toggle buttons direct me to corresponding page views #IDs or Logins
  * I verify required sub header sections are available #My IDs, Inactive IDs, My Logins, Inactive Logins <h4>
  * I verify that IDs and Logins page buttons are visible #Inactive ids, Add ID, Inactive logins, Add Login

Scenario: Add a new ID to Wallet
  * I add a new ID
  * I verify new ID card and its corresponding text are displayed

Scenario: Add a new Login to Wallet
  * I click on Logins toggle button
  * I add a new Login
  * I verify new Login card and its corresponding text are displayed

Scenario: Verify Wallet Settings Page
  * I click on the Settings navigation link
  * I check the Wallet Settings page is visible
  * I verify that Settings toggle button options direct me to corresponding page views #Profile, Account, Security, Privacy

Scenario: Verify Wallet Settings Profile View
  * I verify Profile view form fields are present
  * I upload a profile image

Scenario: Verify Wallet Settings Account View
  * I verify that Account view settings are present

Scenario: Verify Wallet Settings Security View
  * I verify Security page options

Scenario: Change Password in Wallet
  * I verify changing my password

Scenario: Change Email in Wallet
  * I verify changing my email

Scenario: Verify Wallet Security Privacy View
  * I verify Privacy page text
  * I verify closing my account

Scenario: Wallet Activity Feed Page
  * I click on the Activity navigation link
  * I check that Wallet Activity page is visible
