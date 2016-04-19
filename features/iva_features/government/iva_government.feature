@regression @iva @government
Feature: Government verification using .gov email

  Background:
    * I visit IDP through the "government" policy
    * I click on the Sign Up link
    * I sign up as a new user
    * I should be on the government verification screen

  # TODO: break this out into the initial email step, admin step, code step
  @smoke @delete_user
  #unique email address
  Scenario: Successful verification with a Government email
    * I submit the government verification form
    * I submit the verification code for "Government Email"
    * I complete the verification process
    * I should be successfully verified as "Federal"

  Scenario: Successfully prompt for all required fields
    * I submit the empty government form
    * I should see error messages on required fields for "Government"
