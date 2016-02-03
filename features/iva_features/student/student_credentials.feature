@regression @iva @student @oauth_tester_logout
Feature: Student verification using student credentials

  Background:
    * I visit the OAuth Tester
    * I select the "Marketplace Student" policy
    * I click on the Sign Up link
    * I sign up as a new user
    * I should be on the student verification screen

  @smoke
  #Unique combo of ssn and dob to verify
  Scenario: Successful verification
    * I verify using student credentials
    * I complete the verification process
    * I should be successfully verified

  # Scenario: Successfully prompt for all required fields for Service Member
  #   * I submit the empty Student form using "Student Credentials"
  #   * I should see error messages on required fields for "Student Credentials"