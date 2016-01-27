@regression @iva @military @oauth @document
Feature: Military verification using document upload

  Background:
    * I visit the OAuth Tester
    * I select the "Marketplace Military" policy
    * I click on the Sign Up link
    * I sign up as a new user
    * I should be on the military verification screen

  @smoke
  Scenario: Successful verification as a Service Member
    * I verify using military documentation for "Service Member"
    * I approve the document in IDme admin
    * I complete the verification process
    * I should be successfully verified as "Service Member"