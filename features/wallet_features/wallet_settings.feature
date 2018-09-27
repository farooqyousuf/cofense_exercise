@regression @wallet @desktop
Feature: Test Wallet Settings Features

  Background:
    * I create "WalletHomepage, WalletDashboard, WalletSettings, WalletNavigation" page objects

  @delete_current_user_email
  Scenario: User deactivates Wallet account and revokes access
    * I visit "WalletHomepage"
    * I click on the Wallet Sign Up Link
    * I sign up as a new user
    * I record the wallet user email
    * I deactivate my Wallet account
    * I confirm that my Wallet session has been terminated
    * I verify my Wallet account has been deactived

  Scenario: Happy Path to Change Password
    * I visit "WalletHomepage"
    * I click on the Wallet Sign Up Link
    * I sign up as a new user
    * I click on the Settings navigation link
    * I click on the Security tab
    * I change the user password in Wallet
    * I should see this message "Your password was successfully updated." on this field ".messages"

  Scenario: Use Incorrect Password to Change Password
    * I visit "WalletHomepage"
    * I click on the Wallet Sign Up Link
    * I sign up as a new user
    * I click on the Settings navigation link
    * I click on the Security tab
    * I attempt to change the password using an incorrect current password
    * I should see this message "Please enter the correct password" on this field "#user_password_validation-error"
