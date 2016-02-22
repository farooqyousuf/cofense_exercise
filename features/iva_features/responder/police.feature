@regression @iva @responder @oauth_tester_logout
Feature: Responder verification as a police officer

  Background:
    * I visit the OAuth Tester
    * I select the "Marketplace Responder" policy
    * I click on the Sign Up link
    * I sign up as a new user
    * I should be on the responder verification screen
    
  @smoke @delete_experian_user
  Scenario: Successful verification as a police officer
    * I verify using police officer documentation 
    * I approve the document in IDme admin
    * I complete the verification process
    * I should be successfully verified as "Police Officer"