@regression @idp @oauth @desktop
Feature: User account lock and unlock

  Background:
    * I visit IDP through the "marketplace" policy
    * I click on the Sign Up link
    * I sign up as a new user
    * I logout of the OAuth Client
    * I clear the session from Authority
    * I visit IDP through the "marketplace" policy

  Scenario: User Account locked due to failed logins
    * I lockout my account
    * I click on the unlock account link
    * I unlock my account

  Scenario: Verify login is blocked when account is locked
    * I lockout my account
    * I visit "IDPSignIn"
    * I login as a "current_username" user
    * I should see the red alert box error message "Your ID.me Wallet has been locked due to a high number of failed sign-in attempts. Please click here to unlock it."

 Scenario: Verify if account can be used after unlocking it
    * I lockout my account
    * I click on the unlock account link
    * I unlock my account
    * I login as a "current_username" user
    * I should be successfully authenticated

  Scenario: Unlock code can be used no more than 5 times
    * I lockout my account
    * I enter a wrong unlock code 6 times to invalidate the unlock code
    * I should see the red alert box error message "You have entered an invalid code too many times. Please request a new code and try again."

  Scenario: Entering invalid code for unlock code
    * I lockout my account
    * I enter a wrong unlock code 1 time
    * I should see the red alert box error message "The code you entered is invalid. Please make sure you enter the correct code and try again."

  Scenario: Entering non-existent account email for unlock
    * I lockout my account
    * I click on the unlock account link
    * I enter a non-existant account email to attempt to unlock my account
    * I should see the red alert box error message "We couldn't find an ID.me Wallet with the given email address. Please try again."
