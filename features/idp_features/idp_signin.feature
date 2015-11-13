@regression @idp @oauth @ios
Feature: User sign in with an existing account

  Background:
    * I visit the OAuth Tester
    * I select the "Marketplace" policy
  
  @smoke  
  Scenario: Successful login
    * I login as a "Unverified" user
    * I should be successfully verified

  Scenario: Login with invalid password
    * I click on the not member link
    * I sign up as a new user
    * I logout of the OAuth Tester
    * I visit the OAuth Tester
    * I select the "Marketplace" policy
    * I login with a "invalid" password
    * I should see the red alert box error message "The email or password you entered is incorrect. Please try again."

  Scenario: Login with invalid email
    * I login with a "invalid" email
    * I should see the red alert box error message "The email or password you entered is incorrect. Please try again."

  # TODO: add scenarios for invalid password and invalid email cases