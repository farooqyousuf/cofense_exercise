@regression @idp @desktop
Feature: User account creation

  Background:
    * I visit IDP through the "marketplace" policy
    * I click on the Sign Up link

  @smoke
  Scenario: Successful sign up
    * I sign up as a new user
    * I should be successfully authenticated

  Scenario: Attempt to sign up with only email
    * I fill in the Sign Up textfield
    * I click on the Sign Up button
    * I should see a red highlighted error on the "password, confirm password and tos fields"

  Scenario: Attempt to sign up with email and one password field set
    * I fill in the Sign Up textfield
    * I fill in the Password textfield
    * I click on the Sign Up button
    * I should see a red highlighted error on the "confirm password and tos fields"

  Scenario: Attempt to sign up with email, password, password confirmation
    * I fill in the Sign Up textfield
    * I fill in the Password textfield
    * I fill in the Password Confirmation textfield
    * I click on the Sign Up button
    * I should see a red highlighted error on the "tos field"
