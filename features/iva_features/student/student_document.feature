@regression @iva @student @oauth_tester_logout
Feature: Student verification using document upload

Background:
    * I visit the OAuth Tester
    * I select the "Marketplace Student" policy
    * I click on the Sign Up link
    * I sign up as a new user
    * I should be on the student verification screen

  @smoke @delete_experian_user1
  #unique dob/ssn and vetted by Experian/PreciseID, have to use their test data
  Scenario: Successful verification
    * I verify using student documentation
    * I approve the document in IDme admin
    * I complete the verification process
    * I should be successfully verified

  Scenario: Successfully prompt for all required fields
    * I submit the empty Student form using "Student Document"
    * I should see error messages on required fields for "Student Document"    