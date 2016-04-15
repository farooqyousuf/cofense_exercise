@regression @iva @responder @oauth_tester_logout
Feature: Responder verification as a police officer

  Background:
    * I visit the OAuth Tester
    * I select the "Marketplace Responder" policy
    * I click on the Sign Up link
    * I sign up as a new user
    * I should be on the responder verification screen
  

  #experian check and also need a unique doc for police  
  @smoke @delete_experian_user1
  Scenario: Successful verification as a police officer
    * I verify using police officer documentation 
    * I approve the document in IDme admin
    * I complete the verification process
    * I should be successfully verified as "Police Officer"

Scenario: Successful prompt for all required fields for Police Officer
    * I submit the empty Police form
    * I should see error messages on required fields for "Police"