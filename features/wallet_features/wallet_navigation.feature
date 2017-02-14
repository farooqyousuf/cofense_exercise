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

Scenario: IDs and Logins Page
  * I click on the My IDs navigation link
  * I check the Wallet My IDs page is visible
  * I verify that Ids and Logins toggle buttons direct me to corresponding page views #IDs or Logins
  * I verify required sub header sections are available #My IDs, Inactive IDs, My Logins, Inactive Logins <h4>
  * I verify that IDs and Logins page buttons are visible #Inactive ids, Add ID, Inactive logins, Add Login
  * I add a new ID
  * I verify new ID card and its corresponding text are displayed
  * I click on Logins toggle button
  * I add a new Login
  * I verify new Login card and its corresponding text are displayed

Scenario: Settings Page
  * I click on the Settings navigation link
  * I check the Wallet Settings page is visible
  * I verify that Settings toggle button options direct me to corresponding page views #Profile, Account, Security, Privacy
  * I verify Profile page form fields are present
  * I upload a profile image
  * I verify that Account page settings are present
  * I verify Security page options
  * I verify changing my password
  * I verify changing my email
  * I verify Privacy page text
  * I verify closing my account

Scenario: Activity Feed Page
  * I click on the Activity navigation link
  * I check that Wallet Activity page is visible
