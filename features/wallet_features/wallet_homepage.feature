@regression @wallet @desktop
Feature: Test Wallet Landing Page Feature

Background:
  * I create "WalletHomepage" page objects
  * I visit "WalletHomepage"

@wallet_smoke @smoke
Scenario: Homepage Content Sections Displayed
  * I verify I am on the wallet homepage
  * I verify that the wallet home hero is displayed

@wallet_smoke @smoke
Scenario: Wallet User sign-in / sign-up links successfully link
  * I verify the wallet sign in links direct to idp
  * I verify the wallet sign up links direct to idp

@wallet_smoke @smoke @wip
# TODO Ticket# INT-866
Scenario: Wallet shared navigation bar successfully link
  * I verify the Wallet shared navigation tab "About" successfully links
  * I verify the Wallet shared navigation tab "Business" successfully links
  * I verify the Wallet shared navigation tab "Shop" successfully links
  * I verify the Wallet shared navigation tab "Wallet" successfully links
