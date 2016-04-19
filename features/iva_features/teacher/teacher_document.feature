@regression @iva @teacher
Feature: Teacher verification using document upload

  Background:
    * I visit IDP through the "government" policy
    * I click on the Sign Up link
    * I sign up as a new user
    * I should be on the teacher verification screen

  @smoke @delete_experian_user1
  #experian/precise id check
  Scenario: Successful verification
    * I verify using teacher documentation
    * I approve the document in IDme admin
    * I complete the verification process
    * I should be successfully verified

  Scenario: Successfully prompt for all required fields
    * I submit the empty Teacher form using "Teacher Document"
    * I should see error messages on required fields for "Teacher Document"
