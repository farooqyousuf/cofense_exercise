 @regression @idp @desktop
Feature: User sign in with an existing account

  Background:
    * I visit IDP through the "shop" policy

  @smoke
  Scenario: Successful login
    * I login as a "Unverified" user
    * I verify using an ID.me military passcode
    * I should be successfully authenticated

  Scenario: Login with invalid password
    * I create the test conditions for Login with invalid password
    * I login with an invalid password
    * I should see the red alert box error message "The email or password you entered is incorrect. Please try again."

  Scenario: Login with nonexistent email
    * I login as a "nonexistent email" user
    * I should see the red alert box error message "The email or password you entered is incorrect. Please try again."

  # TODO: add scenarios for invalid password and invalid email cases
