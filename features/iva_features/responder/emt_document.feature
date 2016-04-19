@regression @iva @responder
Feature: Responder verification as an EMT using document upload

  Background:
    * I visit IDP through the "responder" policy
    * I click on the Sign Up link
    * I sign up as a new user
    * I should be on the responder verification screen

  @smoke @delete_experian_user1
  Scenario: Successful verification
    * I generate a unique doc
    * I verify using EMT doc upload
    * I approve the document in IDme admin
    * I complete the verification process
    * I should be successfully verified as "EMT"

Scenario: Successful prompt for all required fields for EMT Doc Upload
    * I submit the empty EMT doc upload form
    * I should see error messages on required fields for "EMT doc upload"
