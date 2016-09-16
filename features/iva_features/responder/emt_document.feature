@regression @iva @responder @desktop @emt
Feature: Responder verification as an EMT using document upload

  Background:
    * I visit IDP through the "responder" policy
    * I click on the Sign Up link
    * I sign up as a new user
    * I should be on the responder verification screen

  @delete_experian_user1
  Scenario: Successful verificaton with doc upload
    * I generate a unique doc
    * I verify using EMT doc upload
    * I approve the document in IDme admin
    * I complete the verification process
    * I should be successfully verified as "EMT"
