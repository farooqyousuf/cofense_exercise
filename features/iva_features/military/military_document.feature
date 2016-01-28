@regression @iva @military
Feature: Military verification using document upload

  Background:
    * I visit the OAuth Tester
    * I select the "Marketplace Military" policy
    * I click on the Sign Up link
    * I sign up as a new user
    * I should be on the military verification screen

  @smoke @oauth_tester_logout @delete_experian_user
  Scenario: Successful verification as a Service Member
    * I verify using military documentation for "Service Member"
    * I approve the document in IDme admin
    * I complete the verification process
    * I should be successfully verified as "Service Member"