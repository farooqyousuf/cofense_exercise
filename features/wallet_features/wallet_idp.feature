@regression @wallet @desktop
Feature: Test Wallet IDP Features

  Background:
    * I create "WalletHomepage, WalletDashboard, WalletSettings" page objects

  @delete_current_user_email @smoke
  Scenario: Successful User Wallet Sign up
    * I visit "WalletHomepage"
    * I click on the Wallet Sign Up Link
    * I sign up as a new user
    * I visit "WalletDashboard"
    * I should see my sign up on the activity feed

  @smoke @lightning
  Scenario: Successful User Wallet Sign In
    * I visit "WalletHomepage"
    * I click on the Wallet Sign In Link
    * I login to wallet as a "Military" user
    * I visit "WalletDashboard"
    * I should see my sign in on the activity feed

  Scenario: Failed User Wallet Sign In
    * I visit "WalletHomepage"
    * I click on the Wallet Sign In Link
    * I fail a attempt to login to wallet
    * I should see a IDP failed attempt sign in error
    * I login to wallet as a "Military" user
    * I should see my failed sign in on the activity feed

  @ignore @delete_current_user_email
  ## Currently unable to unlock account in tests without verification code
  Scenario: User Wallet account locked and unlocked via code
    * I visit "WalletHomepage"
    * I click on the Wallet Sign Up Link
    * I sign up as a new user
    * I log out of Wallet user account
    * I click on the Wallet My Account link
    * I lockout my account
    * I click on the unlock account link
    * I unlock my account
    * I login as a "current_username" user
    * I verify my Wallet lock and unlock on the Wallet activity feed

  @delete_linkedin_user
  Scenario: User Signs up in Wallet via Social Federation
    * I visit "WalletHomepage"
    * I click on the Wallet Sign Up Link
    * I signup with LinkedIn social federation
    * I verify my Wallet LinkedIn Social Federation login

  @delete_linkedin_user @ignore @wip
  Scenario: User Signs in Wallet via Social Federation
    * I visit "WalletHomepage"
    * I click on the Wallet Sign Up Link
    * I signup with LinkedIn social federation
    * I log out of Wallet user account
    * I visit "WalletHomepage"
    * I click on the Wallet My Account link
    * I signin with LinkedIn social federation again
    * I verify my Wallet Linkedin Social Federation signin
