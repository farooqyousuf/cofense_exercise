@regression @idp @oauth
Feature: User account creation

  Background:
    * I visit the OAuth Tester
    * I select the "Marketplace" policy
    * I click on the Sign Up link
  
  @smoke  
  Scenario: Successful sign up
    * I sign up as a new user
    * I should be successfully verified

  Scenario: Attempt to sign up with only email
    * I fill in the Sign Up textfield
    * I click on Sign Up
    * I should see an error on the "Password" field
    * I should see an error on the "Confirm password" field
    * I should see an error on the "I accept the ID.me terms of use and privacy policy" field

  # Scenario: Attempt to sign up with email and one password field set
  #   * I fill in the Sign Up textfield
  #   * I click on Sign Up
  #   * I should see an error on the "Confirm password" field
  #   * I should see an error on the "I accept the ID.me terms of use and privacy policy" field

  # Scenario: Attempt to sign up with email, password, password confirmation
  #   * I fill in the Sign Up textfield
  #   * I fill in the Password textfield
  #   * I fill in the Password Confirmation textfield
  #   * I click on Sign Up
  #   * I should see an error on the "I accept the ID.me terms of use and privacy policy" field
