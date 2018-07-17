@regression @mobile_wallet @smoke
Feature: Test Wallet via mobile

  Background:
    * I create "WalletHomepage, WalletNavigation, WalletSettings, WalletDashboard" page objects
    * I open a new window
    * I visit "WalletHomepage"

  Scenario: Homepage Content Sections Displayed
    * I verify I am on the wallet homepage
    * I verify that the wallet home hero is displayed

  Scenario: Wallet User My Account link successfully redirects to IDP
    * I verify the wallet My Account mobile link redirects to idp

  Scenario: Verify Wallet Dashboard Navigation
    * I click on the mobile Wallet My Account link
    * I login to wallet as a "Military" user
    * I should be on the mobile Wallet dashboard page
    * I click on the Dashboard navigation link
    * I check the Wallet dashboard page is visible

    Scenario: Successful User Wallet Sign In
      * I click on the mobile Wallet My Account link
      * I login to wallet as a "Military" user
      * I record the wallet user email
      * I click on the Wallet shared nav link
      * I should see my sign in on the activity feed
