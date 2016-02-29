@regression @iva @responder @oauth_tester_logout
Feature: Responder verification as a firefighter using document upload

  Background:
    * I visit the OAuth Tester
    * I select the "Marketplace Responder" policy
    * I click on the Sign Up link
    * I sign up as a new user
    * I should be on the responder verification screen

  @smoke @delete_user  
  # combo of experian/precise id check and unique doc
  Scenario: Successful verification as a Firefighter using doc upload
    * I generate a unique doc
    * I verify using firefighter documentation
    * I approve the document in IDme admin
    * I complete the verification process
    * I should be successfully verified as "Firefighter"

Scenario: Successful prompt for all required fields for Firefighter Doc Upload
    * I submit the empty Firefighter doc upload form
    * I should see error messages on required fields for "Firefighter doc upload"