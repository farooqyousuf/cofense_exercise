@regression @iva @government @oauth_tester_logout
Feature: Government verification using .gov email

  Background:
    * I visit the OAuth Tester
    * I select the "Marketplace Government" policy
    * I click on the Sign Up link
    * I sign up as a new user
    * I pry
    * I should be on the government verification screen

  # TODO: break this out into the initial email step, admin step, code step
  @smoke
  Scenario: Successful verification with a Government email
    * I submit the government verification form
    * I submit the government verification code
    * I should see the verification success page
    * I complete the verification process
    * I should be successfully verified
    
  Scenario: Successfully prompt for all required fields
    * I submit the empty government form
    * I should see error messages on required fields for "Government"
