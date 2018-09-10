@regression @idp @oauth @desktop
Feature: User account lock and unlock

  Background:
    * I visit IDP through the "shop" policy
    * I click on the Sign Up link
    * I sign up as a new user
    * I clear the session from Authority
    * I visit IDP through the "shop" policy

  @delete_current_user_email
  Scenario: User Account locked due to failed logins
    * I lockout my account
    * I click on the unlock account link
    * I unlock my account

  @delete_current_user_email
  Scenario: Verify login is blocked when account is locked
    * I lockout my account
    * I visit "IDPSignIn"
    * I login as a "current_username" user
    * I should see the red alert box error message "Your account has been locked due to a high number of failed sign-in attempts. Please click here to unlock it."

  @delete_current_user_email
  Scenario: Verify if account can be used after unlocking it
    * I lockout my account
    * I click on the unlock account link
    * I unlock my account
    * I login as a "current_username" user
    * I verify a military user
    * I should be successfully authenticated

  @delete_current_user_email
  Scenario: Unlock code can be used no more than 5 times
    * I lockout my account
    * I enter a wrong unlock code 6 times to invalidate the unlock code
    * I should see the red alert box error message "You have entered an invalid code too many times. Please request a new code and try again."

  @delete_current_user_email
  Scenario: Entering invalid code for unlock code
    * I lockout my account
    * I enter a wrong unlock code 1 time
    * I should see the red alert box error message "The code you entered is invalid. Please make sure you enter the correct code and try again."

  @delete_current_user_email
  Scenario: Entering non-existent account email for unlock
    * I lockout my account
    * I click on the unlock account link
    * I enter a non-existant account email to attempt to unlock my account
    * I should see the red alert box error message "We could not find an account associated with that email. Please check the email address entered and try again."
