@regression @idp
Feature: User password reset

  Background:
    * I visit IDP through the "marketplace" policy
    * I click on Forgot password

  Scenario: Forgot Your Password
    * I send the forgot password code to a "valid" email account
    * I reset my password
    * I verify I can login with the newly reset password
    * I should be successfully authenticated

  Scenario: Password Reset code can be used no more than 5 times
    * I send the forgot password code to a "valid1" email account
    * I enter a wrong reset password code 6 times to invalidate the reset password code
    * I should see the red alert box error message "You have entered an invalid code too many times. Please request a new code and try again."
    * I request a new reset password code and unlock my account "valid1"
    * I should see the green alert box error message "Your ID.me Wallet password has been successfully reset."

  Scenario: Entering invalid code for password reset
    * I send the forgot password code to a "valid2" email account
    * I enter a wrong reset password code 1 times
    * I should see the red alert box error message "The code you entered is invalid. Please make sure you enter the correct code and try again."

  Scenario: Entering non-existent account email for password reset
    * I send the forgot password code to a "nonexistent" email account
    * I should see the red alert box error message "We couldn't find an ID.me Wallet with the given email address. Please try again."


  # TODO: add scenarios for password entropy when resetting password
