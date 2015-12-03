@regression @idp @oauth
Feature: User account lock and unlock

  Background:
    * I visit the OAuth Tester
    * I select the "Marketplace" policy
    * I click on the Sign Up link
    * I sign up as a new user
    * I logout of the OAuth Tester
    * I visit the OAuth Tester
    * I select the "Marketplace" policy
    
  Scenario: User Account locked due to failed logins
    * I lockout my account
    * I click on the unlock account link
    * I unlock my account

  Scenario: Verify login is blocked when account is locked
    * I lockout my account
    * I visit "IDPSignIn"
    * I login as a "current_username" user
    * I should see the red alert box error message "Your account has been locked due to a number of failed sign-in attempts. Please click here to unlock it."

 @oauth_tester_logout
 Scenario: Verify if account can be used after unlocking it
    * I lockout my account
    * I click on the unlock account link
    * I unlock my account
    * I login as a "current_username" user
    * I should be successfully verified

  Scenario: Unlock code can be used no more than 5 times
    * I lockout my account
    * I enter a wrong unlock code 6 times to invalidate the unlock code
    * I should see the red alert box error message "You have entered an invalid code too many times. Please request a new code and try again."   