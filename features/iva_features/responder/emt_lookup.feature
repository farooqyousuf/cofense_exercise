@regression @iva @responder @oauth_tester_logout
Feature: Responder verification as an EMT using state lookup

  Background:
    * I visit the OAuth Tester
    * I select the "Marketplace Responder" policy
    * I click on the Sign Up link
    * I sign up as a new user
    * I should be on the responder verification screen

  @smoke @delete_experian_user1
  Scenario: Successful verification
    * I verify using EMT state lookup
    * I approve the EMT verification in IDme admin
    * I complete the verification process
    * I should be successfully verified as "EMT"
