@regression @ios @mobile_idp @smoke
Feature: User account creation

  Background:
    * I open a new window

  @delete_current_user_email
  Scenario: Sign Up new user
    * I visit IDP through the "military" policy
    * I click on the Sign Up link
    * I sign up as a new user
    * I verify a military user
    * I should be successfully verified

  Scenario: Successful login
    * I visit IDP through the "shop" policy
    * I login as a "Unverified" user
    * I should be successfully authenticated
