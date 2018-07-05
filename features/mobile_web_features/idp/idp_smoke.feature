@regression @ios @mobile_idp
Feature: User account creation

  @smoke @delete_current_user_email
  Scenario: Sign Up new user
    * I open a new window
    * I visit IDP through the "shop" policy
    * I click on the Sign Up link
    * I sign up as a new user
    * I verify a nationally certified EMT user
    * I should be successfully verified as "EMT"

  @smoke
  Scenario: Successful login
    * I visit IDP through the "shop" policy
    * I login as a "Unverified" user
    * I should be successfully authenticated
