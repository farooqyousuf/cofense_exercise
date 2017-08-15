@regression @wallet @desktop @wallet_homepage
Feature: Test Wallet Landing Page Feature

Background:
  * I create "WalletHomepage" page objects
  * I visit "WalletHomepage"

@smoke
Scenario: Homepage Content Sections Displayed
  * I verify I am on the wallet homepage
  * I verify that the wallet home hero is displayed

@smoke
Scenario: Wallet User sign-in / sign-up links successfully link
  * I verify the wallet sign in links direct to idp
  * I verify the wallet sign up links direct to idp

@smoke
Scenario: Wallet shared navigation bar successfully link
  * I verify the Wallet shared navigation tab "About" successfully links
  * I verify the Wallet shared navigation tab "Business" successfully links
  * I verify the Wallet shared navigation tab "Shop" successfully links
  * I verify the Wallet shared navigation tab "Wallet" successfully links
