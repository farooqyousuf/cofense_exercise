@regression @ios @mobile_idp
Feature: User account creation

  Background:
    * I visit IDP through the "shop" policy
    * I click on the Sign Up link

  @smoke @delete_current_user_email
  Scenario: Sign Up new user
    * I sign up as a new user
    * I verify a military user
    * I should be successfully authenticated
