@regression @iva @responder @oauth_tester_logout
Feature: Responder verification as an nationally certified EMT

  Background:
    * I visit the OAuth Tester
    * I select the "Marketplace Responder" policy
    * I click on the Sign Up link
    * I sign up as a new user
    * I should be on the responder verification screen

  @smoke @delete_natl_emt
  Scenario: Successful verification
    * I verify using nationally certified EMT credentials
    * I complete the verification process
    * I should be successfully verified as "EMT"

  Scenario: Successfully prompt for all required fields
    * I submit the empty National EMT form
    * I should see error messages on required fields for "National EMT"






