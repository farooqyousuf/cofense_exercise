@regression @iva @student @desktop
Feature: Student verification using student credentials

  Background:
    * I visit IDP through the "student" policy
    * I click on the Sign Up link
    * I sign up as a new user
    * I should be on the student verification screen

  @smoke @delete_user
  #Unique combo of ssn and dob to verify
  Scenario: Successful verification
    * I verify using student credentials
    * I complete the verification process
    * I should be successfully verified

  Scenario: Successfully prompt for all required fields
    * I submit the empty Student form using "Student Credentials"
    * I should see error messages on required fields for "Student Credentials"
